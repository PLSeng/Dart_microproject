import 'package:flutter/material.dart';

class PracticeListView extends StatefulWidget {
  @override
  State<PracticeListView> createState() => _PracticeListViewState();
}

class _PracticeListViewState extends State<PracticeListView> {
  final List<bool> _isFavorited = List<bool>.filled(20, false);
  final List<bool> _selected = List.generate(20, (i) => false);

  Widget buildBody() {
    return SizedBox(
      //TODO: part 1
      child: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return customListTile(index);
        },
        itemCount: 20,
      ),
    );
  }

  Widget customListTile(index) {
    return ListTile(
      //TODO: part 2
      leading: Icon(
        _isFavorited[index] ? Icons.favorite : Icons.favorite_border,
        color:
            _isFavorited[index] ? Color.fromRGBO(255, 0, 0, 0.3) : Colors.grey,
      ),
      tileColor: _selected[index] ? Color.fromRGBO(255, 191, 0, 0.1) : null,
      //TODO: part 3
      title: Text('ListTile ${index + 1}'),
      //TODO: part 4
      onTap: () {
        setState(() {
          _selected[index] = !_selected[index];
          _isFavorited[index] = !_isFavorited[index];
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return buildBody();
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
        appBar: AppBar(
          title: const Text('Practice ListView'),
          centerTitle: true,
        ),
        body: PracticeListView(),
      ),
    );
  }
}
