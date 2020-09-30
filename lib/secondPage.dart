import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget {
  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
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
                    'Input min value :',
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  child: TextField(),
                )
              ],
            ),
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
                  child: TextField(),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.all(40),
              child: RaisedButton(
                onPressed: () {},
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
}
