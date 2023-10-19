import 'package:flutter/material.dart';

class PracticeIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 48),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.add_box,
                  color: Colors.blue,
                  size: 18,
                  semanticLabel: 'add_box',
                ),
                Text(
                  'add_box Icon',
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
            Divider(
              color: Colors.blue,
              height: 2,
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.filter,
                  color: Colors.red,
                  size: 18,
                  semanticLabel: 'filter',
                ),
                Text(
                  'filter Icon',
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
            Divider(
              color: Colors.red,
              height: 2,
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.notifications,
                  color: Colors.orange,
                  size: 18,
                  semanticLabel: 'notifications',
                ),
                Text(
                  'notifications Icon',
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
            Divider(
              color: Colors.orange,
              height: 2,
            ),
          ]),
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
        body: ListView(children: [
          SizedBox(height: 600, child: PracticeIcon()),
        ]),
      ),
    );
  }
}