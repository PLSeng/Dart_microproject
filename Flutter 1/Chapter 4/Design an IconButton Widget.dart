import 'package:flutter/material.dart';

class PracticeIconButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('IconButton'),
        ),

        body: Center(
          // TODO : part1
          child: IconButton(
            icon: Icon(Icons.star),
            iconSize: 100,
            color: Colors.yellow,
            onPressed: () {},
            // TODO : part2
            hoverColor: Colors.blue,
            splashColor: Colors.green,
          ),
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
      home: PracticeIconButton(),
    );
  }
}
