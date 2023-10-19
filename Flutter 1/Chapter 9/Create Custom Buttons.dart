import 'package:flutter/material.dart';

class PracticeCustomWidget extends StatelessWidget {
  //TODO: part 1-1
  Widget customButton({String? text, Color? primary, double? elevation}) {
    return ElevatedButton(
        onPressed: () {},
        child: Text(
          text!,
        ),
        style: ElevatedButton.styleFrom(
          primary: primary,
          elevation: elevation,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          //TODO: part 1-2
          //DO IT AFTER PART 1-1
          customButton(
            text: 'First Button',
            primary: Colors.green,
            elevation: 5,
          ),
          customButton(
            text: 'Second Button',
            primary: Colors.amber,
            elevation: 5,
          ),
          customButton(
            text: 'Third Button',
            primary: Colors.blue,
            elevation: 5,
          ),
        ],
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
          title: const Text(
            'Custom Buttons',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.white,
          centerTitle: true,
          elevation: 1,
        ),
        body: ListView(
          children: [
            SizedBox(
              height: 600,
              child: PracticeCustomWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
