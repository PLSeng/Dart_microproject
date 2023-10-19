import 'package:flutter/material.dart';

class PracticeCheckboxWidget extends StatefulWidget {
  const PracticeCheckboxWidget({Key? key}) : super(key: key);

  @override
  State<PracticeCheckboxWidget> createState() => _CheckboxState();
}

class _CheckboxState extends State<PracticeCheckboxWidget> {
  bool firstChecked = false;
  bool secondChecked = false;
  bool thirdChecked = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: const Text('Horror'),
          // TODO : Part 1
          leading: Checkbox(
            value: firstChecked,
            onChanged: (value) {
              setState(() {
                firstChecked = value!;
              });
            },
            // TODO : Part 4
            activeColor: Colors.lightBlueAccent,
          ),
        ),
        ListTile(
            title: const Text('Drama'),
            // TODO : Part 2
            leading: Checkbox(
              value: secondChecked,
              onChanged: (value) {
                setState(() {
                  secondChecked = value!;
                });
              },
            )),
        ListTile(
          title: const Text('Thriller'),
          // TODO : Part 3
          leading: Checkbox(
            value: thirdChecked,
            onChanged: (value) {
              setState(() {
                thirdChecked = value!;
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
      title: 'Checkbox',
      home: Scaffold(
        appBar: AppBar(title: const Text('Checkbox')),
        body: const Center(
          child: PracticeCheckboxWidget(),
        ),
      ),
    );
  }
}
