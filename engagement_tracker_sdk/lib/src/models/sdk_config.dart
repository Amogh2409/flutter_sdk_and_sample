class SdkConfig {
  final String apiEndpoint;
  final String apiKey;
  final String encryptionKey;
  final bool enableDebugLogging;
  final bool enableAutoFlush;
  final Duration flushInterval;

  SdkConfig({
    required this.apiEndpoint,
    required this.apiKey,
    required this.encryptionKey,
    this.enableDebugLogging = false,
    this.enableAutoFlush = true,
    this.flushInterval = const Duration(seconds: 30),
  }) {
    if (encryptionKey.length < 32) {
      throw ArgumentError('Encryption key must be at least 32 characters');
    }
  }
}

