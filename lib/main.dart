import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_application_1/pages/homepage.dart';
import 'package:flutter_application_1/pages/tipcalculator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Tip Calculator",
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
      home: TipCalculator(),
    );
  }
}
