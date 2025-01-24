import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

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

  @override
  Widget build(BuildContext context) {
    var _selectedDate;

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
                top: 230,
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
                    initialDate: _selectedDate,
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                    onDateChanged: (DateTime value) {
                      setState(() {
                        _selectedDate = value;
                      });
                    },
                    currentDate: DateTime.now(),
                  ),
                ),
              ),

              StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('UserMood')
                    .where('userId', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                    .where('date', isEqualTo: DateTime.now().toString())
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  }

                  if (!snapshot.hasData) {
                    return Center(child: CircularProgressIndicator());
                  }

                  final usermood = snapshot.data!.docs.map((doc) => Moods.fromFirestore(doc)).toList();

                  if (usermood.isEmpty) {
                    return Text('No mood logs found for you today.');
                  }

                  return ListView.builder(
                    itemCount: usermood.length,
                    itemBuilder: (BuildContext context, int index) {
                      final mood = usermood[index];
                      return Positioned(
                        child: Text(
                          'Mood: ${mood.mod}',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.orelegaOne(
                            textStyle: TextStyle(
                              fontSize: 19,
                              color: Colors.purple,
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),

              Positioned(
                top: 650,
                left: 20,
                right: 20,
                child: ElevatedButton(
                  onPressed: () {
                    print(DateTime.now().toString());
                  },
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
                    backgroundColor: Colors.black, // Purple background
                    // Text color
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(30.0), // Border radius
                      side: BorderSide(color: Colors.black), // Black border
                    ),
                    minimumSize: Size(40, 40), // Set width and height
                    elevation: 7, // Shadow elevation
                    shadowColor: Colors.black, // Shadow color
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
