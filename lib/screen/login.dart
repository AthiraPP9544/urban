import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:urbanhub/screen/otp.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _phoneNumberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SingleChildScrollView(
        child:
      Stack(
        children:[
       Center(
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
        'assets/images/login.png',
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
      
   Padding(
  padding: const EdgeInsets.only(top: 480.0, left: 25, right: 25),
  child: Container(
  height: 100,
  width: 500,
  decoration: BoxDecoration(
    border: Border.all(
      color: const Color.fromARGB(255, 188, 186, 186),
      width: 1.0,
    ),
    color: Color.fromARGB(255, 249, 245, 245),
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(10.0),
      topRight: Radius.circular(10.0),
      bottomLeft: Radius.circular(0.0),
      bottomRight: Radius.circular(0.0),
    ),
  ),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0, right: 150,left: 10),
            child: Text(
              '  Country/Region',
              style: TextStyle(
                color: Color.fromARGB(255, 118, 113, 113),
                fontSize: 14.0,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0, right: 190,left: 10),
            child: Text(
              '  India(+91)',
              style: TextStyle(
                color: Color.fromARGB(255, 10, 0, 0),
                fontSize: 14.0,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
     
      Column(
        
        children: [
          Padding(
  padding: const EdgeInsets.only(top: 15.0, right: 15), 
  child: Image.asset(
    'assets/images/Path.png', 
    width: 30.0, 
    height: 30.0, 
    color: Color.fromARGB(255, 33, 12, 174), 
  ),
),

        ],
      ),
    ],
  ),
),



  )],
  ),
),

             ],
            ),
                                  Padding(
  padding: const EdgeInsets.only(left: 25,right: 25),
  child: Container(
  height: 75,
  decoration: BoxDecoration(
    border: Border.all(
      color: const Color.fromARGB(255, 188, 186, 186),
      width: 1.0,
    ),
    color: Color.fromARGB(255, 249, 245, 245),
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(0.0),
      topRight: Radius.circular(0.0),
      bottomLeft: Radius.circular(10.0),
      bottomRight: Radius.circular(10.0),
    ),
  ),
  child: Center(
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: TextField(
        controller: _phoneNumberController,
        keyboardType: TextInputType.phone,
        inputFormatters: [
          LengthLimitingTextInputFormatter(10)
        ],
        
        decoration: InputDecoration(
          hintText: 'Enter Phone Number',
          hintStyle: TextStyle(
            color: Color.fromARGB(255, 118, 113, 113),
            fontSize: 18.0,
            fontFamily: 'Poppins',
          
          ),
          border: InputBorder.none,
        ),
      ),
    ),
  ),
),

),
SizedBox(height: 85,),
               GestureDetector(
             onTap: () {
               
                if (_phoneNumberController.text.isNotEmpty) {
                 
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => OtpPage()),
                  );
                } else {
                
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Error'),
                        content: Text('Please fill in the phone number.'),
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
              
              child: Container(
                width: 380,
                height: 60,
                decoration: BoxDecoration(
                  color: Color(0xFF6B1B13),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Center(
                  child: Text(
                    'Login/Signup',
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
            Container(
              width: 411,
              height: 68,
              color: const Color.fromARGB(255, 255, 253, 253),
              child: Padding(
                padding: const EdgeInsets.only(left: 5.0, top: 22),
                child: Column(
  crossAxisAlignment: CrossAxisAlignment.center,
  children: [
    Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'By continuing, I agree to',
          style: TextStyle(
            color: Color.fromARGB(255, 104, 106, 107),
            fontFamily: 'Poppins',
            fontSize: 14.0,
            fontStyle: FontStyle.normal,
          ),
        ),
        Text(
          'Terms and Conditions',
          style: TextStyle(
            color: Color(0xFF6B1B13),
            fontFamily: 'Poppins',
            fontSize: 14.0,
            fontStyle: FontStyle.normal,
          ),
        ),
        Text(
          ' and',
          style: TextStyle(
            color: Color.fromARGB(255, 152, 154, 152),
            fontFamily: 'Poppins',
            fontSize: 14.0,
            fontStyle: FontStyle.normal,
          ),
        ),
      ],
    ),
    Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Privacy Policy',
          style: TextStyle(
            color: Color(0xFF6B1B13),
            fontFamily: 'Poppins',
            fontSize: 16.0,
            fontStyle: FontStyle.normal,
          ),
        ),
        
      ],
    ),
  ],
),

              ),
            ),
           
           
          ],
      ),
      ),
    ])
      )  );
  }
}






