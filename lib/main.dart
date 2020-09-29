import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String title = 'Guess the number';
    return MaterialApp(
      title: title,
      theme: ThemeData(primaryColor: Colors.amber),
      home: HomePage(title: title),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static Random random = new Random();
  int randomNumber = random.nextInt(100) + 1;

  final guessNumber = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                'Guess the number between 1 and 100',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: 'Enter a number',
                ),
                keyboardType: TextInputType.number,
                controller: guessNumber,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: RaisedButton(
                child: Text(
                  'Guess',
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: guess,
                color: Colors.amberAccent,
                shape: new RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
              ),
            )
          ],
        ),
      ),
    );
  }

  void guess() {
    int guess = int.parse(guessNumber.text);

    void makeToast(String feedback) {
      Fluttertoast.showToast(
        msg: feedback,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        fontSize: 35,
        textColor: Colors.black,
      );
    }

    if (guess > randomNumber) {
      makeToast("Lower");
    } else if (guess < randomNumber) {
      makeToast("Higher");
    } else {
      makeToast("Win");
    }
    print('Random number is $randomNumber');
  }
}
