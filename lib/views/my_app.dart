import 'package:flutter/material.dart';
import 'package:golden_rules/views/views.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Golden Rules',
      home: HomePage(),
    );
  }
}
