import 'package:flutter/material.dart';
import 'package:urbanhub/screen/login.dart';

class ThirdPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 411,
                  height: 550,
                  color: Colors.blue,
                  child: Stack(
                    children: [
                      Image.asset(
                        'assets/images/third.png', // Replace with the actual path to your image asset
                        width: 411,
                        height: 550,
                        fit: BoxFit.cover,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 140.0, top: 150),
                        child: Text(
                          'PARAMOUNT',
                          style: TextStyle(
                            color: Color(0xFFF4F4F4),
                            fontFamily: 'Poppins',
                            fontSize: 15.0,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 6.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
             Container(
              width: 411,
              height: 100,
              color: const Color.fromARGB(255, 255, 253, 253),
              
                child: Column(
                  
                  children: [
                  
                    
                    Text(
                      'LOREM',
                      style: TextStyle(
                        color: Color(0xFF6B1B13),
                        fontFamily: 'Poppins',
                        fontSize: 30.0,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 2.0,
                      ),
                    ),
                    
                    Text(
                      'Clothing',
                      style: TextStyle(
                        color: Color(0xFF6B1B13),
                        fontFamily: 'Poppins',
                        fontSize: 25.0,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500,
                        
                      ),
                    ),
                  ],
                ),
              ),
            Container(
              width: 411,
              height: 68,
              color: const Color.fromARGB(255, 255, 253, 253),
              child: Padding(
                padding: const EdgeInsets.only(left: 5.0, top: 22),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'we provide the clothes which matters ',
                      style: TextStyle(
                        color: Color.fromARGB(255, 5, 1, 0),
                        fontFamily: 'Poppins',
                        fontSize: 16.0,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                    Text(
                      'when you wear',
                      style: TextStyle(
                        color: Color.fromARGB(255, 5, 1, 0),
                        fontFamily: 'Poppins',
                        fontSize: 16.0,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16,),
            Row(
              children: [
                SizedBox(
                  width: 160,
                ),
                Container(
                  width: 25,
                  height: 10,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(230, 215, 215, 213),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(230, 215, 215, 213),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(230, 215, 215, 213),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () {
                // Navigate to the next page
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => Login()),
                // );
                Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => Login(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(0.0, -1.0);
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
              },
              child: Container(
                width: 380,
                height: 60,
                decoration: BoxDecoration(
                  color: Color(0xFF6B1B13),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Center(
                  child: Text(
                    'Get Started',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}