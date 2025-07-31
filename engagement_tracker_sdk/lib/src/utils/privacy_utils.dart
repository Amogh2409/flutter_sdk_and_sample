import '../models/engagement_event.dart';  // Use relative path

class PrivacyUtils {
  static Map<String, dynamic> anonymizeEvent(EngagementEvent event) {
    final json = event.toJson();

    // Anonymize potentially identifiable information
    if (json['parameters'] != null) {
      json['parameters'] = _anonymizeParameters(json['parameters']);
    }

    // Hash device ID for additional privacy
    json['device_id'] = _hashId(json['device_id']);

    return json;
  }

  static Map<String, dynamic> _anonymizeParameters(Map<String, dynamic> params) {
    return params.map((key, value) {
      if (key == 'email' || key == 'phone' || key == 'name') {
        return MapEntry(key, 'REDACTED');
      }
      if (value is String && value.contains('@')) {
        return MapEntry(key, 'REDACTED_EMAIL');
      }
      return MapEntry(key, value);
    });
  }

  static String _hashId(String id) {
    return 'HASHED_${id.hashCode}';
  }
}