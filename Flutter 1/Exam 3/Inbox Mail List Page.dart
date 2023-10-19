import 'dart:ui';

import 'package:flutter/material.dart';

class _MicrojectState extends State<Microject> {
  Widget part1() {
    // TODO: part1
    return AppBar(
      flexibleSpace: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: EdgeInsets.only(left: 34, right: 31),
            child: Row(
              children: [
                Text(
                  'Inbox',
                  style: TextStyle(
                    color: Color(0xFF058A22),
                    fontSize: 40,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Spacer(),
                Icon(
                  Icons.search,
                  color: Color(0xFF058A22),
                  size: 32,
                ),
              ],
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      elevation: 0,
    );
  }

  Widget part2() {
    // TODO: part2
    return ListView.builder(
      itemCount: data.length,
      itemExtent: 128,
      itemBuilder: (context, index) {
        return Dismissible(
          background: Container(
            alignment: Alignment.centerLeft,
            color: Color(0xFF058A22),
            child: Padding(
              padding: EdgeInsets.only(right: 25),
              child: Icon(
                Icons.clear,
                size: 26,
                color: Colors.white,
              ),
            ),
          ),
          secondaryBackground: Container(
            alignment: Alignment.centerRight,
            color: Color(0xFF058A22),
            child: Padding(
              padding: EdgeInsets.only(right: 25),
              child: Icon(
                Icons.clear,
                size: 26,
                color: Colors.white,
              ),
            ),
          ),
          key: ValueKey<String>(data[index].title),
          onDismissed: (DismissDirection direction) {
            setState(() {
              data.removeAt(index);
            });
          },
          child: part3(index),
        );
      },
    );
  }

  Widget part3(int index) {
    // TODO: part3
    return Padding(
        padding: EdgeInsets.only(left: 32, right: 28),
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data[index].title,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  data[index].alert,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF6F6F6F),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  data[index].description,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFFD7D7D7),
                  ),
                ),
              ],
            ),
            Expanded(child: Container(),),
            Text(
              "${data[index].hour}:${data[index].min}",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Color(0xFF058A22),
              ),
            ),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size(375, 100),
        child: part1(),
      ),
      body: part2(),
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
      home: Microject(),
    );
  }
}

class Microject extends StatefulWidget {
  @override
  State<Microject> createState() => _MicrojectState();
}

List<Data> data = [
  Data(
      hour: "06",
      min: "50",
      title: "Flutter",
      alert: "You've received 14 emails!",
      description: "Hello, check out the new promotion..."),
  Data(
      hour: "11",
      min: "20",
      title: "Figma",
      alert: "You've got a new mail!",
      description: "Hello, check out the new promotion..."),
  Data(
      hour: "14",
      min: "31",
      title: "Firebase",
      alert: "There are 6 emails waiting for you!",
      description: "Hello, check out the new promotion..."),
  Data(
      hour: "18",
      min: "51",
      title: "Pinterest",
      alert: "No news today!",
      description: "Hello, check out the new promotion..."),
  Data(
      hour: "20",
      min: "44",
      title: "Youtube",
      alert: "You've received 5 emails!",
      description: "Hello, check out the new promotion..."),
];

class Data {
  final String hour;
  final String min;
  final String title;
  final String alert;
  final String description;

  Data(
      {required this.hour,
      required this.min,
      required this.title,
      required this.alert,
      required this.description});
}



