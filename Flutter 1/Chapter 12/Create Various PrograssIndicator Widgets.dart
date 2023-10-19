import 'package:flutter/material.dart';

class _PracticeProgressIndicatorsState extends State<PracticeProgressIndicators>{

  Widget customCPI() {
    // TODO: part1
    return CircularProgressIndicator(
      color: Colors.green,
      semanticsLabel: "This is CircularProgressIndicator",
    );
  }

  Widget customLPI() {
    // TODO: part2
    return LinearProgressIndicator(
      backgroundColor: Colors.grey,
      color: Colors.green,
      semanticsLabel: "This is LinearProgressIndicator",
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Practice ProgressIndicators'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            const Text(
              'This is CircularProgressIndicator',
              style: TextStyle(fontSize: 20),
            ),
            customCPI(),
            const Text(
              'This is LinearProgressIndicator',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 15,
              width: 300,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                child: customLPI(),
              ),
            ),
          ],
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
      home: PracticeProgressIndicators(),
    );
  }
}

class PracticeProgressIndicators extends StatefulWidget {
  @override
  State<PracticeProgressIndicators> createState() =>
      _PracticeProgressIndicatorsState();
}