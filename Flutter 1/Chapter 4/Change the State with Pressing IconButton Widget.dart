import 'package:flutter/material.dart';

class PracticeStatefulWidget extends StatefulWidget {
  @override
  State<PracticeStatefulWidget> createState() => _PracticeStatefulWidgetState();
}

class _PracticeStatefulWidgetState extends State<PracticeStatefulWidget>{
  bool isPressed = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('IconButton'),
      ),
      body: Center(
        child: IconButton(
          icon: isPressed? Icon(Icons.star): Icon(Icons.circle),
          iconSize: 100,
          color: isPressed? Colors.yellow: Colors.blue,
          onPressed: () {
            setState(() {
              isPressed = !isPressed;
            });
          },
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
      home: PracticeStatefulWidget(),
    );
  }
}
