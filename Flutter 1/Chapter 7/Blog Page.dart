import 'package:flutter/material.dart';

class _MicrojectState extends State<Microject> {
  Widget part1() {
    // TODO : part 1
    return ListView.builder(
      itemCount: peopleList.length,
      itemBuilder: (context, index) {
        return part2(index);
      },
    );
  }

  Widget part2(int index) {
    return Column(
      children: [
        // TODO : part 2
        ListTile(
          contentPadding: EdgeInsets.fromLTRB(24, 10, 0, 10),
          leading: Icon(
            Icons.account_circle,
            color: Colors.blue,
            size: 46,
          ),
          title: Text(
            peopleList[index]['name'],
            style: TextStyle(fontSize: 16),
          ),
          subtitle: Text(
            peopleList[index]['job'],
            style: TextStyle(fontSize: 16, color: Color(0xFF979797)),
          ),
        ),
        const Divider(
          height: 1,
          thickness: 1,
          color: Color(0xFFD7D7D7),
        )
      ],
    );
  }

  List peopleList = [
    {
      'name': 'Savannah Nguyen',
      'job': 'Web Designer',
    },
    {
      'name': 'Kristin Watson',
      'job': 'Nursing Assistant',
    },
    {
      'name': 'Arlene McCoy',
      'job': 'President of Sales',
    },
    {
      'name': 'Marvin McKinney',
      'job': 'Nursing Assistant',
    },
    {
      'name': 'Jenny Wilson',
      'job': 'Medical Assistant',
    },
    {
      'name': 'Floyd Miles',
      'job': 'Marketing Coordinator',
    },
    {
      'name': 'Jerome Bell',
      'job': 'Dog Trainer',
    },
    {
      'name': 'Peter Nguyen',
      'job': 'Mobile App Designer',
    },
    {
      'name': 'Kristin Wilson',
      'job': 'Mobile App Developer',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: const Text(
            'Blog',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
          backgroundColor: Colors.white,
          elevation: 1,
        ),
        body: Column(
          children: [
            Row(
              children: [
                Container(
                  height: 58,
                  width: MediaQuery.of(context).size.width * 0.5,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                      border: Border(
                          bottom: BorderSide(width: 3, color: Colors.black))),
                  child: const Text(
                    'Friends',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Container(
                  height: 58,
                  width: MediaQuery.of(context).size.width * 0.5,
                  alignment: Alignment.center,
                  child: const Text(
                    'Image',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
            SizedBox(
                height: MediaQuery.of(context).size.height * 0.8,
                child: part1())
          ],
        ));
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
