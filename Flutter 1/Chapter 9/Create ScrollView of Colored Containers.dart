import 'package:flutter/material.dart';

class PracticeScroll extends StatefulWidget {
  @override
  State<PracticeScroll> createState() => _PracticeScrollState();
}

class _PracticeScrollState extends State<PracticeScroll> {
  Widget customContainer(Color color) {
    return Container(
      height: 200,
      color: color,
    );
  }

  Widget customSingleChildScrollView() {
    return SizedBox(
      // TODO: part 1
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            customContainer(Colors.amberAccent),
            customContainer(Colors.blueAccent),
            customContainer(Colors.redAccent),
            customContainer(Colors.greenAccent),
            customContainer(Colors.cyanAccent),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: part 2
    return Scrollbar(
      thumbVisibility: true,
      child: customSingleChildScrollView(),
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
          title: const Text('Practice Scroll'),
        ),
        body: PracticeScroll(),
      ),
    );
  }
}
