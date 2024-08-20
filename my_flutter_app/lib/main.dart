import 'package:flutter/material.dart';
import 'dart:io' show Platform;

import 'package:my_flutter_app/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
    themeMode: ThemeMode.dark,
      home: PlatformAwareButton( text: 'hello',
      onPressed:),
    );
  }
}



