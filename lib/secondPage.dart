import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget {
  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  TextEditingController maxValueController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Setting screen'),
        ),
        body: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Input max value: ',
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  child: TextField(
                    controller: maxValueController,
                    keyboardType: TextInputType.number,
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.all(40),
              child: RaisedButton(
                // ignore: unnecessary_statements
                onPressed: () {
                  sendDataBack(context);
                },
                child: Text(
                  'Apply changes',
                  style: TextStyle(fontSize: 20),
                ),
                color: Colors.blue,
                shape: new RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
              ),
            )
          ],
        ),
      ),
    );
  }

  void sendDataBack(BuildContext context) {
    int maxSendBack = int.parse(maxValueController.text);
    Navigator.pop(context, maxSendBack);
  }
}
