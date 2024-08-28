import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:my_flutter_app/view/pages/home_page.dart';

class HomeCard extends StatelessWidget {
  const HomeCard({super.key});

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const HomePage(),
            ),
        );
      },
      child: Card(
        color: Colors.orange.withOpacity(.2),
        elevation: 15,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20),
            ),
        ),
        child: Row(
          children: [
            Lottie.asset('assets/lottie/mark_duty.json', width: mq.width * .35),
            const Spacer(),
            const Text(
              'Mark Duty',
              style: TextStyle(
                color: Colors.amber,
                fontSize: 20,
                fontWeight: FontWeight.w500,
                letterSpacing: 1,
              ),
            ),
            const Spacer(
              flex: 1,
            ),
          ],
        ),
      ),
    );
  }
}