import 'package:flutter/material.dart';
import 'package:flutter_smart_app/Api/api_service.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _partnerCodeController = TextEditingController();
  final TextEditingController _userIdController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool isPasswordVisible = false;
  final ApiService _apiService = ApiService();
  final _formKey = GlobalKey<FormState>();

  Future<void> _login() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    try {
      final response = await _apiService.login(
        _partnerCodeController.text,
        _userIdController.text,
        _passwordController.text,
      );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Success')),
      );

      // Handle the response, e.g., navigate to the main screen
      // Navigator.pushReplacement(
      //   context,
      //   MaterialPageRoute(builder: (context) => MainScreen()),
      // );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Login failed. Please try again.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 40),
                Image.asset('assets/login_image.jpeg', width: 200, height: 200),
                const Text(
                  'Smart ERP',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _partnerCodeController,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.business),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 2.0),
                        borderRadius: BorderRadius.circular(12.0)
                    ),
                    labelText: 'Partner Code',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Partner Code is required';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _userIdController,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.person),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 2.0),
                        borderRadius: BorderRadius.circular(12.0)
                    ),
                    labelText: 'User ID',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'User ID is required';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _passwordController,
                  obscureText: !isPasswordVisible,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.password),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black, width: 2.0),
                        borderRadius: BorderRadius.circular(12.0)
                    ),
                    labelText: 'Password',
                    suffixIcon: IconButton(
                      icon: Icon(
                        isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          isPasswordVisible = !isPasswordVisible;
                        });
                      },
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Password is required';
                    }
                    return null; // Return null if the input is valid
                  },
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                    fixedSize: MaterialStateProperty.all(const Size(130, 50)),
                  ),
                  onPressed: _login,
                  child: const Text('Login', style: TextStyle(color: Colors.white, fontSize: 18)),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
