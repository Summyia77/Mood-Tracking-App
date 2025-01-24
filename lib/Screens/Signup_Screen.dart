import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moodtrack/Screens/Home_Screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../Reusable_Code/Fields.dart';

class Signup_Screen extends StatefulWidget {
  const Signup_Screen({super.key});

  @override
  State<Signup_Screen> createState() => _Signup_ScreenState();
}

class _Signup_ScreenState extends State<Signup_Screen> {

  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  TextEditingController emailcontroller =TextEditingController();
  TextEditingController passwordcontroller =TextEditingController();
  TextEditingController phonecontroller =TextEditingController();
  TextEditingController dobcontroller =TextEditingController();
  TextEditingController agecontroller =TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: 732,
          child: Stack(
            children: [
              Image.asset( 'images/bg.png',
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Positioned.fill(
                      child: Align(
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(
                              'images/logo.png',
                              width: 160,
                            ),
                             Text(
                              'SignUp',
                              style: GoogleFonts.orelegaOne(
                                textStyle: TextStyle(
                                  fontSize: 22,
                                ),
                              ),
                            ),                               reusabletextfield("Enter Your Email",Icons.email,false,emailcontroller),
                            reusabletextfield("Enter Your age",Icons.calendar_today,false,agecontroller),
                            reusabletextfield("Enter Your Phone",Icons.phone,false,phonecontroller),
                            reusabletextfield("Enter Your DOB",Icons.calendar_month,false,dobcontroller),
                            reusabletextfield("Enter Your Password",Icons.lock,true,passwordcontroller),

                            SizedBox(height: 14),
                            Container(
                              height: 35,
                              width: 100,
                              child: ElevatedButton(
                                onPressed: () async {
                                  await FirebaseFirestore.instance.collection('Users').add({
                                    'email': emailcontroller.text,
                                    'password': passwordcontroller.text, // Consider hashing the password
                                    'phone': phonecontroller.text,
                                    'age': agecontroller.text,
                                    'DOB': dobcontroller.text,

                                  });


                                  //create user

                                  UserCredential userCredential = await auth.createUserWithEmailAndPassword(
                                    email: emailcontroller.text,
                                    password: passwordcontroller.text,
                                  );
//add user details



                                  // Clear text fields after successful signup
                                  emailcontroller.clear();
                                  passwordcontroller.clear();
                                 agecontroller.clear();
                                 phonecontroller.clear();
                                dobcontroller.clear();
                                  dobcontroller.clear();

                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(builder: (context) => Home_Screen()),
                                  );
                                },
                                child: Text(
                                  'SignUp',
                                  style: GoogleFonts.orelegaOne(
                                    textStyle: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),                                   style: ElevatedButton.styleFrom(

                                  backgroundColor: Colors.purple, // Purple background
                                  // Text color
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0), // Border radius
                                    side: BorderSide(color: Colors.black), // Black border
                                  ),
                                  elevation: 7, // Shadow elevation
                                  shadowColor: Colors.black, // Shadow color
                                ),
                              ),
                            ),

                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
