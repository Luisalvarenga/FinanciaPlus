import 'package:flutter/foundation.dart';
import 'package:image/image.dart' as img;

enum ImageQualityIssue {
  unreadable,
  tooDark,
  tooBright,
  blurry,
}

class ImageQuality {
  const ImageQuality({
    required this.brightness,
    required this.sharpness,
    required this.issues,
  });

  /// Average luminance, from 0 (black) to 255 (white).
  final double brightness;

  /// Variance of the Laplacian: the lower, the blurrier.
  final double sharpness;

  final List<ImageQualityIssue> issues;

  bool get isAcceptable => issues.isEmpty;

  /// False when the file is not an image at all.
  bool get isReadable =>
      !issues.contains(ImageQualityIssue.unreadable);
}

/// Checks a captured photo for poor lighting and blur before it is
/// used, the two most frequent causes of failed document captures.
///
/// It is pure Dart, so it behaves the same on every platform.
class ImageQualityAnalyzer {
  ImageQualityAnalyzer._();

  /// Photos are scaled down to this width before measuring, which
  /// keeps the analysis fast and the thresholds comparable.
  static const int analysisWidth = 480;

  // Starting values. They should be tuned with real captures
  // from the devices the app is released on.
  static const double minBrightness = 60;
  static const double maxBrightness = 215;
  static const double minSharpness = 60;

  /// Runs in a background isolate so the UI stays responsive.
  static Future<ImageQuality> analyze(Uint8List bytes) {
    return compute(analyzeSync, bytes);
  }

  static ImageQuality analyzeSync(Uint8List bytes) {
    final decoded = _decode(bytes);

    if (decoded == null) {
      return const ImageQuality(
        brightness: 0,
        sharpness: 0,
        issues: [ImageQualityIssue.unreadable],
      );
    }

    final image = decoded.width > analysisWidth
        ? img.copyResize(decoded, width: analysisWidth)
        : decoded;

    final width = image.width;
    final height = image.height;

    final luminance = Float64List(width * height);
    var luminanceSum = 0.0;

    for (final pixel in image) {
      final value =
          (pixel.luminanceNormalized * 255).toDouble();

      luminance[pixel.y * width + pixel.x] = value;
      luminanceSum += value;
    }

    final brightness = luminanceSum / luminance.length;
    final sharpness = _laplacianVariance(luminance, width, height);

    return ImageQuality(
      brightness: brightness,
      sharpness: sharpness,
      issues: [
        if (brightness < minBrightness) ImageQualityIssue.tooDark,
        if (brightness > maxBrightness) ImageQualityIssue.tooBright,
        if (sharpness < minSharpness) ImageQualityIssue.blurry,
      ],
    );
  }

  static img.Image? _decode(Uint8List bytes) {
    try {
      return img.decodeImage(bytes);
    } catch (exception) {
      return null;
    }
  }

  /// A sharp photo has strong edges, so the Laplacian (how much a
  /// pixel differs from its neighbours) varies a lot. A blurry
  /// photo has soft edges and a low variance.
  static double _laplacianVariance(
    Float64List luminance,
    int width,
    int height,
  ) {
    if (width < 3 || height < 3) {
      return 0;
    }

    var sum = 0.0;
    var sumOfSquares = 0.0;
    var count = 0;

    for (var y = 1; y < height - 1; y++) {
      for (var x = 1; x < width - 1; x++) {
        final index = y * width + x;

        final laplacian = 4 * luminance[index] -
            luminance[index - 1] -
            luminance[index + 1] -
            luminance[index - width] -
            luminance[index + width];

        sum += laplacian;
        sumOfSquares += laplacian * laplacian;
        count++;
      }
    }

    final mean = sum / count;

    return sumOfSquares / count - mean * mean;
  }
}
