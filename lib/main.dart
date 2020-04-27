import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'calculator.dart';


void main() {
  runApp(Calculator());
} //main app run

class Calculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Safe Calculator',
        theme: ThemeData(primaryColor: Colors.black),
        home: calculator()
    );
  }
}



