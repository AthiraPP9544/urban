import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyHomePage extends StatelessWidget {
  Future<Map<String, String?>> _getProfileDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? username = prefs.getString('username');
    String? imagePath = prefs.getString('imagePath');
    return {'username': username, 'imagePath': imagePath};
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 252, 251, 251),
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                width: double.infinity,
                height: 300,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Color(0xFF6B1B13),
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(color: Colors.black, width: 1.0),
                ),
                child: FutureBuilder<Map<String, String?>>(
                  future: _getProfileDetails(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else {
                      String? username = snapshot.data?['username'];
                      String? imagePath = snapshot.data?['imagePath'];

                      return Column(
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 40.0, left: 15),
                                child: Container(
                                  width: 75,
                                  height: 75,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(imagePath ?? ''),
                                    ),
                                  ),
                                ),
                              ),
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 40.0, left: 7),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              ' Hi,',
                                              style: TextStyle(
                                                fontSize: 30,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(top: 5.0, left: 5.0),
                                              child: Text(
                                                username ?? '',
                                                style: TextStyle(
                                                  fontSize: 28,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 10),
                                          child: Row(
                                            children: [
                                              Text(
                                                'Welcome to Paramount,',
                                                style: TextStyle(fontSize: 18, color: Colors.white),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      );
                    }
                  },
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 75),
                    child: Container(
                      height: 218,
                      color: Color.fromARGB(255, 252, 252, 252),
                      child: Column(
                        children: [
                          Container(
                            width: 550,
                            height: 200,
                            child: Image.asset(
                              'assets/images/food.png',
                              fit: BoxFit.contain,
                            ),
                          ),
                          Container(
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 160,
                                ),
                                Container(
                                  width: 25,
                                  height: 10,
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(230, 129, 129, 127),
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
                                    color: Color.fromARGB(230, 129, 129, 127),
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
                                  color: Color.fromARGB(230, 129, 129, 127),
                                    borderRadius: BorderRadius.circular(25.0),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                
                ],
              ),
            ],
          ),
       Positioned(
  top: 150,
  left: 28,
  child: Container(
    width: 350,
    height: 236,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20.0),
      gradient: LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [
          Color.fromARGB(255, 167, 49, 39),
          Color.fromARGB(255, 73, 9, 9),
        ],
      ),
    ),
    child: Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start, // Adjusted alignment
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20.0, top: 20.0), // Adjusted padding
              child: Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage('assets/images/pic.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Container(
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start, // Align items to the start (vertically)
    children: [
      Container(
        padding: EdgeInsets.only(left: 100, top: 5),
        child: Text(
          'Package Validity',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
      SizedBox(height: 10), // Add space between the text and the date container

      Container(
        width: 120,
        height: 40,
        margin: EdgeInsets.only(left:100.0), // Adjusted left margin
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(
            color: Colors.white,
          ),
        ),
        child: Row(
         // Align the text to the start
          children: [
            Text(
              '  31 Dec 2022',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      SizedBox(height: 10), // Add space between the date and the icon

      Container(
  margin: EdgeInsets.only(left: 170.0),
  child: Image.asset(
    'assets/images/Group.png',
    color: Colors.white, // If you want to apply color to the image
    width: 50, // Set the width of the image
    height: 50, // Set the height of the image
  ),
),
    ],
  ),
)

          ],
        ),
        Row(
           // Adjusted alignment
          children: [
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center, // Adjusted alignment
                children: [
                  Container(
                  
                    child: Text(
                      '  Your Balance',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Container(
                    width: 130,
                    height: 60,
                    
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center, // Adjusted alignment
                      children: [
                        Text(
                          '\u20B9',
                          style: TextStyle(
                            color: const Color.fromARGB(255, 250, 249, 249),
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '10,000',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 35,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Add a new Column widget for the bottom right corner text
            Row(
  
  children: [
    // First Column
    Column(
      
      children: [
        Padding(
          padding: EdgeInsets.only(right: 30.0,top: 20),
          child: Text(
            '            From',
            style: TextStyle(
              color: const Color.fromARGB(255, 200, 195, 195),
              fontSize: 12,
            ),
          ),
        ),
       Padding(
          padding: EdgeInsets.only(top: 10),
          child: Text(
          'Till',
          style: TextStyle(
            color: const Color.fromARGB(255, 211, 209, 209),
            fontSize: 12,
          ),
        ),
    )],
    ),

    // Second Column
    Column(
    
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 0.0),
          child: Text(
            'Balace Validity',
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
            ),
          ),
        ),
         Padding(
          padding: EdgeInsets.only(right: 30.0,top: 0),
          child: Text(
            ' 01 Sep',
            style: TextStyle(
              color: Color.fromARGB(255, 253, 252, 252),
              fontSize: 18,
               fontWeight: FontWeight.bold
            ),
          ),
        ),
          Padding(
          padding: EdgeInsets.only(right: 30.0,top: 0),
          child: Text(
            ' 01 Dec',
            style: TextStyle(
              color: Color.fromARGB(255, 252, 252, 252),
              fontSize: 18,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
      ],
    ),
  ],
),

          ],
        ),
      ],
    ),
  ),
),

          
          Positioned(
            bottom: 65,
            left: 0,
            right: 0,
            child:
             Container(
              height: 235,
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 210, 207, 207),
                  borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0),
                ),
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(255, 253, 252, 252),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
             child: SingleChildScrollView(
  scrollDirection: Axis.vertical,
  child: Column(
    
    children: [
      Row(
        children: [
        Container(
  width: 395,
   color: Color.fromARGB(255, 210, 209, 209),
  padding: EdgeInsets.only(top:12.0),
  child: Row(
    children: [
      Expanded(
        child: Container(
          padding: EdgeInsets.all(8.0),
          child: Center(
            child: Text('Recent Transactions'),
          ),
        ),
      ),
      Expanded(
        child: Container(
          padding: EdgeInsets.only(left:40.0),
          child: Center(
            child: Text('View All'),
          ),
        ),
      ),
    ],
  ),
)

        ],
      ),
      // Add a new Row with a Container below
      Row(
        children: [
         Container(
          
  width: 395,
  height: 80,
  
  decoration: BoxDecoration(
    color: Color.fromARGB(255, 251, 252, 252),
    borderRadius: BorderRadius.circular(15.0), // Adjust the radius as needed
  ),
  padding: EdgeInsets.all(16.0),
  child: Column(
    children: [
      Row(
        children: [
          Expanded(
            child: Container(
              
             
              
              child: Center(
                child: Text('Monthly Credit',
                 style: TextStyle(
        color: const Color.fromARGB(255, 12, 0, 0), // Set the text color
        fontSize: 17, // Set the font size
        fontWeight: FontWeight.bold, // Set the font weight
        // You can add more style properties as needed
      ),),
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(bottom:4.0,left: 40),
              child: Center(
                child: Text('+10,000'),
              ),
            ),
          ),
        ],
      ),
      Row(
        children: [
          Expanded(
            child: Container(
             padding: EdgeInsets.only(bottom:3.0,right: 200),
              child: Center(
                child: Text('11:52 AM, 28-Oct-2022'),
              ),
            ),
          ),
          
        ],
      ),
    ],
  ),
)

        ],
      ),
      SizedBox(height: 5),
      Row(
        children: [
          Container(
          
  width: 395,
  height: 80,
  
  decoration: BoxDecoration(
    color: Color.fromARGB(255, 252, 253, 254),
    borderRadius: BorderRadius.circular(15.0), // Adjust the radius as needed
  ),
  padding: EdgeInsets.all(16.0),
  child: Column(
    children: [
      Row(
        children: [
          Expanded(
            child: Container(
              
             
              
              child: Center(
                child: Text('Order #2322',
                style: TextStyle(
        color: const Color.fromARGB(255, 12, 0, 0), // Set the text color
        fontSize: 17, // Set the font size
        fontWeight: FontWeight.bold, // Set the font weight
        // You can add more style properties as needed
      ),),
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(bottom:5.0,left: 40),
              child: Center(
                child: Text('-2,000',
                style: TextStyle(
        color: Color.fromARGB(255, 152, 8, 8), 
   
      ),),
              ),
            ),
          ),
        ],
      ),
      Row(
        children: [
          Expanded(
            child: Container(
             padding: EdgeInsets.only(bottom:3.0,right: 200),
              child: Center(
                child: Text('11:52 AM, 28-Oct-2022'),
              ),
            ),
          ),
          
        ],
      ),
    ],
  ),
)

        ],
      ),
      SizedBox(height: 5),
      Row(
        children: [
        Container(
          
  width: 395,
  height: 80,
  
  decoration: BoxDecoration(
    color: Color.fromARGB(255, 255, 255, 255),
    borderRadius: BorderRadius.circular(15.0),
  ),
  padding: EdgeInsets.all(16.0),
  child: Column(
    children: [
      Row(
        children: [
          Expanded(
            child: Container(
              
             
              
              child: Center(
                child: Text('Package Renewed',
                style: TextStyle(
        color: const Color.fromARGB(255, 12, 0, 0),
        fontSize: 17, 
        fontWeight: FontWeight.bold, 
       
      ),),
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(bottom:5.0,left: 40),
              child: Center(
                child: Text('+10,000'),
              ),
            ),
          ),
        ],
      ),
      Row(
        children: [
          Expanded(
            child: Container(
             padding: EdgeInsets.only(bottom:3.0,right: 200),
              child: Center(
                child: Text('   11:52 AM, 28-Oct-2022'),
              ),
            ),
          ),
          
        ],
      ),
    ],
  ),
)

        ],
      ),
    
      
    
    ],
  ),
),

      ),
      ),
       Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 67.0,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 141, 23, 23),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0),
                ),
              ),
              child:Row(
  mainAxisAlignment: MainAxisAlignment.spaceAround,
  children: [
    IconButton(
      icon: Icon(Icons.home),
      onPressed: () {
        
      },
      color: Colors.white,
    ),
    GestureDetector(
      onTap: () {
        
      },
      child: Container(
        width: 40, 
        height: 40,
        child: Image.asset('assets/images/Scan.png'), 
      ),
    ),
    IconButton(
      icon: Icon(Icons.people),
      onPressed: () {
    
      },
      color: Colors.white,
    ),
  
  ],
),

            ),
          ),
      ],
      ),


    );
  }
}

