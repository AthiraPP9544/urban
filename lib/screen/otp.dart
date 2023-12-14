import 'package:flutter/material.dart';
import 'package:urbanhub/screen/login.dart';
import 'package:urbanhub/screen/profile.dart';

class OtpPage extends StatefulWidget {
  @override
  _OtpPageState createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  List<TextEditingController> _otpControllers =
      List.generate(6, (index) => TextEditingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          children: [
            Row(
              children: [
                  GestureDetector(
   onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Login()),
    );
  },
             child:   Padding(
                  padding: const EdgeInsets.only(left: 40, top: 40),
                  child: Icon(
                    Icons.keyboard_backspace,
                    size: 40,
                    color: Colors.black,
                  ),
                   ), ),
                SizedBox(width: 25),
                Padding(
                  padding: const EdgeInsets.only(left: 25, top: 120),
                  child: Image.asset(
                    'assets/images/otp.png',
                    width: 170,
                    height: 170,
                  ),
                ),
              ],
            ),
            SizedBox(height: 35), // Adjust the spacing as needed
            Text(
              'Enter the 6 digit verification code  \n  we’ve sent to +91 990 000 0000',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18.0,
                fontFamily: 'Poppins',
            
              ),
            ),
            SizedBox(height: 48), // Adjust the spacing as needed
            Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: List.generate(
    6,
    (index) => Container(
      width: 40,
      height: 40,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: SizedBox(
        width: 40,
        child: TextField(
          controller: _otpControllers[index],
          keyboardType: TextInputType.number,
          maxLength: 1,
          textAlign: TextAlign.center,
          onChanged: (value) {
            // Automatically move focus to the next TextField
            if (index < 5 && value.isNotEmpty) {
              FocusScope.of(context).nextFocus();
            }
          },
          decoration: InputDecoration(
            counterText: '',
            border: InputBorder.none,
          ),
        ),
      ),
    ),
  ).expand((widget) => [widget, SizedBox(width: 6)]).toList(),
),

       SizedBox(height: 20),
          ElevatedButton(
  onPressed: () {
    print('Button Pressed'); // Add this line
    // Validate and process the entered OTP
    String enteredOtp =
        _otpControllers.map((controller) => controller.text).join();

    // Check if OTP is not empty before navigating
    if (enteredOtp.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ProfilePage()),
      );
    } else {
      // Show an error message or handle the case where OTP is empty
      showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Error'),
                        content: Text('Please fill OTP.'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
    }
  },
  style: ElevatedButton.styleFrom(
    primary: Color(0xFF6B1B13), // Set button color
    onPrimary: Colors.white, // Set text color
    padding: EdgeInsets.symmetric(horizontal: 120, vertical: 18), // Set padding
    textStyle: TextStyle(fontSize: 18),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.0), // Set circular border radius
    ), // Set text size
  ),
  child: Text('Confirm OTP'),
),

SizedBox(height: 25), // Adjust the spacing as needed
            Text(
              'Resend code in 30 sec',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18.0,
                fontFamily: 'Poppins',
            
              ),
            ),
          ],
        ),
      ),
    );
  }
}
