import 'package:bmi_calculator/BlocLogic/bmi_bloc.dart';
import 'package:bmi_calculator/BlocLogic/bmi_event.dart';
import 'package:bmi_calculator/BlocLogic/bmi_state.dart';
import 'package:bmi_calculator/Utility/Buttons/MyButton.dart';
import 'package:bmi_calculator/Utility/UI/Colors.dart';
import 'package:bmi_calculator/Utility/TextFields/TextFieldUtil.dart';
import 'package:bmi_calculator/Utility/UI/TextStyling.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ImperialCalculation extends StatefulWidget {
  const ImperialCalculation({super.key});

  @override
  State<ImperialCalculation> createState() => _ImperialCalculationState();
}

class _ImperialCalculationState extends State<ImperialCalculation> {
  final controlWeight = TextEditingController();
  final controlHeight = TextEditingController();

  @override
  void dispose() {
    controlWeight.dispose();
    controlHeight.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      appBar: AppBar(
        centerTitle: true,
        title: Text("BMI Calculator", style: appBarStyle),
        backgroundColor: deepPurple,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            MyTextField(
              myControllerHere: controlWeight,
              myHintText: 'Enter your weight (lbs)',
              myLabelText: 'Weight (lbs)',
              mySuffixIcon: FaIcon(FontAwesomeIcons.weight),
            ),
            MyTextField(
              myControllerHere: controlHeight,
              myHintText: 'Enter your height (inches)',
              myLabelText: 'Height (inches)',
              mySuffixIcon: FaIcon(FontAwesomeIcons.weightHanging),
            ),
            const SizedBox(height: 30),
            MyButton(
              buttonText: 'Calculate BMI',
              buttonPressed: () {
                final weightText = controlWeight.text.trim();
                final heightText = controlHeight.text.trim();
                if (weightText.isEmpty || heightText.isEmpty) {
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: const Text("Warning!"),
                      content: const Text("Fields cannot be empty"),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text("OK"),
                        ),
                      ],
                    ),
                  );
                  return;
                }

                final weight = double.parse(weightText);
                final height = double.parse(heightText);

                context.read<BmiBloc>().add(
                  ImperialEvent(myWeight: weight, myHeight: height),
                );
              },
            ),
            BlocSelector<BmiBloc, BmiState, double>(
              selector: (state) => state.Formula,
              builder: (context, value) {
                return TweenAnimationBuilder<double>(
                  tween: Tween(begin: 0.0, end: value),
                  duration: const Duration(milliseconds: 600),
                  builder: (context, animatedValue, _) {
                    return Column(
                      children: [
                        Text(
                          animatedValue.toStringAsFixed(2),
                          style: const TextStyle(
                            fontSize: 48,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          "Your BMI",
                          style: TextStyle(color: Colors.white70),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
            MyButton(
              buttonText: 'Reset All',
              buttonPressed: () {
                controlWeight.clear();
                controlHeight.clear();
                context.read<BmiBloc>().add(ResetResult());
              },
            ),
            Image.asset("assets/images/r.png")
          ],
        ),
      ),
    );
  }
}
