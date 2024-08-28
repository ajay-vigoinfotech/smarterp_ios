import 'package:flutter/material.dart';
import 'package:flutter_smart_app/Screens/SplashScreen/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(), // Set SplashScreen as the home
      debugShowCheckedModeBanner: false, // Remove the debug banner
    );
  }
}
