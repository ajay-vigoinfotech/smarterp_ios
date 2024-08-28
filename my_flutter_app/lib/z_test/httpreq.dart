import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_flutter_app/view/pages/home_page.dart';

class Httpreq extends StatefulWidget {
  const Httpreq({super.key});

  @override
  State<Httpreq> createState() => _HttpreqState();
}

class _HttpreqState extends State<Httpreq> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _bodyController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> makeRequest() async {
    final uri = Uri.parse('http://smarterp.live/token');

    try {
      final response = await http.post(
        uri,
        body: {
          'grant_type': "password",
          'username': "${_titleController.text}/${_bodyController.text}",
          'password': _passwordController.text,
        },
      );

      if (response.statusCode == 200) {
        // print('Response..: ${response.body}');
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const HomePage()));
      } else {
        // print('Error: ${response.statusCode}');
      }
    } catch (e) {
      //print('Exception: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: 'Partner Code'),
            ),
            TextFormField(
              controller: _bodyController,
              decoration: const InputDecoration(labelText: 'User ID'),
            ),
            TextFormField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: false,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: makeRequest,
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
