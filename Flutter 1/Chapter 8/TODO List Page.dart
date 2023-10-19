import 'package:flutter/material.dart';

class MicroProject extends StatefulWidget {
  const MicroProject({Key? key}) : super(key: key);
  @override
  State<MicroProject> createState() => _MicroProjectState();
}

class _MicroProjectState extends State<MicroProject> {
  final List<Item> data = [
    Item(
      expandedValue: ['Cleaning desks', 'Preparing books', 'Setting up timers'],
      headerValue: 'Study',
      isExpanded: false,
    ),
    Item(
      expandedValue: ['Make bed', 'Meditate for 10minutes', 'Drink water'],
      headerValue: 'Miracle morning',
      isExpanded: false,
    ),
    Item(
      expandedValue: [
        'Stretch before sleep',
        'Stretch every 1 hour',
      ],
      headerValue: 'Physique',
      isExpanded: false,
    ),
  ];
  TextStyle headerStyle =
      const TextStyle(fontWeight: FontWeight.bold, fontSize: 16);
  TextStyle numberStyle = const TextStyle(
      color: Colors.grey, fontWeight: FontWeight.w400, fontSize: 12);
  TextStyle itemStyle =
      const TextStyle(fontWeight: FontWeight.w400, fontSize: 14);

  Widget part1() {
    //TODO: Part 1
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          data[index].isExpanded = isExpanded;
        });
      },
      children: data.map<ExpansionPanel>((Item item) {
        return ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              title: Row(
                children: [
                  Text(
                    item.headerValue,
                    style: headerStyle,
                  ),
                  Text(
                    '(${item.expandedValue.length})',
                    style: numberStyle,
                  ),
                ],
              ),
            );
          },
          body: Padding(
            padding: EdgeInsets.only(
              left: 16,
            ),
            child: Column(
              children: [
                for (String subItem in item.expandedValue)
                  ListTile(
                    title: Text(
                      subItem,
                      style: itemStyle,
                    ),
                  ),
              ],
            ),
          ),
          isExpanded: item.isExpanded,
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Todo List',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w700, color: Colors.black),
        ),
        backgroundColor: Colors.white,
        centerTitle: false,
        elevation: 1,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: part1(),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(const MyApp());
}

class Item {
  Item({
    required this.expandedValue,
    required this.headerValue,
    this.isExpanded = false,
  });

  List<String> expandedValue;
  String headerValue;
  bool isExpanded;
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
