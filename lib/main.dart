import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
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



