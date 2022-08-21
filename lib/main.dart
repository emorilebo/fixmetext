import 'package:flutter/material.dart';
import 'dart:math';

import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FixMe Test',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Fixme Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _guess = Random().nextInt(99);
  TextEditingController userGuessValue = new TextEditingController();
  String won = "You won";
  String fail = "You failed";

  void _guessFunction() {
    print(_guess);
    if (_guess == userGuessValue) {
      setState(() {
        won;
      });
    } else {
      setState(() {
        fail;
      });
    }
    ;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Center(
              child: Text(
                'You have to guess a number between 10 and 99 and you have 5 tries.',
              ),
            ),
            TextField(
              controller: userGuessValue,
              decoration: InputDecoration(hintText: 'Guess your number'),
            ),
            Text(
              '$_guess', //Need to hide the number from the user
              style: Theme.of(context).textTheme.headline4,
            ),
            ElevatedButton(
              onPressed: () {
                _guessFunction();
              },
              child: Text("Guess Number"),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text("Want to play Again"),
            ),
          ],
        ),
      ),
    );
  }
}
