import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moodtrack/Menu%20Screens/About.dart';
import 'package:moodtrack/Menu%20Screens/Mood%20Calendar.dart';
import 'package:moodtrack/Menu%20Screens/Mood%20Graph.dart';
import 'package:moodtrack/Menu%20Screens/Mood%20Score.dart';
import 'package:moodtrack/Menu%20Screens/Set%20Current%20Mood.dart';

class MoodProgress_Screen extends StatefulWidget {
  const MoodProgress_Screen({super.key});

  @override
  State<MoodProgress_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<MoodProgress_Screen> {
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
                        'Mood Progress',
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
              //text
              Positioned(
                top: 150,
                right: 20,
                left: 20,
                child: Text(
                  "How's Your Month Goes..Let's Check ..",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.orelegaOne(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ),
              //sun
              Positioned(
                top: 190,
                left: 20,
                right: 20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'images/sun.png', // Replace with your image path
                      width: 200,
                    ),
               



                    // Add your image here
                  ],
                ),
              ),
              //heats
              Positioned(
                top: 260,
                left: 107,
                child: Image.asset(
                  'images/heart.png',
                  width: 45,
                ),
              ),
              Positioned(
                top: 275,
                left: 200,
                child: Image.asset(
                  'images/heart.png',
                  width: 45,
                ),
              ),
              Positioned(
                top: 210,
                left: 200,
                child: Image.asset(
                  'images/heart.png',
                  width: 45,
                ),
              ),
             //2 buttons
              Positioned(
                  left: -20,
                  top: 380,
                  child: Container(
                    width: 130,
                    height: 130,
                    decoration: BoxDecoration(
                      color: Colors.purple,
                      borderRadius: BorderRadius.circular(20.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        
                        ),
                      ],
                    ),
                    child: InkWell(
                      onTap: () {

                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MoodScore_Screen()),
                        );

                      },
                      borderRadius: BorderRadius.circular(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'images/score.png',
                            width: 70,
                            height: 59,
                            fit: BoxFit.contain,
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Score',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.orelegaOne(
                              fontSize: 17,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

              ),
              Positioned(
                right: -20,
                top: 380,
                child: Container(
                  width: 130,
                  height: 130,
                  decoration: BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.circular(20.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3),

                      ),
                    ],
                  ),
                  child: InkWell(
                    onTap: () {

                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MoodGraph_Screen()),
                      );

                    },
                    borderRadius: BorderRadius.circular(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'images/graph.png',
                          width: 65,
                          height: 59,
                          fit: BoxFit.contain,
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Graph',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.orelegaOne(
                            fontSize: 17,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

              ),
              //quote
              Positioned(
                top: 600,
                right: 30,
                left: 30,
                child: Text(
                  '"See your mood progress in graph as well as in score form to see how your mood goes through long time ago"',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.orelegaOne(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
              ),
              //heart
              Positioned(
                top: 670,
                left: 150,
                child: Image.asset(
                  'images/heart.png',
                  width: 70,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
