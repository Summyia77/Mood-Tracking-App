import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget reusabletextfield(
    String text,
    IconData icon,
    bool isPasswordType,
    TextEditingController controller,
    ) {
  return SingleChildScrollView(
    child: Container(
      height: 60.0, // Adjust height as needed
      width: 280, // Takes full width
      padding: EdgeInsets.only(top: 20.0), // Adjust padding as needed
      child: TextField(
        controller: controller,
        obscureText: isPasswordType,
        autocorrect: !isPasswordType,
        cursorColor: Colors.white,
  style: GoogleFonts.orelegaOne(
  textStyle: TextStyle(
  color: Colors.black.withOpacity(0.9), // Semi-transparent black
  fontSize: 12,
  ),  ),     decoration: InputDecoration(
          prefixIcon: Icon(icon, color: Colors.purple ,size: 19,),
          labelText: text,
          labelStyle: GoogleFonts.orelegaOne(textStyle:TextStyle(color: Colors.black.withOpacity(0.4) ,fontSize: 13),),
          filled: true,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          fillColor: Colors.white.withOpacity(0.9),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: const BorderSide(width: 0, style: BorderStyle.none),
          ),
        ),
        keyboardType: isPasswordType
            ? TextInputType.visiblePassword
            : TextInputType.emailAddress,
      ),
    ),
  );
}
