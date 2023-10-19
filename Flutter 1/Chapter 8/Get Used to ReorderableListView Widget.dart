import 'package:flutter/material.dart';

class PracticeReorderableListView extends StatefulWidget {
  @override
  State<PracticeReorderableListView> createState() =>
      _PracticeReorderableListViewState();
}

class _PracticeReorderableListViewState
    extends State<PracticeReorderableListView> {
  Widget part1() {
    return ReorderableListView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      children: <Widget>[
        // TODO : Part 1
        for (int i = 0; i < _items.length; i++)
          Card(
            key: Key('$i'),
            elevation: 5,
            child: ListTile(
              title: Text(
                "Number ${_items[i]}",
              ),
            ),
          ),
      ],
      onReorder: (int oldIndex, int newIndex) {
        setState(() {
          if (oldIndex < newIndex) {
            newIndex--;
          }
          final int item = _items.removeAt(oldIndex);
          _items.insert(newIndex, item);
        });
      },
    );
  }

  final List<int> _items = List<int>.generate(10, (int index) => index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("ReorderableListView"),
        ),
        body: part1());
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
      home: PracticeReorderableListView(),
    );
  }
}
