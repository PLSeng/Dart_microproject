import 'package:flutter/material.dart';

class Microject extends StatefulWidget {
  const Microject({Key? key}) : super(key: key);

  @override
  State<Microject> createState() => _MicrojectState();
}

var sorts = ["Rating", "MostViewed", "Latest"];

class _MicrojectState extends State<Microject> {
  bool firstChecked = false;
  bool secondChecked = false;
  bool thirdChecked = false;
  var sort = sorts[0];

  Widget part1() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // TODO : Part 1
        Container(
          margin: EdgeInsets.all(15),
          child: Text(
            "Sort by",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ListTile(
          title: Text('Rating'),
          leading: Radio(
            value: sorts[0],
            groupValue: sort,
            onChanged: (value) {
              setState(() {
                sort = value as String;
              });
            },
          ),
        ),
        ListTile(
          title: Text('Most Viewed'),
          leading: Radio(
            value: sorts[1],
            groupValue: sort,
            onChanged: (value) {
              setState(() {
                sort = value as String;
              });
            },
          ),
        ),
        ListTile(
          title: Text('Latest'),
          leading: Radio(
            value: sorts[2],
            groupValue: sort,
            onChanged: (value) {
              setState(() {
                sort = value as String;
              });
            },
          ),
        ),
      ],
    );
  }

  Widget part2() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // TODO : Part 2
        Container(
          margin: EdgeInsets.all(15),
          child: Text(
            "Genre",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        ListTile(
          title: Text('Horror'),
          leading: Checkbox(
            value: firstChecked,
            onChanged: (value) {
              setState(() {
                firstChecked = value!;
              });
            },
          ),
        ),
        ListTile(
          title: Text('Drama'),
          leading: Checkbox(
            value: secondChecked,
            onChanged: (value) {
              setState(() {
                secondChecked = value!;
              });
            },
          ),
        ),
        ListTile(
          title: Text('Thriller'),
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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        part1(),
        const Divider(
          indent: 20,
          endIndent: 20,
        ),
        part2()
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
      title: 'Microject',
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Filter',
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.w700, color: Colors.black),
          ),
          backgroundColor: Colors.white,
          centerTitle: false,
          elevation: 1,
        ),
        body: const Center(
          child: Microject(),
        ),
      ),
    );
  }
}
