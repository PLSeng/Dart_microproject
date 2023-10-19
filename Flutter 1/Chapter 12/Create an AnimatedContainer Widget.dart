import 'dart:math';
import 'package:flutter/material.dart';

class _PracticAnimatedContainerState extends State<PracticAnimatedContainer> {
  ContainerState _containerState = ContainerState(
      width: 100,
      height: 100,
      color: Colors.blue,
      alignment: Alignment.center,
      text: "Not Tapped");
  int counter = 0;

  Widget customAnimatedContainer() {
    // TODO: part1
    return AnimatedContainer(
      duration: Duration(seconds: 2),
      curve: Curves.fastOutSlowIn,
      width: _containerState.width,
      height: _containerState.height,
      color: _containerState.color,
      alignment: _containerState.alignment,
      child: Center(
        child: Text(_containerState.text),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Practice AnimatedContainer'),
      ),
      body: GestureDetector(
        onTap: () {
          setState(() {
            counter++;
            final random = Random();
            // TODO: part2
            _containerState = ContainerState(
              width: random.nextInt(100).toDouble() + 100,
              height: random.nextInt(100).toDouble() + 30,
              color: Color.fromRGBO(
                random.nextInt(256),
                random.nextInt(256),
                random.nextInt(256),
                random.nextDouble(),
              ),
              alignment: Alignment.center,
              text: "Tapped: $counter",
            );
          });
        },
        child: Center(
          child: customAnimatedContainer(),
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
      home: PracticAnimatedContainer(),
    );
  }
}

class PracticAnimatedContainer extends StatefulWidget {
  @override
  State<PracticAnimatedContainer> createState() =>
      _PracticAnimatedContainerState();
}

class ContainerState {
  final double width;
  final double height;
  final Color color;
  final Alignment alignment;
  final String text;

  ContainerState(
      {required this.width,
      required this.height,
      required this.color,
      required this.alignment,
      required this.text});
}
