import 'package:flutter/material.dart';

class PracticeDismissible extends StatefulWidget {
  @override
  State<PracticeDismissible> createState() => _PracticeDismissibleState();
}

class _PracticeDismissibleState extends State<PracticeDismissible> {
  final List<int> _items = List<int>.generate(10, (int index) => index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Dismissible"),
        ),
        body: ListView.builder(
          itemCount: _items.length,
          itemBuilder: (context, index) {
            return Dismissible(
              // TODO : Part 1
              key: ValueKey<int>(_items[index]),
              onDismissed: (DismissDirection direction) {
                setState(() {
                  _items.removeAt(index);
                });
              },
              child: ListTile(
                title: Text(
                  _items[index].toString(),
                ),
              ),
              // TODO : Part 2
              background: Container(
                color: Colors.red,
                child: ListTile(
                  title: Text(
                    "Dismissing...",
                  ),
                ),
              ),
            );
          },
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
      home: PracticeDismissible(),
    );
  }
}
