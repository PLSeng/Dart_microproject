import 'package:flutter/material.dart';

class PracticeText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 240,
          height: 120,

          decoration: BoxDecoration(
            color: const Color(0xffFFF9E1),
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: const Text(
            'Because of my parental size,\nmay be I’m born to be OverFlow!',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
              color: Colors.black87,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
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
      home: Scaffold(
        body: ListView(children: [
          SizedBox(height: 600, child: PracticeText()),
        ]),
      ),
    );
  }
}