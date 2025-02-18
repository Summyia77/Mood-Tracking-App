import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:moodtrack/Reusable_Code/BarGraph.dart';

class ShowMoodGraph extends StatefulWidget {
  @override
  _ShowMoodGraphState createState() => _ShowMoodGraphState();
}

class _ShowMoodGraphState extends State<ShowMoodGraph> {
  List<double> moodcount = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchMoodData();
  }

  Future<void> _fetchMoodData() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        final userId = user.uid;
        CollectionReference userMoodCollection =
        FirebaseFirestore.instance.collection('UserMood');

        QuerySnapshot snapshot = await userMoodCollection
            .where('userId', isEqualTo: userId)
            .get();

        Map<String, int> moodCounts = {
          'great': 0,
          'good': 0,
          'normal': 0,
          'bad': 0,
          'awful': 0,
          'angry': 0,
        };

        for (final doc in snapshot.docs) {
          final mood = doc.get('mod') as String;
          if (moodCounts.containsKey(mood)) {
            moodCounts[mood] = moodCounts[mood]! + 1;
          }
        }

        moodcount = moodCounts.values.map((count) => count.toDouble()).toList();
      }
    } catch (e) {
      print('Error fetching mood data: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error loading mood data')),
      );
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(

      color: Colors.transparent,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: isLoading
              ? CircularProgressIndicator()
              : moodcount.isEmpty
              ? Text("No mood data available")
              : SizedBox(
            height: 250,
            width:330,
            child: Bargraph(moodcount: moodcount),
          ),
        ),
      ),
    );
  }
}