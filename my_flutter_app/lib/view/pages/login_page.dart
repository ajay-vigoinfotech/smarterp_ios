import 'package:flutter/material.dart';
import 'package:my_flutter_app/model/login_model.dart';
import 'package:my_flutter_app/utils/strings.dart';
import 'package:my_flutter_app/utils/theme/app_pallete.dart';
import 'package:my_flutter_app/view/widgets/auth_field.dart';
import 'package:my_flutter_app/view/widgets/privacy_policy.dart';
import 'package:shared_preferences/shared_preferences.dart'; // Import this package
import '../../viewmodel/login_view_model.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _partnerCodeController = TextEditingController();
  final TextEditingController _userIDController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool isPasswordVisible = false;
  final LoginViewModel _viewModel = LoginViewModel();

  Future<void> _onSubmit() async {
    if (_formKey.currentState?.validate() ?? false) {
      final username =
          "${_partnerCodeController.text}/${_userIDController.text}";
      final loginRequest = LoginRequest(
        grantType: Strings.grantType,
        username: username,
        password: _passwordController.text,
      );

      final success = await _viewModel.makeRequest(loginRequest);

      if (success) {
        // Save username in SharedPreferences
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('username', username);

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Login failed. Please try again.')),
        );
      }
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
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 50),
                Image.asset(
                  'assets/images/login_image.jpeg',
                  height: 200,
                ),
                const Text(
                  Strings.login,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 30),
                AuthField(
                  labelText: Strings.partnerCode,
                  controller: _partnerCodeController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Partner Code is Required';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                AuthField(
                  labelText: Strings.userID,
                  controller: _userIDController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'User ID is Required!!!!';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                AuthField(
                  labelText: Strings.password,
                  controller: _passwordController,
                  obscureText: !isPasswordVisible,
                  suffixIcon: IconButton(
                    icon: Icon(
                      isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        isPasswordVisible = !isPasswordVisible;
                      });
                    },
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Password is Required';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 40),
                ElevatedButton(
                  onPressed: _onSubmit,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: (AppPallete.btn1),
                    foregroundColor: (AppPallete.backgroundColor),
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: const Text(
                    Strings.submit,
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                const SizedBox(height: 20),
                const PrivacyPolicy(),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
