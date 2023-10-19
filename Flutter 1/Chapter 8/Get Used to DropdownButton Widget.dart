import 'package:flutter/material.dart';

class MicroProject extends StatefulWidget {
  const MicroProject({Key? key}) : super(key: key);
  @override
  State<MicroProject> createState() => _MicroProjectState();
}

class _MicroProjectState extends State<MicroProject> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dropdown Button'),
      ),
      body: Center(
        child: Column(
          children: [
            // TODO : Part 1
            DropdownButton(
              items: fruits.map((String fruit) {
                return DropdownMenuItem(
                  value: fruit,
                  child: Text(fruit),
                );
              }).toList(),
              onChanged: (dynamic newFruit) {
                setState(() {
                  selectedFruit = newFruit as String;
                });
              },
            ),
            const SizedBox(
              height: 100,
            ),
            Text(selectedFruit),
            // TODO : Part 2
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                color: fruitColors[selectedFruit],
                borderRadius: BorderRadius.circular(50),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String selectedFruit = 'Apple';
  var fruits = [
    'Apple',
    'Orange',
    'Banana',
  ];
  var fruitColors = {
    'Apple': Colors.red,
    'Orange': Colors.orange,
    'Banana': Colors.yellow
  };
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
