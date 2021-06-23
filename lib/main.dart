import 'package:flutter/material.dart';
import 'package:bmi_calculator_flutter_app/bmi.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(primaryColor: Colors.green),
    debugShowCheckedModeBanner: false,
    title: 'BMI',
    home: Bmi(),
  ));
}
