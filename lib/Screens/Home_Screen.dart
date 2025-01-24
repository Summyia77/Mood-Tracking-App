import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moodtrack/Menu%20Screens/About.dart';
import 'package:moodtrack/Menu%20Screens/Mood%20Calendar.dart';
import 'package:moodtrack/Menu%20Screens/Set%20Current%20Mood.dart';

class Home_Screen extends StatefulWidget {
  const Home_Screen({super.key});

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
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
                      'images/emojigroup.png', // Replace with your image path
                      width: 110,
                    ),
                    SizedBox(height: 0),

                    Text(
                      '“ Happiness is not something ready made. It comes from your own actions “',      textAlign: TextAlign.center,
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
                  left: -20,

                  child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SetCurrentMood()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(240, 40),
                      backgroundColor: Colors.purple,
                      shadowColor: Colors.black, // Add shadow color
                      elevation: 19, // Adjust shadow intensity
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                    child:  Text('Set Current Mood',style: GoogleFonts.orelegaOne(
                      fontSize: 19,
                      color: Colors.white,
                    ),),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Mood_Calendar()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(240, 40),
                      backgroundColor: Colors.purple,
                      shadowColor: Colors.black, // Add shadow color
                      elevation: 19, // Adjust shadow intensity
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                    child:  Text('Mood Calendar',style: GoogleFonts.orelegaOne(
                      fontSize: 19,
                      color: Colors.white,
                    ),),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => Home_Screen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(240, 40),
                      backgroundColor: Colors.purple,
                      shadowColor: Colors.black, // Add shadow color
                      elevation: 19, // Adjust shadow intensity
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                    child:  Text('Mood Progress',style: GoogleFonts.orelegaOne(
                      fontSize: 19,
                      color: Colors.white,
                    ),),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => About()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(240, 40),
                      backgroundColor: Colors.purple,
                      shadowColor: Colors.black, // Add shadow color
                      elevation: 19, // Adjust shadow intensity
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                    child:  Text('About',style: GoogleFonts.orelegaOne(
                      fontSize: 19,
                      color: Colors.white,
                    ),),
                  ),
                ],
              )),
              Positioned(
                top: 590,
                right: 20,
                child:      Image.asset(
                'images/logo.png',
                width: 110,
              ),)
            ],
          ),
        ),
      ),
    );
  }
}