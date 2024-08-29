import 'package:flutter/material.dart';
import 'package:my_flutter_app/utils/constant.dart';

class BottomSheet extends StatelessWidget {
  const BottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: AppConstants.settingsIcon,
              title: const Text('Settings'),
              onTap: () {
                // Handle settings action
              },
            ),
            ListTile(
              leading: AppConstants.settingsIcon,
              title: const Text('Settings'),
              onTap: () {
                // Handle settings action
              },
            ),
            ListTile(
              leading: AppConstants.settingsIcon,
              title: const Text('Settings'),
              onTap: () {
                // Handle settings action
              },
            ),
          ],
        ),
      ),
    );
  }
}
