import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';
import 'package:moodtrack/Menu%20Screens/Mood%20Progress.dart';

class Mood_Calendar extends StatefulWidget {
  const Mood_Calendar({super.key});

  @override
  State<Mood_Calendar> createState() => _Home_ScreenState();
}

class Moods {
  final String mod;

  Moods({
    required this.mod,
  });

  factory Moods.fromFirestore(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return Moods(
      mod: data['mod'],
    );
  }
}

class _Home_ScreenState extends State<Mood_Calendar> {
  DateTime? _selectedDate;
  String? moodForSelectedDate;

  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime.now();
    _fetchMoodForDate(_selectedDate!);
  }

  void _fetchMoodForDate(DateTime date) {
    String formattedDate = DateFormat('yMMMMd').format(date);

    FirebaseFirestore.instance
        .collection('UserMood')
        .where('userId', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .where('date', isEqualTo: formattedDate)
        .snapshots()
        .listen((snapshot) {
      if (snapshot.docs.isNotEmpty) {
        final mood = Moods.fromFirestore(snapshot.docs.first);
        setState(() {
          moodForSelectedDate = mood.mod;
        });
      } else {
        setState(() {
          moodForSelectedDate = null;
        });
      }
    });
  }

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
                        'Mood Calendar',
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
                right: 20,
                left: 20,
                top: 170,
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: CalendarDatePicker(
                    initialDate: _selectedDate ?? DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                    onDateChanged: (DateTime value) {
                      setState(() {
                        _selectedDate = value;
                        _fetchMoodForDate(value);
                      });
                    },
                    currentDate: DateTime.now(),
                  ),
                ),
              ),
              if (moodForSelectedDate != null)
                Positioned(
                  top: 600,
                  left: 20,
                  right: 20,
                  child: Center(
                    child: Text(
                      'Mood: $moodForSelectedDate',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.orelegaOne(
                        textStyle: const TextStyle(
                          fontSize: 19,
                          color: Colors.purple,
                        ),
                      ),
                    ),
                  ),
                )
              else if (_selectedDate != null)
                Positioned(
                  top: 600,
                  left: 20,
                  right: 20,
                  child: Center(
                    child: Text(
                      'No mood found for this date.',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.orelegaOne(
                        textStyle: const TextStyle(
                          fontSize: 19,
                          color: Colors.purple,
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
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => MoodProgress_Screen()),
                    );                  },
                  child: Text(
                    'See Progress',
                    style: GoogleFonts.orelegaOne(
                      textStyle: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      side: BorderSide(color: Colors.black),
                    ),
                    minimumSize: Size(40, 40),
                    elevation: 7,
                    shadowColor: Colors.black,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}