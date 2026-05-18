import 'package:bmi_calculator/Screens/Calculations/Imperial.dart';
import 'package:bmi_calculator/Screens/Calculations/Metric.dart';
import 'package:bmi_calculator/Utility/UI/Colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;
  final List<Widget> myItems = [MetricCalculation(), ImperialCalculation()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        backgroundColor: deepPurple,
        unselectedItemColor: grey,
        selectedItemColor: white,
        iconSize: 17,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.calculator),
            label: "Metric",
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.signHanging),
            label: "Imperial",
          ),
        ],
      ),
      body: IndexedStack(index: currentIndex, children: myItems),
    );
  }
}
