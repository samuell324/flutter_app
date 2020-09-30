import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/secondPage.dart';
import 'dart:math';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

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
      supportedLocales: [
        Locale('en', 'US'),
        Locale('ru', 'RU'),
      ],
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      localeResolutionCallback: (locale, supportedLocales) {
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale.languageCode && supportedLocale.countryCode == locale.countryCode) {
            return supportedLocale;
          }
        }
        return supportedLocales.first;
      },
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
  int randomNumber = min + random.nextInt(max - min);
  int counter = 0;
  static int min = 0;
  static int max = 100;
  int resultMax;

  final guessNumber = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Container(
            alignment: Alignment.bottomRight,
            child: Text("Try № $counter"),
          ),
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {_awaitFromSecondScreen(context);}
          ),
        ],
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                'Guess the number between $min and $max',
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
              padding: const EdgeInsets.all(10),
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
            ),
            Container(
              child: RaisedButton(
                child: Text(
                  "Restart",
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: restart,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _awaitFromSecondScreen(BuildContext context) async {
    final result1 = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => SecondScreen()));

    setState(() {
      max = result1;
      print("Max result is $max");
    });
  }

  void restart() {
    randomNumber = min + random.nextInt(max - min);
    print('Number after restart $randomNumber');
    guessNumber.clear();
  }

  void guess() {
    int guess = int.parse(guessNumber.text);
    setState(() {
      counter++;
    });

    void makeToast(String feedback) {
      Fluttertoast.showToast(
        msg: feedback,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        fontSize: 20,
        textColor: Colors.black,
      );
    }

    if (guess > max || guess < min) {
      makeToast("Choose number between $min and $max");
      guessNumber.clear();
      return;
    }

    bool isEmpty() {
      return guessNumber.text.isEmpty;
    }

    if (isEmpty()) {
      makeToast("Enter the number");
      return;
    }

    if (guess > randomNumber) {
      makeToast("Lower");
    } else if (guess < randomNumber) {
      makeToast("Higher");
    } else {
      makeToast("You win, click Restart");
      guessNumber.clear();
      counter = 0;
    }
    print('Random number is $randomNumber');
  }
}
