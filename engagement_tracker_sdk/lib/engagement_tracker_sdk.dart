import 'package:engagement_tracker_sdk/src/core/tracker_core.dart';
import 'package:engagement_tracker_sdk/src/models/engagement_event.dart';
import 'package:engagement_tracker_sdk/src/models/sdk_config.dart';

/// Main SDK class for engagement tracking
class EngagementTracker {
  static final TrackerCore _core = TrackerCore();

  /// Initialize the SDK with configuration
  static Future<void> initialize(SdkConfig config) async {
    await _core.initialize(config);
  }

  /// Track content engagement (articles, videos, etc.)
  static void trackContentEngagement({
    required String contentId,
    required String contentType,
    required double completionRate,
  }) {
    _core.trackEvent(EngagementEvent.contentEngagement(
      contentId: contentId,
      contentType: contentType,
      completionRate: completionRate,
      sessionId: _core.sessionId,
      deviceId: _core.deviceId,
    ));
  }

  /// Track feature usage within the app
  static void trackFeatureUsage({
    required String featureName,
    Map<String, dynamic>? parameters,
  }) {
    _core.trackEvent(EngagementEvent.featureUsage(
      featureName: featureName,
      parameters: parameters,
      sessionId: _core.sessionId,
      deviceId: _core.deviceId,
    ));
  }

  /// Track reward-related activities
  static void trackRewardActivity({
    required String rewardId,
    required String action,
  }) {
    _core.trackEvent(EngagementEvent.rewardActivity(
      rewardId: rewardId,
      action: action,
      sessionId: _core.sessionId,
      deviceId: _core.deviceId,
    ));
  }

  /// Track social actions (shares, likes, etc.)
  static void trackSocialAction({
    required String contentId,
    required String actionType,
  }) {
    _core.trackEvent(EngagementEvent.socialAction(
      contentId: contentId,
      actionType: actionType,
      sessionId: _core.sessionId,
      deviceId: _core.deviceId,
    ));
  }

  /// Track session events (start, end, etc.)
  static void trackSessionEvent(String eventType, {int? durationSeconds}) {
    _core.trackEvent(EngagementEvent.session(
      eventType: eventType,
      durationSeconds: durationSeconds,
      sessionId: _core.sessionId,
      deviceId: _core.deviceId,
    ));
  }

  /// Manually flush events to the server
  static Future<void> flushEvents() async {
    await _core.flushEvents();
  }

  /// Close the SDK and release resources
  static Future<void> close() async {
    await _core.close();
  }
}