import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'http://127.0.0.1:8000/api/v1';

  static Future<List<dynamic>?> getVibes() async {
    try {
      final response = await http
          .get(Uri.parse('$baseUrl/vibes'))
          .timeout(const Duration(seconds: 4));
      if (response.statusCode == 200) {
        return jsonDecode(response.body) as List<dynamic>;
      }
    } catch (_) {}
    return null;
  }

  static Future<List<dynamic>?> getHangouts() async {
    try {
      final response = await http
          .get(Uri.parse('$baseUrl/hangouts'))
          .timeout(const Duration(seconds: 4));
      if (response.statusCode == 200) {
        return jsonDecode(response.body) as List<dynamic>;
      }
    } catch (_) {}
    return null;
  }

  static Future<Map<String, dynamic>?> getProfile() async {
    try {
      final response = await http
          .get(Uri.parse('$baseUrl/profile'))
          .timeout(const Duration(seconds: 4));
      if (response.statusCode == 200) {
        return jsonDecode(response.body) as Map<String, dynamic>;
      }
    } catch (_) {}
    return null;
  }
}
