import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String title = 'Guess the number';
    return MaterialApp(
      title: title,
      theme: ThemeData(
          primaryColor: Colors.amber
      ),
    );
  }
}
