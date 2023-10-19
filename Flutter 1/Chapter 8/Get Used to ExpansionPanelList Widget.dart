import 'package:flutter/material.dart';

class MicroProject extends StatefulWidget {
  const MicroProject({Key? key}) : super(key: key);
  @override
  State<MicroProject> createState() => _MicroProjectState();
}

class _MicroProjectState extends State<MicroProject> {
  final List<Item> items = generateItems(3);

  Widget part1() {
    return ExpansionPanelList(
      // TODO : Part 1
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          items[index].isExpanded = !isExpanded;
        });
      },
      children: items.map<ExpansionPanel>((Item item) {
        return ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              title: Text(item.headerValue),
            );
          },
          body: ListTile(
            title: Text(item.expandedValue),
            trailing: Icon(Icons.delete),
            subtitle: Text('To delete this panel, tap the trash can icon'),
            onTap: () {
              setState(() {
                items.removeWhere((Item currentItem) => item == currentItem);
              });
            },
          ),
          isExpanded: item.isExpanded,
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Expansion Panel')),
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

List<Item> generateItems(int numberOfItems) {
  return List<Item>.generate(numberOfItems, (int index) {
    return Item(
      headerValue: 'Panel $index',
      expandedValue: 'This is item number $index',
    );
  });
}

class Item {
  Item({
    required this.expandedValue,
    required this.headerValue,
    this.isExpanded = false,
  });

  String expandedValue;
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
