import 'package:flutter/material.dart';
import 'package:my_flutter_app/utils/constant.dart';

class BottomSheet extends StatelessWidget {
  const BottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        color: Colors.white,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: AppConstants.settingsIcon,
            title: const Text('Settings'),
            onTap: () {
              // Handle settings action
            },
          ),ListTile(
            leading: AppConstants.settingsIcon,
            title: const Text('Settings'),
            onTap: () {
              // Handle settings action
            },
          ),ListTile(
            leading: AppConstants.settingsIcon,
            title: const Text('Settings'),
            onTap: () {
              // Handle settings action
            },
          ),
        ],
      ),
    );
  }
}
