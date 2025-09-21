class AppConstants {
  // Sync Configuration
  static const int maxRetryAttempts = 3;
  static const Duration retryDelay = Duration(seconds: 2);
  static const Duration syncInterval = Duration(minutes: 5);
  static const Duration connectionTimeout = Duration(seconds: 30);

  // Storage Configuration
  static const int maxCacheSize = 1000;
  static const Duration cacheExpiration = Duration(hours: 24);

  // Performance Configuration
  static const int batchSize = 50;
  static const Duration debounceDelay = Duration(milliseconds: 300);

  // UI Configuration
  static const double defaultPadding = 16.0;
  static const double borderRadius = 8.0;
  static const Duration animationDuration = Duration(milliseconds: 300);
}
