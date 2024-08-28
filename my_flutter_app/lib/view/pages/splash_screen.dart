// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:my_flutter_app/view/pages/login_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToLogin();
  }

  _navigateToLogin() async {
    await Future.delayed(const Duration(seconds: 3), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const LoginPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [Image.asset('assets/images/splash_screen.jpg')],
      ),
    );
  }
}
