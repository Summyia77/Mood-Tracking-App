import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Login_Screen.dart';

class Welcome_Screen extends StatelessWidget {
  const Welcome_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Add background image
          Image.asset(
            'images/bg.png',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),

          // Center the content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Add logo text
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      'images/logo.png',
                      width: 200,
                    ),
                    Container(
                      width: 300,
                      child: Center(
                        child: Text(
                          'Welcome! Lets track your moods and See how your life gone!',
                          style:  GoogleFonts.orelegaOne(
                              textStyle: TextStyle(fontSize: 15,
                                color:Colors.orange,
                              )
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    SizedBox(height:6),
                    Text(
                      'Discover the patterns in your emotions. ',
                      style:  GoogleFonts.orelegaOne(
                          textStyle: TextStyle(fontSize: 14)
                      ),
                    ),
                    Text(
                      'You who change yourself to become happy',
                      style:  GoogleFonts.orelegaOne(
                          textStyle: TextStyle(fontSize: 14)
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 20.0),

                // Add button with centered text
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => Login_Screen()),
                    );
                  },
                  child:Text(
                    'Get Started',
                    style: GoogleFonts.orelegaOne(
                      textStyle: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple, // Purple background
                    // Text color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0), // Border radius
                      side: BorderSide(color: Colors.black), // Black border
                    ),
                    elevation: 7, // Shadow elevation
                    shadowColor: Colors.black, // Shadow color
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}