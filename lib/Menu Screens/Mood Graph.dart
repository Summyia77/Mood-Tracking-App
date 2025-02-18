import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moodtrack/Menu%20Screens/About.dart';
import 'package:moodtrack/Menu%20Screens/Mood%20Calendar.dart';
import 'package:moodtrack/Menu%20Screens/Set%20Current%20Mood.dart';
import 'package:moodtrack/Reusable_Code/Count%20Mood%20Score.dart';
import 'package:moodtrack/Reusable_Code/Show%20Mood%20Graph.dart';

class MoodGraph_Screen extends StatefulWidget {
  const MoodGraph_Screen({super.key});

  @override
  State<MoodGraph_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<MoodGraph_Screen> {
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
                        backgroundColor: Colors.white,
                        radius: 30.0,
                        backgroundImage: AssetImage("images/logo.png")),
                    SizedBox(width: 10),
                    Padding(
                      padding: const EdgeInsets.only(left: 9.0),
                      child: Text(
                        'Mood Graph',
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

              //score pic
              Positioned(
                top: 190,
                left: 20,
                right: 20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'images/graph.png', // Replace with your image path
                      width: 110,
                    ),




                    // Add your image here
                  ],
                ),
              ),
              //text
              Positioned(
                top: 310,
                right: 20,
                left: 20,
                child: Text(
                  "Graph",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.orelegaOne(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 400,),
              Padding(
                padding: const EdgeInsets.only(top:370.0),
                child: SizedBox(
                    height: 300,
                    child: ShowMoodGraph()),
              ),
           Positioned(
             top: 655,
             right: 10,
             left: 40,
             child: Row(
               children:[
               Text(
                   "Great",
                   textAlign: TextAlign.center,
                   style: GoogleFonts.orelegaOne(
                     fontSize: 16,
                     fontWeight: FontWeight.bold,
                     color: Colors.black,
                   ),
                 ),
                 Padding(
                   padding: const EdgeInsets.only(right: 8.0,left: 8),
                   child: Text(
                     "Good",
                     textAlign: TextAlign.center,
                     style: GoogleFonts.orelegaOne(
                       fontSize: 16,
                       fontWeight: FontWeight.bold,
                       color: Colors.black,
                     ),
                   ),
                 ),
                 Text(
                   "Normal",
                   textAlign: TextAlign.center,
                   style: GoogleFonts.orelegaOne(
                     fontSize: 16,
                     fontWeight: FontWeight.bold,
                     color: Colors.black,
                   ),
                 ),
                 Padding(
                   padding: const EdgeInsets.only(right: 8.0,left: 8),
                   child: Text(
                     "Bad",
                     textAlign: TextAlign.center,
                     style: GoogleFonts.orelegaOne(
                       fontSize: 16,
                       fontWeight: FontWeight.bold,
                       color: Colors.black,
                     ),
                   ),
                 ),
                 Text(
                   "Awful",
                   textAlign: TextAlign.center,
                   style: GoogleFonts.orelegaOne(
                     fontSize: 16,
                     fontWeight: FontWeight.bold,
                     color: Colors.black,
                   ),
                 ),
                 Padding(
                   padding: const EdgeInsets.only(right: 8.0,left: 8),
                   child: Text(
                     "Angry",
                     textAlign: TextAlign.center,
                     style: GoogleFonts.orelegaOne(
                       fontSize: 16,
                       fontWeight: FontWeight.bold,
                       color: Colors.black,
                     ),
                   ),
                 ),
               ]
             ),
           )
              // counted score
            ],
          ),
        ),
      ),
    );
  }
}
