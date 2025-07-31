import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkService {
  Future<bool> sendEvents(
    List<Map<String, dynamic>> events,
    String apiEndpoint,
    String apiKey,
  ) async {
    final response = await http.post(
      Uri.parse(apiEndpoint),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $apiKey',
      },
      body: json.encode({
        'events': events,
        'sent_at': DateTime.now().toIso8601String(),
      }),
    );

    return response.statusCode == 200;
  }
}

