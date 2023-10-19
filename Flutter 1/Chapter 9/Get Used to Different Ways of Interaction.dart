import 'package:flutter/material.dart';

class PracticeInkGesture extends StatefulWidget {
  @override
  State<PracticeInkGesture> createState() => _PracticeInkGestureState();
}

class _PracticeInkGestureState extends State<PracticeInkGesture> {
  Color inkColor = Colors.blue;
  Color gestureColor = Colors.blue;

  Widget part1() {
    return SizedBox(
      child: Center(
        // TODO: part 1
        child: InkWell(
          onTap: () {
            setState(() {
              inkColor = Colors.blue;
            });
          },
          onDoubleTap: () {
            setState(() {
              inkColor = Colors.red;
            });
          },
          onLongPress: () {
            setState(() {
              inkColor = Colors.yellow;
            });
          },
          child: Ink(
            height: 200,
            width: 200,
            color: inkColor,
            child: FlutterLogo(
              size: 150,
            ),
          ),
        ),
      ),
    );
  }

  Widget part2() {
    return SizedBox(
      child: Center(
        // TODO: part 2
        child: GestureDetector(
          onTap: () {
            setState(() {
              gestureColor = Colors.blue;
            });
          },
          onDoubleTap: () {
            setState(() {
              gestureColor = Colors.red;
            });
          },
          onLongPress: () {
            setState(() {
              gestureColor = Colors.yellow;
            });
          },
          child: Container(
            height: 200,
            width: 200,
            color: gestureColor,
            child: FlutterLogo(
              size: 150,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const Text(
          "InkWell",
          style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.bold,
          ),
        ),
        part1(),
        const Text(
          "GestureDetector",
          style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.bold,
          ),
        ),
        part2(),
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
        appBar: AppBar(
          title: const Text('Inkwell & GestureDetector'),
        ),
        body: PracticeInkGesture(),
      ),
    );
  }
}
