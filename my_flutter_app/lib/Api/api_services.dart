// import '../model/login_model.dart';
// import 'package:http/http.dart' as http;
//
// class ApiService {
//   final String baseUrl = 'https://smartep.live';
//
//   Future<bool> makeRequest(LoginRequest request) async {
//     final url = Uri.parse('$baseUrl/token');
//
//     try {
//       final response = await http.post(
//         url,
//         headers: {
//           'Content-Type': 'application/x-www-form-urlencoded',
//         },
//         body: request.toMap(),
//       );
//
//       if (response.statusCode == 200) {
//         return true;
//       } else {
//         return false;
//       }
//     } catch (e) {
//       print('Exception: $e');
//       return false;
//     }
//   }
// }
//
//
// login_page.dart
//
// import 'package:flutter/material.dart';
// import 'package:my_flutter_app/model/login_model.dart';
// import 'package:my_flutter_app/view/widgets/privacy_policy.dart';
// import '../../Api/api_services.dart';
// import 'home_page.dart';
//
// class LoginPage extends StatefulWidget {
//   const LoginPage({super.key});
//
//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }
//
// class _LoginPageState extends State<LoginPage> {
//   final TextEditingController _titleController = TextEditingController();
//   final TextEditingController _bodyController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//
//   final ApiService _apiService = ApiService();
//
//   Future<void>_onSubmit() async {
//     final loginRequest = LoginRequest(
//       grantType: "password",
//       username: "${_titleController.text}/${_bodyController.text}",
//       password: _passwordController.text,
//     );
//
//     final success = await _apiService.makeRequest(loginRequest);
//
//     if (success) {
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => const HomePage()),
//       );
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Login failed. Please try again.')),
//       );
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Image.asset('assets/images/login_image.jpeg'),
//               const SizedBox(height: 50),
//               TextFormField(
//                 controller: _titleController,
//                 decoration: const InputDecoration(labelText: 'Partner Code'),
//               ),
//               const SizedBox(height: 10),
//               TextFormField(
//                 controller: _bodyController,
//                 decoration: const InputDecoration(labelText: 'User ID'),
//               ),
//               const SizedBox(height: 10),
//               TextFormField(
//                 controller: _passwordController,
//                 decoration: const InputDecoration(labelText: 'Password'),
//                 obscureText: true,
//               ),
//               const SizedBox(height: 40),
//               ElevatedButton(
//                 onPressed: _onSubmit,  // Pass the function reference, not the result
//                 child: const Text('Submit'),
//               ),
//               const SizedBox(height: 20),
//               const PrivacyPolicy(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
//
