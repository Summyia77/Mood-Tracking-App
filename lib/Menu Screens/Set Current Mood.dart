import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
class SetCurrentMood extends StatefulWidget {
  const SetCurrentMood({super.key});

  @override
  State<SetCurrentMood> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<SetCurrentMood> {
  String mood="";
  TextEditingController mooddescription =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: 732,
          child: Stack(
            children: [
              Image.asset(
                'images/bg.png',
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),

              Positioned(
                top: 50,
                left: 20,
                child: Row(
                  children: [
                    CircleAvatar(
                        backgroundColor:Colors.white,
                        radius: 30.0,
                        backgroundImage: AssetImage("images/logo.png")),
                    SizedBox(width: 10),
                    Padding(
                      padding: const EdgeInsets.only(left:9.0),
                      child: Text(
                        'Set Current Mood',
                        style: GoogleFonts.orelegaOne(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.purple,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 150,
                left: 20,
                right: 20,
                child:

                    Text(
                      'Select Your Current Mood',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.orelegaOne(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),

                    // Grid layout with 6 containers



              ),
              Positioned(
                top: 220,

                child: Column(
                  children: [
              
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Container(
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  mood = "great";
                                  print(mood);
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent, // Set primary color to transparent
                                // Set text color to black (or desired color)
                                elevation: 0, // Remove shadow
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                              child: Image.asset(
                                'images/great.png',
                                width: 74,
                                height: 74,
                              ),
                            )
                        ),
                        Text(
                          'Great',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.orelegaOne(
                            fontSize: 16,
                            color: Colors.black,
                          ),)
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  mood = "good";
                                  print(mood);
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent, // Set primary color to transparent
                                // Set text color to black (or desired color)
                                elevation: 0, // Remove shadow
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                              child: Image.asset(
                                'images/goodd.png',
                                width: 74,
                                height: 74,
                              ),
                            )
                        ),
                        Text(
                          'Good',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.orelegaOne(
                            fontSize: 16,
                            color: Colors.black,
                          ),)
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  mood = "normal";
                                  print(mood);
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent, // Set primary color to transparent
                                // Set text color to black (or desired color)
                                elevation: 0, // Remove shadow
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                              child: Image.asset(
                                'images/normal.png',
                                width: 74,
                                height: 74,
                              ),
                            )
                        ),
                        Text(
                          'Normal',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.orelegaOne(
                            fontSize: 16,
                            color: Colors.black,
                          ),)
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Container(
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  mood = "bad";
                                  print(mood);
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent, // Set primary color to transparent
                                // Set text color to black (or desired color)
                                elevation: 0, // Remove shadow
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                              child: Image.asset(
                                'images/bad.png',
                                width: 74,
                                height: 74,
                              ),
                            )
                        ),
                        Text(
                          'Bad',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.orelegaOne(
                            fontSize: 16,
                            color: Colors.black,
                          ),)
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  mood = "awful";
                                  print(mood);
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent, // Set primary color to transparent
                                // Set text color to black (or desired color)
                                elevation: 0, // Remove shadow
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                              child: Image.asset(
                                'images/awful.png',
                                width: 74,
                                height: 74,
                              ),
                            )
                        ),
                        Text(
                          'Awful',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.orelegaOne(
                            fontSize: 16,
                            color: Colors.black,
                          ),)
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  mood = "angry";
                                  print(mood);
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent, // Set primary color to transparent
                                // Set text color to black (or desired color)
                                elevation: 0, // Remove shadow
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                              child: Image.asset(
                                'images/angry.png',
                                width: 74,
                                height: 74,
                              ),
                            )
                        ),
                        Text(
                          'Angry',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.orelegaOne(
                            fontSize: 16,
                            color: Colors.black,
                          ),)
                      ],
                    ),

                  ],
                ),


]
              ),
              ),
              Positioned(
                top: 450,
                left: 20,
                right: 20,
                child:

                Text(
                  'How was your day ?',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.orelegaOne(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),

                // Grid layout with 6 containers



              ),
              Positioned(
                left: 30,
                top: 490,
                child: Container(
                  width: 300,
                  height: 120,
                  padding:  EdgeInsets.symmetric(horizontal: 4.0),
                  decoration: BoxDecoration(
                    color: Colors.white, // Set background color to purple
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 2,
                        blurRadius: 10,
                        offset: Offset(0, -3),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: mooddescription,
                      keyboardType: TextInputType.text,
                      style: GoogleFonts.orelegaOne(
                        textStyle: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                      decoration: InputDecoration(
                        hintText: "Enter small detail of your day",
                        hintStyle: GoogleFonts.orelegaOne(
                          textStyle: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                        ),

                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top:650,
                left: 20,
                right: 20,
                child:  ElevatedButton(
                  onPressed: () async {

                    try {
                      DateTime now = DateTime.now();
                      DateTime currentDate = DateTime(now.year, now.month, now.day);
                      final existingProduct = await FirebaseFirestore.instance
                          .collection('UserMood')
                          .where('userId', isEqualTo: FirebaseAuth.instance.currentUser?.uid)
                      .where('date',isEqualTo: currentDate)

                          .get();

                      if (existingProduct.docs.isNotEmpty) {
                        // Product already exists in wishlist
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('You already set your today mood'),
                          ),
                        );
                      } else {
                        DateTime now = DateTime.now();
                        DateTime currentDate = DateTime(now.year, now.month, now.day);
                        print(currentDate);
                        // Add product to wishlist
                        await FirebaseFirestore.instance.collection('UserMood').add({
                          'mod': mood,
'mood description':mooddescription.text,
                          'userId': FirebaseAuth.instance.currentUser?.uid,
                          'date': currentDate,
                        });

                        // Show success message
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Mood Set'),
                          ),
                        );
                      }
                    } catch (e) {
                      // Handle errors
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Failed to add to Cart: $e'),
                        ),
                      );
                    }
                  },
                  child:Text(
                    'Set Mood',
                    style: GoogleFonts.orelegaOne(
                      textStyle: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black, // Purple background
                    // Text color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0), // Border radius
                      side: BorderSide(color: Colors.black), // Black border
                    ),
                    minimumSize: Size(40, 40), // Set width and height
                    elevation: 7, // Shadow elevation
                    shadowColor: Colors.black, // Shadow color
                  ),
                ), )

            ]
        ),
      ),),
    );
  }
}