import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const CountMoodScore(),
    );
  }
}

class CountMoodScore extends StatefulWidget {
  const CountMoodScore({super.key});

  @override
  State<CountMoodScore> createState() => _CountMoodScoreState();
}

class _CountMoodScoreState extends State<CountMoodScore> {
  String highestMood = "Loading..."; // Initial state
  int highestCount = 0;
  bool isLoading = true;
  String errorMessage = "";
  bool _dataFetched = false; // Flag to track data fetching

  @override
  void initState() {
    super.initState();
    _fetchMoodData(); // Renamed for clarity
  }

  Future<void> _fetchMoodData() async {
    if (_dataFetched) return; // Prevent multiple calls

    try {
      String userId = await _getCurrentUserId();

      if (userId.isNotEmpty) {
        CollectionReference userMoodCollection =
        FirebaseFirestore.instance.collection('UserMood');

        QuerySnapshot snapshot = await userMoodCollection
            .where('userId', isEqualTo: userId)
            .get();

        if (snapshot.docs.isEmpty) {
          highestMood = "No mood entries";
        } else {
          Map<String, int> moodCounts = {};

          for (var doc in snapshot.docs) {
            String mood = doc['mod'];
            moodCounts.update(mood, (existingCount) => existingCount + 1,
                ifAbsent: () => 1);
          }

          _calculateHighestMood(moodCounts); // Helper function

        }
      } else {
        highestMood = "User not logged in";
      }
    } catch (e) {
      errorMessage = "Error: $e";
      print("Error fetching mood data: $e");
    } finally {
      if (mounted) {
        setState(() {
          isLoading = false;
          _dataFetched = true; // Set the flag after successful fetch (or error)
        });
      }
    }
  }

  void _calculateHighestMood(Map<String, int> moodCounts) {
    moodCounts.forEach((mood, count) {
      if (count > highestCount) {
        highestCount = count;
        highestMood = mood;
      }
    });

    List<String> tiedMoods = [];
    moodCounts.forEach((mood, count) {
      if (count == highestCount) {
        tiedMoods.add(mood);
      }
    });

    if (tiedMoods.length > 1) {
      highestMood = tiedMoods.join(", ");
    }
  }


  Future<String> _getCurrentUserId() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;
    return user?.uid ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: isLoading
          ? const CircularProgressIndicator()
          : errorMessage.isNotEmpty
          ? Text(errorMessage)
          : MoodDisplay(highestMood: highestMood, highestCount: highestCount),
    );
  }
}

class MoodDisplay extends StatelessWidget {
  final String highestMood;
  final int highestCount;

  const MoodDisplay({super.key, required this.highestMood, required this.highestCount});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Highest Mood: $highestMood',
          style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.red),
        ),
        Text(
          '$highestMood',
          style: const TextStyle(fontSize: 20,color: Colors.black),
        ),
        Text(
          'Count: $highestCount',
          style: const TextStyle(fontSize: 20),
        ),
        SizedBox(height: 70),
        _buildMoodImage(highestMood),
      ],
    );
  }

  Widget _buildMoodImage(String mood) {
    mood = mood.toLowerCase(); // For case-insensitive comparison

    if (mood.contains("good")) {
      return Image.asset('images/goodd.png', width: 70);
    } else if (mood.contains("awful")) {
      return Image.asset('images/awful.png', height: 100);
    } else if (mood.contains("normal")) {
      return Image.asset('images/normal.png', height: 100);
    } else if (mood.contains("bad")) {
      return Image.asset('images/bad.png', height: 100);
    } else if (mood.contains("angry")) {
      return Image.asset('images/angry.png', height: 100);
    } else if (mood.contains("great")) {
      return Image.asset('images/great.png', height: 100);
    } else {
      return const SizedBox.shrink(); // Or a default image
    }
  }
}