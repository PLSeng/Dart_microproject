import 'package:flutter/material.dart';

class PracticeAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size);
    return Scaffold(
      appBar: AppBar(

        backgroundColor: Colors.blue,
        elevation: 10,
        leading: Icon(
          Icons.keyboard_backspace,
          color: Colors.white,
        ),
        title: Text(
          "Hello, AppBar!",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          Icon(
            Icons.search,
            color: Colors.white,
          ),
          Icon(
            Icons.menu,
            color: Colors.white,
          ),
        ],
      ),
      body: const Center(
        child: Text(
          "I'm Body!",
          style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
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
      home: PracticeAppBar(),
    );
  }
}