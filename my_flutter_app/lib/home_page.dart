import 'dart:io' show Platform;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlatformAwareButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const PlatformAwareButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return CupertinoButton(
        onPressed: onPressed,
        color: CupertinoColors.activeBlue,
        child: Text(text),
      );
    } else {
      return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          // Add any additional styling here if needed
        ),
        child: Text(text),
      );
    }
  }
}
