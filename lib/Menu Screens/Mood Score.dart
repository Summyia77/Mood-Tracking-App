import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moodtrack/Menu%20Screens/About.dart';
import 'package:moodtrack/Menu%20Screens/Mood%20Calendar.dart';
import 'package:moodtrack/Menu%20Screens/Set%20Current%20Mood.dart';
import 'package:moodtrack/Reusable_Code/Count%20Mood%20Score.dart';

class MoodScore_Screen extends StatefulWidget {
  const MoodScore_Screen({super.key});

  @override
  State<MoodScore_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<MoodScore_Screen> {
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
                        'Mood Score',
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
                      'images/score.png', // Replace with your image path
                      width: 150,
                    ),




                    // Add your image here
                  ],
                ),
              ),
              //text
              Positioned(
                top: 350,
                right: 20,
                left: 20,
                child: Text(
                  "Score",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.orelegaOne(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
              ),
              Positioned(
left:85,
                  top:430,
                  child: CountMoodScore())
             // counted score
            ],
          ),
        ),
      ),
    );
  }
}
