import 'package:flutter/material.dart';
import './pages/landing_page.dart';
import './pages/quiz_page.dart';
import './pages/score_page.dart';

void main(List<String> args) {
  runApp(new MaterialApp(
    home: new LandingPage(),
    debugShowCheckedModeBanner: false,
  ));
}