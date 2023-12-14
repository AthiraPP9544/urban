import 'package:flutter/material.dart';
import 'package:urbanhub/screen/firstpage.dart';
// Replace with the actual path to your FirstPage file

class StartScreen extends StatelessWidget {
  const StartScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2), () {
      Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => FirstPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0.0);
            const end = Offset.zero;
            const curve = Curves.easeInOut;

            var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            var offsetAnimation = animation.drive(tween);

            return SlideTransition(
              position: offsetAnimation,
              child: child,
            );
          },
        ),
      );
    });

    return Container(
      color: Color(0xFF6B1B13),
      child: Center(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 350.0, left: 100),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        'assets/images/Logo.png', // Replace with your image path
                        width: 203,
                        height: 223,
                      ),
                      // Add more widgets as needed
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
