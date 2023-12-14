import 'package:flutter/material.dart';
import 'package:urbanhub/screen/homepage.dart';
import 'package:urbanhub/screen/otp.dart';
import 'package:shared_preferences/shared_preferences.dart';


class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  // TextEditingController _countryController = TextEditingController();
 Future<void> _saveProfileDetails(String username, String imagePath) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('username', username);
  await prefs.setString('imagePath', imagePath);
}
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
  body: SingleChildScrollView(
    scrollDirection: Axis.vertical,
    child: Container(
      child: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              // Existing code...

              // Container above the image
            Padding(
                    padding: const EdgeInsets.only(left: 0.0, right: 0, top: 80),
                    child: 
             Container(
  height: 50,
  color: const Color.fromARGB(255, 255, 255, 255),
  child: Row(
    children: [
     GestureDetector(
   onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => OtpPage()),
    );
  },
  child: Padding(
    padding: const EdgeInsets.all(8.0),
    child: Icon(
      Icons.arrow_back, // Replace with your desired icon
      color: Color.fromARGB(255, 8, 8, 8),
      size: 24, // Adjust the size of the icon as needed
    ),
  ),
),

      Padding(
                    padding: const EdgeInsets.only(left: 60.0, right: 0, top: 2),
     child:Text(
        'Basic Details',
        style: TextStyle(
          color: Color.fromARGB(255, 8, 8, 8),
          fontSize: 18,
        ),
      ),
  )],
  ),
),

            ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20, top: 40),
                    child: Container(
  height: 150,
  width: 150,
  decoration: BoxDecoration(
   
    borderRadius: BorderRadius.circular(10.0),
    color: Color.fromARGB(255, 254, 254, 254),
  ),
  child: Image.asset(
    'assets/images/profile.png', // Replace with the path to your image asset
    fit: BoxFit.cover, // Choose the appropriate fit type (e.g., cover, contain)
  ),
),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20, top: 78),
                    child: Container(
                      height: 45,
                      width: 650,
                      decoration: BoxDecoration(
                        border: Border.all( color: Color.fromARGB(255, 150, 142, 142), width: 1.0),
                        borderRadius: BorderRadius.circular(10.0),
                        color: Color.fromARGB(255, 254, 254, 254),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: TextField(
                          controller: _usernameController,
                          decoration: InputDecoration(
                            hintText: 'User Name',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0),
                              
                              borderSide: BorderSide.none,
                              
                            ),
                            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                          ),
                          style: TextStyle(fontSize: 14, color: Colors.black),
                          textAlignVertical: TextAlignVertical.center,
                        ),
                      ),
                    ),
                  ),

                  // Container 2
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20, top: 22),
                    child: Container(
                      height: 45,
                      width: 650,
                      decoration: BoxDecoration(
                        border: Border.all( color: Color.fromARGB(255, 84, 79, 79), width: 1.0),
                        borderRadius: BorderRadius.circular(15.0),
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: TextField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            hintText: 'Email',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0),
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                          ),
                          style: TextStyle(fontSize: 14, color: Colors.black),
                          textAlignVertical: TextAlignVertical.center,
                        ),
                      ),
                    ),
                  ),

                  // Container 3
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20, top: 22),
                    child: Container(
                      height: 45,
                      width: 650,
                      decoration: BoxDecoration(
                        border: Border.all( color: Color.fromARGB(255, 84, 79, 79), width: 1.0),
                        borderRadius: BorderRadius.circular(10.0),
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: TextField(
                          // controller: _countryController,
                          decoration: InputDecoration(
                            hintText: 'Optional',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(35.0),
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                          ),
                          style: TextStyle(fontSize: 14, color: Colors.black),
                          textAlignVertical: TextAlignVertical.center,
                        ),
                      ),
                    ),
                  ),
                  
GestureDetector(
                    onTap: () async {
                      if (_usernameController.text.isNotEmpty && _emailController.text.isNotEmpty) {
                        // Add email validation
                        String email = _emailController.text.trim();
                        if (!RegExp(r'^[a-zA-Z0-9_.+-]+@gmail.com$').hasMatch(email)) {
                          // Invalid email format
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Error'),
                                content: Text('Please enter a valid Gmail address.'),
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
                          return;
                        }
    // Save username and image path in shared preferences
    await _saveProfileDetails(_usernameController.text, 'assets/images/profile.png');

    // Navigate to the next page
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MyHomePage()),
    );
                } else {
                  // Show an error message or handle it as needed
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Error'),
                        content: Text('Please fill username & email.'),
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
  child: Padding(
    padding: const EdgeInsets.only(top:200.0), // Adjust the padding as needed
    child: Container(
      width: 380,
      height: 60,
      decoration: BoxDecoration(
        color: Color(0xFF6B1B13),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Center(
        child: Text(
          'Get start',
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
),

                  // Other UI components
                  // ...
                ],
              ),
Positioned(
  top: 280,
  left: 240,
  right: 110,
  child: Container(
  height: 60,
  width: 10,
  decoration: BoxDecoration(
   
    borderRadius: BorderRadius.circular(40.0),
    color: Color.fromARGB(255, 75, 4, 75),
  ),
 child: Row(
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 17.0), // Adjust the padding as needed
        child: Icon(
          Icons.camera_alt_outlined, // Replace with the desired icon
          color: Color.fromARGB(255, 245, 241, 241),
          size: 27, // Adjust the size of the icon as needed
        ),
      ),
   
            ]),
   ),),
              // Additional Containers with Colors
              Positioned(
  top: 390,
  left: 40,
  right: 300,
  child: Container(
    height: 25,
    color: const Color.fromARGB(255, 252, 252, 252),
    
      child: Text(
        '   Name ',
        style: TextStyle(
         color: Color.fromARGB(255, 84, 79, 79),
          fontSize: 12,
      
        ),
      ),
    ),
              ),

             Positioned(
  top: 457,
  left: 40,
  right: 305,
  child: Container(
    height: 25,
    color: const Color.fromARGB(255, 252, 252, 252),
    
      child: Text(
        '   Email ',
        style: TextStyle(
           color: Color.fromARGB(255, 84, 79, 79),
          fontSize: 12,
      
        ),
      ),
    ),
  ),
              Positioned(
  top: 525,
  left: 40,
  right: 280,
  child: Container(
    height: 25,
   
    color: Color.fromARGB(255, 252, 252, 252),
    
      child: Text(
        ' Referal code ',
        style: TextStyle(
          color: Color.fromARGB(255, 84, 79, 79),
          fontSize: 12,
      
        ),
      ),
    ),
  ),

             
            ],
          ),
        ),
      ),
    );
  }
}
