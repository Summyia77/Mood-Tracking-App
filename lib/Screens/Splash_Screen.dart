import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Welcome_Screen.dart';



class Splash_Screen extends StatefulWidget {
  @override
  State<Splash_Screen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<Splash_Screen> {
  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 6), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Welcome_Screen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Image.asset(
              'images/bg.png',
              width: 400,
              height: 1000,
              fit: BoxFit.cover,
            ),
            Positioned.fill(
              child: Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      'images/logo.png',
                      width: 190,
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Mood Tracking App!',
                      style:  GoogleFonts.orelegaOne(
                          textStyle: TextStyle(fontSize: 21)
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
            Positioned(
              // Align the widget at the bottom center
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                // Use Container to add some padding around the content
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Loading...',
                      style:  GoogleFonts.orelegaOne(
                          textStyle: TextStyle(fontSize: 13)
                      ),
                    ),
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}