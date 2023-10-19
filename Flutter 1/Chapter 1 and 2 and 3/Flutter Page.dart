import 'package:flutter/material.dart';

class Microject extends StatelessWidget {
  Widget part1() {
    return Container(
          constraints: const BoxConstraints(minWidth: double.infinity),
          decoration: const BoxDecoration(
            color: Colors.blue,
          ),
        child: buildBody());
  }

  Widget part2(String text) {
    return Text(
      text,
      style: const TextStyle(
        height: 0.8,
        fontSize: 150,
        fontWeight: FontWeight.w800,
        color: Colors.white,
        letterSpacing: 4,
      ),
    );
  }

  Widget part3(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 24,
        color: Colors.white,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: part1());
  }

  Widget buildBody() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 23),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          part2('Flu\ntter'),
          part3(
              'Build, text, and deploy\nbeautiful mobile, web,\ndesktop, and embedded \napps from a single \ncodebase.')
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
      home: Microject(),
    );
  }
}

