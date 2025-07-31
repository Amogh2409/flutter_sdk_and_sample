class Logger {
  static bool enabled = false;

  static void log(String message) {
    if (enabled) {
      print('[EngagementTracker] INFO: $message');
    }
  }

  static void error(String message, [dynamic error, StackTrace? stackTrace]) {
    if (enabled) {
      print('[EngagementTracker] ERROR: $message');
      if (error != null) print('Error: $error');
      if (stackTrace != null) print('StackTrace: $stackTrace');
    }
  }
}