import 'package:flutter/material.dart';

class _PracticeAnimatedCrossFadedState
    extends State<PracticeAnimatedCrossFaded> {
  bool _isPressed = true;

  Widget customAnimatedCrossFade() {
    // TODO: part1
    return AnimatedCrossFade(
      firstChild: Container(
        width: 100,
        height: 100,
        color: Colors.greenAccent,
        child: Center(
          child: Text("First State"),
        ),
      ),
      secondChild: Container(
        width: 200,
        height: 200, 
        color: Colors.orangeAccent,
        child: Center(
          child: Text("Second State"),
        ),
      ),
      crossFadeState:
          _isPressed ? CrossFadeState.showFirst : CrossFadeState.showSecond,
      alignment: _isPressed ? Alignment.bottomLeft : Alignment.topRight,
      duration: const Duration(seconds: 3),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AnimatedCrossFaded'),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            // TODO: part2
            setState(() {
              _isPressed = !_isPressed;
            });
          },
          child: customAnimatedCrossFade(),
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
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PracticeAnimatedCrossFaded(),
    );
  }
}

class PracticeAnimatedCrossFaded extends StatefulWidget {
  const PracticeAnimatedCrossFaded({Key? key}) : super(key: key);

  @override
  State<PracticeAnimatedCrossFaded> createState() =>
      _PracticeAnimatedCrossFadedState();
}
