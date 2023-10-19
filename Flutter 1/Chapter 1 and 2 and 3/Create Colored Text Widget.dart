import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class PracticeText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Text(
          'The two most important days in your life are the day you are born and the day you find out why.',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize : 20,
            fontWeight : FontWeight.w600,
            height: 2.0,
            color: Colors.indigo
          ),
        ),

        
        SizedBox(height: 12),
        Text(
          '- Mark Twain -',
          style: TextStyle(
            fontSize : 14,
            color : Color(0xff8C8C8C)
          ),
        ),  
      ],
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: ListView(children: [
          SizedBox(height: 600, child: PracticeText()),
        ]),
      ),
    );
  }
}


