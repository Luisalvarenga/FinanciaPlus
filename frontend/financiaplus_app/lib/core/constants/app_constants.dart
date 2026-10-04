class AppConstants {
  AppConstants._();

  static const String appName = 'FinanciaPlus';

  /// Defaults to the deployed API. To use a backend running on your
  /// own machine, pass its address when starting the app:
  ///
  ///   flutter run --dart-define=API_BASE_URL=http://localhost:8080
  ///
  /// A phone or emulator needs the computer's network address
  /// instead of localhost, for example http://192.168.1.10:8080.
  static const String apiBaseUrl = String.fromEnvironment(
    'API_BASE_URL',
    defaultValue: 'https://financiaplus.onrender.com',
  );
}
