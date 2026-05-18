import 'package:bmi_calculator/Utility/UI/Colors.dart';
import 'package:bmi_calculator/Utility/UI/TextStyling.dart';
import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController myControllerHere;
  final String myHintText;
  final String myLabelText;
  final Widget mySuffixIcon;

  const MyTextField({
    super.key,
    required this.myControllerHere,
    required this.myHintText,
    required this.myLabelText,
    required this.mySuffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: TextField(
        keyboardType: TextInputType.numberWithOptions(),
        controller: myControllerHere,
        decoration: InputDecoration(
          suffixIcon: mySuffixIcon,
          hintText: myHintText,
          hintStyle: hintStyle,
          suffixIconColor: white,
          labelText: myLabelText,
          labelStyle: hintStyle,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: black),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: white),
          ),
        ),
      ),
    );
  }
}
