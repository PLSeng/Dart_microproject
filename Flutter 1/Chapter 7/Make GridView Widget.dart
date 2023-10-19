import 'package:flutter/material.dart';

class PracticeGridView extends StatefulWidget {
  @override
  State<PracticeGridView> createState() => _PracticeGridViewState();
}

class _PracticeGridViewState extends State<PracticeGridView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      //TODO: part 1
      child: GridView.builder(
        itemCount: 20,
        itemBuilder: (context, index) {
          return Column(
            children: [
              header(index),
              item(index),
            ],
          );
        },
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1 / 1,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
      ),
    );
  }

  Widget header(index) {
    return Expanded(
      flex: 1,
      child: Container(
        color: Colors.blue,
        child: Center(
          child: Text(
            'Header ${index + 1}',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget item(index) {
    return Expanded(
      flex: 2,
      child: Container(
        color: Colors.orange,
        child: Center(
          child: Text(
            '${index + 1}',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
        ),
      ),
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
        appBar: AppBar(
          title: const Text('Practice GridView'),
          centerTitle: true,
        ),
        body: PracticeGridView(),
      ),
    );
  }
}
