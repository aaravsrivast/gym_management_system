import 'package:http/http.dart' as http;
import 'dart:convert';
import '../utils/storage.dart';

class ApiService {
  static const String baseUrl = 'http://127.0.0.1:8000';

  static Future<http.Response> get(String endpoint) async {
    final token = await Storage.read("access_token");
    return await http.get(
      Uri.parse('$baseUrl/$endpoint'),
      headers: {"Authorization": "Bearer $token"},
    );
  }

  static Future<http.Response> post(String endpoint, Map<String, dynamic> body) async {
    final token = await Storage.read("access_token");
    return await http.post(
      Uri.parse('$baseUrl/$endpoint'),
      headers: {
        "Authorization": "Bearer $token",
        "Content-Type": "application/json"
      },
      body: jsonEncode(body),
    );
  }
}