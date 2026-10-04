import 'dart:typed_data';

import 'package:financiaplus_app/core/media/image_quality_analyzer.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image/image.dart' as img;

/// A well-lit image with strong edges, similar to printed text.
img.Image _sharpImage({int light = 200, int dark = 70}) {
  final image = img.Image(width: 640, height: 400);

  for (final pixel in image) {
    final isLight = ((pixel.x ~/ 8) + (pixel.y ~/ 8)).isEven;
    final value = isLight ? light : dark;

    pixel.setRgb(value, value, value);
  }

  return image;
}

Uint8List _encode(img.Image image) {
  return Uint8List.fromList(img.encodeJpg(image, quality: 95));
}

void main() {
  test('accepts a sharp, well-lit photo', () {
    final quality = ImageQualityAnalyzer.analyzeSync(
      _encode(_sharpImage()),
    );

    expect(quality.issues, isEmpty);
    expect(quality.isAcceptable, isTrue);
  });

  test('flags a blurry photo', () {
    final blurred = img.gaussianBlur(_sharpImage(), radius: 12);

    final quality = ImageQualityAnalyzer.analyzeSync(
      _encode(blurred),
    );

    expect(quality.issues, contains(ImageQualityIssue.blurry));
  });

  test('flags a photo taken with poor lighting', () {
    final quality = ImageQualityAnalyzer.analyzeSync(
      _encode(_sharpImage(light: 45, dark: 5)),
    );

    expect(quality.issues, contains(ImageQualityIssue.tooDark));
  });

  test('flags an overexposed photo', () {
    final quality = ImageQualityAnalyzer.analyzeSync(
      _encode(_sharpImage(light: 255, dark: 225)),
    );

    expect(quality.issues, contains(ImageQualityIssue.tooBright));
  });

  test('reports a file that is not an image', () {
    final quality = ImageQualityAnalyzer.analyzeSync(
      Uint8List.fromList([1, 2, 3, 4]),
    );

    expect(quality.issues, [ImageQualityIssue.unreadable]);
    expect(quality.isReadable, isFalse);
  });
}
