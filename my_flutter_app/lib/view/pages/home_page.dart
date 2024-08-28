import 'package:flutter/material.dart';
import 'package:my_flutter_app/utils/constant.dart';
import 'package:my_flutter_app/utils/strings.dart';
import 'package:my_flutter_app/utils/theme/app_pallete.dart';
import 'package:my_flutter_app/view/pages/login_page.dart';
import 'package:my_flutter_app/view/pages/mark_duty.dart';
import 'package:my_flutter_app/view/widgets/home_screen_card.dart';
import 'package:my_flutter_app/view/widgets/info_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, dynamic>> modules = [
    {
      'icon': AppConstants.markDutyIcon,
      'name': Strings.markDuty,
      'color': AppPallete.primaryColor,
      'page': const MarkDuty(),
    },{
      'icon' : AppConstants.markDutyIcon,
      'name' : Strings.login,
      'color' : AppPallete.infoScreen,
      'page' : const LoginPage(),
    },
    // Add more modules here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const InfoScreen(barheight: 150),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                  childAspectRatio: 1.0,
                ),
                itemCount: modules.length,
                itemBuilder: (context, index) {
                  final module = modules[index];
                  return HomeScreenCard(
                    icon: module['icon'],
                    modulename: module['name'],
                    cardColor: module['color'],
                    nextPage: module['page'],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
