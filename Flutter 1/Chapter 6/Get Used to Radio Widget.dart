import 'package:flutter/material.dart';

var colors = ["Red", "Green", "Blue"];

class PracticeRadioWidget extends StatefulWidget {
  const PracticeRadioWidget({Key? key}) : super(key: key);

  @override
  State<PracticeRadioWidget> createState() => _RadioState();
}

class _RadioState extends State<PracticeRadioWidget> {
  var color = colors[0];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: const Text('Red'),
          // TODO : Part 1
          leading: Radio(
            value: colors[0],
            groupValue: color,
            onChanged: (value) {
              setState(() {
                color = value as String;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Green'),
          // TODO : Part 2
          leading: Radio(
            value: colors[1],
            groupValue: color,
            onChanged: (value) {
              setState(() {
                color = value as String;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Blue'),
          // TODO : Part 3
          leading: Radio(
            value: colors[2],
            groupValue: color,
            onChanged: (value) {
              setState(() {
                color = value as String;
              });
            },
          ),
        ),
      ],
    );
  }
}

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Radio',
      home: Scaffold(
        appBar: AppBar(title: const Text('Radio')),
        body: const Center(
          child: PracticeRadioWidget(),
        ),
      ),
    );
  }
}
