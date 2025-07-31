import 'dart:async';
import 'dart:convert';
import '../services/storage_service.dart';
import '../models/engagement_event.dart';  // Correct import
import '../models/sdk_config.dart';
import '../services/encryption_service.dart';
import '../services/network_service.dart';
import '../utils/logger.dart';
import '../utils/privacy_utils.dart';
import 'session_manager.dart' hide SessionManager;  // Removed hide clause

class TrackerCore {
  final StorageService _storage = StorageService();
  final NetworkService _network = NetworkService();
  final EncryptionService _encryption = EncryptionService();
  final SessionManager _sessionManager = SessionManager();

  SdkConfig? _config;
  Timer? _flushTimer;
  bool _isInitialized = false;

  String get sessionId => _sessionManager.sessionId;
  String get deviceId => _sessionManager.deviceId;

  Future<void> initialize(SdkConfig config) async {
    if (_isInitialized) return;

    _config = config;
    Logger.enabled = config.enableDebugLogging;

    try {
      await _sessionManager.initialize();
      await _storage.initialize();

      if (config.enableAutoFlush) {
        _startFlushTimer();
      }

      _isInitialized = true;
      Logger.log('SDK initialized successfully');
    } catch (e, stack) {
      Logger.error('Initialization failed', e, stack);
      rethrow;
    }
  }

  void trackEvent(EngagementEvent event) {
    if (!_isInitialized) {
      Logger.error('SDK not initialized. Call initialize() first');
      return;
      
    }

    try {
      // Anonymize and encrypt event
      final anonymized = PrivacyUtils.anonymizeEvent(event);
      final encrypted = _encryption.encryptData(
        json.encode(anonymized),
        _config!.encryptionKey,
      );

      _storage.storeEvent(encrypted);
      Logger.log('Event tracked: ${event.eventType}');
    } catch (e, stack) {
      Logger.error('Error tracking event', e, stack);
    }
  }

  void _startFlushTimer() {
    _flushTimer?.cancel();
    _flushTimer = Timer.periodic(
      _config!.flushInterval,
      (_) => _flushEvents(),
    );
  }

  Future<void> _flushEvents() async {
    if (!_isInitialized) return;

    try {
      final events = await _storage.getPendingEvents();
      if (events.isEmpty) return;

      final decryptedBatch = events.map((e) {
        final decrypted = _encryption.decryptData(e, _config!.encryptionKey);
        return json.decode(decrypted) as Map<String, dynamic>;
      }).toList();

      final success = await _network.sendEvents(
        decryptedBatch,
        _config!.apiEndpoint,
        _config!.apiKey,
      );

      if (success) {
        await _storage.clearEvents(events);
        Logger.log('Flushed ${events.length} events to server');
      } else {
        Logger.log('Failed to flush events. Will retry later');
      }
    } catch (e, stack) {
      Logger.error('Error flushing events', e, stack);
    }
  }

  Future<void> flushEvents() async {
    await _flushEvents();
  }

  Future<void> close() async {
    _flushTimer?.cancel();
    await _flushEvents();
    await _storage.close();
    _isInitialized = false;
    Logger.log('SDK closed successfully');
  }
}