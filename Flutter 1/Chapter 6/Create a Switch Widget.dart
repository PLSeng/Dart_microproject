import 'package:flutter/material.dart';

class MicroProject extends StatefulWidget {
  const MicroProject({Key? key}) : super(key: key);
  @override
  State<MicroProject> createState() => _MicroProjectState();
}

class _MicroProjectState extends State<MicroProject> {
  bool isOn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Switch'),
      ),
      body: Center(
        // TODO: Part 1
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.lightbulb,
              size: 200,
              color: isOn ? Colors.yellow : Colors.grey,
            ),
            Switch(
              value: isOn,
              onChanged: (value) {
                setState(() {
                  isOn = value;
                });
              },
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
      home: MicroProject(),
    );
  }
}
