import 'package:flutter/material.dart';

class PracticeSlider extends StatefulWidget {
  const PracticeSlider({Key? key}) : super(key: key);

  @override
  State<PracticeSlider> createState() => _PracticeSliderState();
}

class _PracticeSliderState extends State<PracticeSlider> {
  double sliderValue = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Practice Slider'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // TODO: Part 1
            Slider(
              min: 0,
              max: 10,
              divisions: 10,
              label: sliderValue.round().toString(),
              value: sliderValue,
              onChanged: (double val) {
                setState(() {
                  sliderValue = val;
                });
              },
            ),
            Text(sliderValue.toString()),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PracticeSlider(),
    );
  }
}
