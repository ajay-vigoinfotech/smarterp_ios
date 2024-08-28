import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = 'http://tiger4.smartep.live';

  Future<Map<String, dynamic>> login(String partnerCode, String userId, String password) async {
    final url = Uri.parse('$baseUrl/token');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'partnerCode': partnerCode,
        'userId': userId,
        'password': password,
      }),
    );

    // Print request details
    print('Request URL: ${response.request?.url}');
    print('Request Body: ${response.request?.method}');

    // Print response details
    print('Response Status: ${response.statusCode}');
    print('Response Body: ${response.body}');


    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to login');
    }
  }
}
