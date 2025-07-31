import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

class SessionManager {
  static const _sessionKey = 'engagement_session_id';
  static const _deviceKey = 'engagement_device_id';

  String? _sessionId;
  String? _deviceId;
  DateTime? _sessionStart;

  String get sessionId => _sessionId ?? '';
  String get deviceId => _deviceId ?? '';

  Future<void> initialize() async {
    final prefs = await SharedPreferences.getInstance();

    // Get or create device ID
    _deviceId = prefs.getString(_deviceKey);
    if (_deviceId == null) {
      _deviceId = const Uuid().v4();
      await prefs.setString(_deviceKey, _deviceId!);
    }

    // Start new session
    _startNewSession();
  }

  void _startNewSession() {
    _sessionId = const Uuid().v4();
    _sessionStart = DateTime.now();
  }

  void endSession() {
    _sessionId = null;
    _sessionStart = null;
  }

  void refreshSession() {
    _startNewSession();
  }
}