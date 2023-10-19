import 'package:flutter/material.dart';

class MicroProject extends StatelessWidget {
  const MicroProject({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FAB'),
      ),
      body: const Center(
        child: Text('The Floating Action Button'),
      ),

      // TODO : part1
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          Icons.add,
        ),
        splashColor: Colors.purple,
        backgroundColor: Colors.red,
        elevation: 6,
        tooltip: 'This is a FAB',
      ),
    );
  }
}

//ch4 mp3
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MicroProject(),
    );
  }
}
