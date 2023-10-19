import 'package:flutter/material.dart';

class PracticeChip extends StatefulWidget {
  const PracticeChip({Key? key}) : super(key: key);

  @override
  State<PracticeChip> createState() => _PracticeChipState();
}

class _PracticeChipState extends State<PracticeChip> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Practice Chip'),
      ),
      body: Center(
        // TODO: Part 1
        child: Wrap(
          spacing: 4.0,
          children: [
            Chip(
              backgroundColor: Colors.green,
              avatar: Icon(
                Icons.android,
                color: Colors.white,
              ),
              label: const Text(
                'Android',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            // TODO: Part 2
            Chip(
              backgroundColor: Colors.blueAccent,
              avatar: FlutterLogo(),
              label: const Text(
                'Flutter',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
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
      home: PracticeChip(),
    );
  }
}
