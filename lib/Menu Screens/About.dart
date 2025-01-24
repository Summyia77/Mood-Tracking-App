import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class About extends StatefulWidget {
  const About({super.key});

  @override
  State<About> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<About> {
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

                    Padding(
                      padding: const EdgeInsets.only(top:15,left:49.0),
                      child: Text(
                        'Mood Tracking App',
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'images/logo.png', // Replace with your image path
                      width: 100,
                    ),
                    SizedBox(height: 10),

                    Text(
                      '“ Happiness is not something ready made. It comes from your own actions “',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.orelegaOne(
                        fontSize: 16,
                        color: Colors.purple,
                      ),
                    ),

                    // Add your image here



                  ],
                ),
              ),
              Positioned(
                  top: 350,
right: 20,
                  left: 20,
                  child: Column(
                children: [
Text("This app is designed to help you understand and improve your emotional well-being. By tracking your moods daily, you can identify patterns, triggers, and coping mechanisms that work best for you. Your data is your own. This app prioritizes your privacy with secure data storage and no sharing of personal information without your explicit consent.",
  textAlign: TextAlign.center,
  style: GoogleFonts.cabin(
    fontSize: 15,
    color: Colors.black,
  ),),
                  SizedBox(height: 10,),
                  Text("Your data is your own. This app prioritizes your privacy with secure data storage and no sharing of personal information without your explicit consent.",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.cabin(
                      fontSize: 15,
                      color: Colors.black,
                    ),)
                ],
              )),
              Positioned(
                top: 640,
                right: 0,
                child:      Image.asset(
                'images/heart.png',
                width: 120,
              ),)
            ],
          ),
        ),
      ),
    );
  }
}