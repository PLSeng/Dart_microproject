import 'package:flutter/material.dart';

class PracticeDateTimePicker extends StatefulWidget {
  @override
  State<PracticeDateTimePicker> createState() => _PracticeDateTimePickerState();
}

class _PracticeDateTimePickerState extends State<PracticeDateTimePicker> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DateTime Picker'),
      ),
      body: Center(
        child: Column(
          children: [
            TextButton(
                child: const Text('DatePicker'),
                onPressed: () {
                  // TODO : Part 1
                  showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2020),
                    lastDate: DateTime(2025),
                  );
                }),
            TextButton(
                child: const Text('TimePicker'),
                onPressed: () {
                  // TODO : Part 2
                  showTimePicker(
                      context: context, initialTime: TimeOfDay.now());
                }),
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
      home: PracticeDateTimePicker(),
    );
  }
}
