import 'package:flutter/material.dart';
import 'package:flutterapp/views/result.dart';
import 'views/HomePage.dart';

void main() {
  runApp(
    MaterialApp(
      home: ResultsPage(bmiResult: "20"),
    ),
  );

}
