import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';

class SetCurrentMood extends StatefulWidget {
  const SetCurrentMood({super.key});

  @override
  State<SetCurrentMood> createState() => _SetCurrentMoodState();
}

class _SetCurrentMoodState extends State<SetCurrentMood> {
  String mood = "";
  TextEditingController mooddescription = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: 732, // Or use MediaQuery.of(context).size.height if needed
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
                      backgroundImage: const AssetImage("images/logo.png"),
                    ),
                    const SizedBox(width: 10),
                    Padding(
                      padding: const EdgeInsets.only(left: 9.0),
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
                child: Text(
                  'Select Your Current Mood',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.orelegaOne(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ),
              Positioned(
                top: 220,
                child: Column(
                  children: [
                    // ... (Existing code for mood selection buttons - no changes needed)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildMoodButton('great', 'images/great.png'),
                        _buildMoodButton('good', 'images/goodd.png'),
                        _buildMoodButton('normal', 'images/normal.png'),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildMoodButton('bad', 'images/bad.png'),
                        _buildMoodButton('awful', 'images/awful.png'),
                        _buildMoodButton('angry', 'images/angry.png'),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 450,
                left: 20,
                right: 20,
                child: Text(
                  'How was your day ?',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.orelegaOne(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ),
              Positioned(
                left: 30,
                top: 490,
                child: Container(
                  width: 300,
                  height: 120,
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 2,
                        blurRadius: 10,
                        offset: const Offset(0, -3),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: mooddescription,
                      keyboardType: TextInputType.text,
                      style: GoogleFonts.orelegaOne(
                        textStyle: const TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                      decoration: InputDecoration(
                        hintText: "Enter small detail of your day",
                        hintStyle: GoogleFonts.orelegaOne(
                          textStyle: const TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 650,
                left: 20,
                right: 20,
                child: ElevatedButton(
                  onPressed: () async {
                    if (mood.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Please select a mood.'),
                        ),
                      );
                      return;
                    }

                    try {
                      DateTime now = DateTime.now();
                      String currentDate = DateFormat('yMMMMd').format(now);

                      final existingProduct = await FirebaseFirestore.instance
                          .collection('UserMood')
                          .where('userId',
                          isEqualTo: FirebaseAuth.instance.currentUser?.uid)
                          .where('date', isEqualTo: currentDate)
                          .get();

                      if (existingProduct.docs.isNotEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('You already set your today mood'),
                          ),
                        );
                      } else {
                        await FirebaseFirestore.instance
                            .collection('UserMood')
                            .add({
                          'mod': mood,
                          'mood description': mooddescription.text,
                          'userId': FirebaseAuth.instance.currentUser?.uid,
                          'date': currentDate,
                        });

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Mood Set Successfuly!'),
                          ),
                        );
                      }
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Failed to set mood: $e'),
                        ),
                      );
                    }
                  },
                  child: Text(
                    'Set Mood',
                    style: GoogleFonts.orelegaOne(
                      textStyle: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      side: const BorderSide(color: Colors.black),
                    ),
                    minimumSize: const Size(40, 40),
                    elevation: 7,
                    shadowColor: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMoodButton(String moodName, String imagePath) {
    return Column(
      children: [
        Container(
          child: ElevatedButton(
            onPressed: () {
              setState(() {
                mood = moodName;
                print(mood);
              });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            child: Image.asset(
              imagePath,
              width: 74,
              height: 74,
            ),
          ),
        ),
        Text(
          moodName.substring(0, 1).toUpperCase() + moodName.substring(1), // Capitalize first letter
          textAlign: TextAlign.center,
          style: GoogleFonts.orelegaOne(
            fontSize: 16,
            color: Colors.black,
          ),
        )
      ],
    );
  }
}