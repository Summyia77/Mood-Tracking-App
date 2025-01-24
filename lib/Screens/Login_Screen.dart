import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moodtrack/Screens/Home_Screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../Reusable_Code/Fields.dart';
import 'Signup_Screen.dart';

class Login_Screen extends StatefulWidget {
  const Login_Screen({Key? key}) : super(key: key);

  @override
  State<Login_Screen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<Login_Screen> {


  TextEditingController emailcontroller=TextEditingController();
TextEditingController passwordcontroller= TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: 732,
          child: Stack(
            children: [
              // Add background image
              Image.asset(
                'images/bg.png',
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ), // Center the content
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
                              width: 170,
                            ),
                            Text(
                              "Login",
                              style: GoogleFonts.orelegaOne(
                                textStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 22,
                                ),
                              ),
                            ),
                            reusabletextfield("Enter Your Email",Icons.email,false,emailcontroller),
                            reusabletextfield("Enter Your Password",Icons.lock,true,passwordcontroller),
                            SizedBox(height: 14),
                            Container(
                              height: 35,
                              width: 90,
                              child: ElevatedButton(
                                onPressed: () {
                                  FirebaseAuth.instance
                                      .signInWithEmailAndPassword(
                                      email: emailcontroller.text, password: passwordcontroller.text)
                                      .then((value) {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(builder: (context) => Home_Screen()),
                                    );
                                  }).catchError((error) {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: Text('Error'),
                                          content: Text(error.toString()),
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text('OK'),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  });
                                },
                                child: Text(
                                  'Login',
                                  style: GoogleFonts.orelegaOne(
                                    textStyle: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),                                style: ElevatedButton.styleFrom(

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
                            SizedBox(height:14),

                            Padding(
                              padding: const EdgeInsets.only(left: 90.0),
                              child: Row(
                                children: [
                                  Text("Don't have Account",style: GoogleFonts.oregano(
                                    textStyle: TextStyle()
                                  ),),
                                  GestureDetector(
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => Signup_Screen()));
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.only(left:8.0), // Adjust padding as needed
                                      child: Text(
                                        "Sign Up",
                                        style: GoogleFonts.orelegaOne(
                                          textStyle: TextStyle(
                                            color: Colors.black, // Solid black color
                                          ),
                                        ),                                      ),
                                    ),
                                  )

                                ],
                              ),
                            )
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