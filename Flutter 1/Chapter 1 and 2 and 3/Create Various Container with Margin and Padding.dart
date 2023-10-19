import 'package:flutter/material.dart';

class PracticeContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 120,
          height: 80,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          decoration: BoxDecoration(
            color: Colors.indigoAccent,
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: const Text(
            'Box 1',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight : FontWeight.bold
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 20),
          child: const Text(
            'Transparent Box Between Boxes',
          ),
        ),
        Container(
          width: 200,
          height: 300,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          decoration: BoxDecoration(
            color: Colors.amber,
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: const Text(
            'Box 2',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight : FontWeight.bold
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
          SizedBox(height: 600, child: PracticeContainer()),
        ]),
      ),
    );
  }
}
