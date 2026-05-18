import 'package:bmi_calculator/Utility/UI/Colors.dart';
import 'package:bmi_calculator/Utility/UI/TextStyling.dart';
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final VoidCallback buttonPressed;
  final String buttonText;

  const MyButton({
    super.key,
    required this.buttonPressed,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          foregroundColor: white,
          backgroundColor: black,
        ),
        onPressed: buttonPressed,
        label: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.calculate),
            SizedBox(width: 3),
            Text(buttonText, style: subtitle),
          ],
        ),
      ),
    );
  }
}
