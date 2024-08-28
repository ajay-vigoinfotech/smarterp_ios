// import 'dart:convert';
// import 'package:http/http.dart' as http;
//
// class ApiService {
//   final String baseUrl = 'http://smartep.live';
//
//   Future<Map<String, dynamic>> login(dynamic partnerCodeController, dynamic userIdController, dynamic passwordController) async {
//     final url = Uri.parse('$baseUrl/token');
//     final response = await http.post(
//       url,
//       headers: {'Content-Type': 'application/json'},
//       body: jsonEncode({
//         'grant_type': "password",
//         'username': "${partnerCodeController.text}/${userIdController.text}",
//         'password': "password",
//       }),
//     );
//
//     if (response.statusCode == 200) {
//       return jsonDecode(response.body);
//     } else {
//       throw Exception('Failed to login');
//     }
//   }
// }
