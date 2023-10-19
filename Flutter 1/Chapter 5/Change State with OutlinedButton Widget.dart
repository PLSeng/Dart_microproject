import 'package:flutter/material.dart';

class _PracticeTextButtonState extends State<PracticeTextButton> {
  bool turnColor = false;
  bool textValue = false;

  Widget part1() {
    return Text(
      "The Light",
      // TODO : part1
      style: TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
        color: turnColor ? Colors.amber : Colors.white,
      ),
    );
  }

  Widget part2() {
    return SizedBox(
      // TODO : part2
      child: Icon(
        Icons.light,
        size: 200,
        color: turnColor ? Colors.amber : Colors.white,
      ),
    );
  }

  Widget part3() {
    return SizedBox(
      // TODO : part3
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.black,
          side: BorderSide(
            color: Colors.white,
          ),
        ),
        child: Text(
          textValue ? "Turn Off" : "Turn On",
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
          ),
        ),
        onPressed: () {
          setState(() {
            turnColor = !turnColor;
            textValue = !textValue;
          });
        },
      ),
    );
  }

  Widget buildBody() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            part1(),
            part2(),
            const SizedBox(
              height: 250.0,
            ),
            part3(),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Practice OutlinedButton'),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 600,
            child: buildBody(),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PracticeTextButton(),
    );
  }
}

class PracticeTextButton extends StatefulWidget {
  @override
  State<PracticeTextButton> createState() => _PracticeTextButtonState();
}
