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

class MetricCalculation extends StatefulWidget {
  const MetricCalculation({super.key});

  @override
  State<MetricCalculation> createState() => _MetricCalculationState();
}

class _MetricCalculationState extends State<MetricCalculation> {
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
      backgroundColor: deepPurpleAccent,
      appBar: AppBar(
        title: Text("BMI Calculator", style: appBarStyle),
        backgroundColor: deepPurple,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            MyTextField(
              myControllerHere: controlWeight,
              myHintText: 'Enter your weight (kg)',
              myLabelText: 'Weight (kg)',
              mySuffixIcon: FaIcon(FontAwesomeIcons.weight),
            ),
            MyTextField(
              myControllerHere: controlHeight,
              myHintText: 'Enter your height (m)',
              myLabelText: 'Height (m)',
              mySuffixIcon: FaIcon(FontAwesomeIcons.weightHanging),
            ),
            const SizedBox(height: 30),

            MyButton(
              buttonText: 'Calculate BMI',
              buttonPressed: () {
                final wText = controlWeight.text.trim();
                final hText = controlHeight.text.trim();

                // Empty check
                if (wText.isEmpty || hText.isEmpty) {
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
                  return; // ← This was missing!
                }

                final weight = double.parse(wText);
                final height = double.parse(hText);

                context.read<BmiBloc>().add(
                  MetricEvent(weight: weight, height: height),
                );
              },
            ),
            // BMI Result
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
            // Reset Button
            MyButton(
              buttonText: 'Reset All',
              buttonPressed: () {
                controlWeight.clear();
                controlHeight.clear();
                context.read<BmiBloc>().add(ResetResult());
              },
            ),
            Image.asset("assets/images/r.png"),
          ],
        ),
      ),
    );
  }
}
