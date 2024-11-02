import 'package:flutter/material.dart';
import 'package:farmers_lifeline/learning.dart';
import 'package:farmers_lifeline/home.dart';

void main() {
  runApp(MaterialApp(
    routes: {
      "/": (context) => Home(),
    },
  ));
}
