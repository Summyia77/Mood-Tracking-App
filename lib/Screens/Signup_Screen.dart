import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moodtrack/Screens/Home_Screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart'; // Import intl for date formatting
import '../Reusable_Code/Fields.dart';
import 'Login_Screen.dart';

class Signup_Screen extends StatefulWidget {
  const Signup_Screen({super.key});

  @override
  State<Signup_Screen> createState() => _Signup_ScreenState();
}

class _Signup_ScreenState extends State<Signup_Screen> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Image.asset(
                'images/bg.png',
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'images/logo.png',
                        width: 160,
                      ),
                      Text(
                        'SignUp',
                        style: GoogleFonts.orelegaOne(
                          textStyle: const TextStyle(
                            fontSize: 22,
                          ),
                        ),
                      ),
                      reusabletextfield("Enter Your Email", Icons.email, false, emailController),
                      reusabletextfield("Enter Your Age", Icons.calendar_today, false, ageController),
                      reusabletextfield("11 Digit Phone Number", Icons.phone, false, phoneController),
                      reusabletextfield("dd-mm-yyyy", Icons.calendar_month, false, dobController),
                      reusabletextfield("At least 6 character Password", Icons.lock, true, passwordController),
                      const SizedBox(height: 14),
                      Container(
                        height: 35,
                        width: 100,
                        child: ElevatedButton(
                          onPressed: () async {
                            String password = passwordController.text;
                            if (password.length < 6) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Password must be at least 6 characters long.'),
                                ),
                              );
                              return;
                            }

                            String phoneNumber = phoneController.text;
                            if (phoneNumber.length != 11 || !RegExp(r'^[0-9]+$').hasMatch(phoneNumber)) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Please enter 11 digits.'),
                                ),
                              );
                              return;
                            }

                            String dob = dobController.text;
                            DateFormat dateFormat = DateFormat("dd-MM-yyyy");

                            try {
                              dateFormat.parse(dob);
                            } catch (e) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                      'Invalid date format. Please use dd-mm-yyyy.'),
                                ),
                              );
                              return;
                            }

                            try {
                              UserCredential userCredential =
                              await auth.createUserWithEmailAndPassword(
                                email: emailController.text,
                                password: passwordController.text,
                              );

                              await firestore.collection('Users').doc(userCredential.user!.uid).set({
                                'email': emailController.text,
                                'phone': phoneController.text,
                                'age': ageController.text,
                                'DOB': dob,
                              });

                              emailController.clear();
                              passwordController.clear();
                              ageController.clear();
                              phoneController.clear();
                              dobController.clear();

                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Home_Screen()),
                              );
                            } on FirebaseAuthException catch (e) {
                              String errorMessage = "";
                              if (e.code == 'invalid-email') {
                                errorMessage = 'Invalid email format.';
                              } else if (e.code == 'email-already-in-use') {
                                errorMessage =
                                'The email address is already in use by another account.';
                              } else if (e.code == 'weak-password') {
                                errorMessage = 'The password provided is too weak.';
                              } else {
                                errorMessage =
                                'An error occurred during signup: ${e.message}';
                              }

                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(errorMessage)),
                              );
                              print("Signup error: $e");
                            } catch (e) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                    content: Text(
                                        'An unexpected error occurred during signup: $e')),
                              );
                              print("Signup error: $e");
                            }
                          },
                          child: Text(
                            'SignUp',
                            style: GoogleFonts.orelegaOne(
                              textStyle: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.purple,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              side: const BorderSide(color: Colors.black),
                            ),
                            elevation: 7,
                            shadowColor: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height:14),
              Positioned(
                top: 660,
                child: Padding(
                  padding: const EdgeInsets.only(left: 76.0),
                  child: Row(
                    children: [
                      Text("Already have an Account",style: GoogleFonts.orelegaOne(
                          textStyle: TextStyle(
                            color:Colors.purple
                          )
                      ),),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder:
                              (context) => Login_Screen()));
                        },
                        child: Padding(
                          padding: EdgeInsets.only(left:8.0), // Adjust padding as needed
                          child: Text(
                            "Login",
                            style: GoogleFonts.orelegaOne(
                              textStyle: TextStyle(
                                color: Colors.black, // Solid black color
                              ),
                            ),                                      ),
                        ),
                      )

                    ],
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