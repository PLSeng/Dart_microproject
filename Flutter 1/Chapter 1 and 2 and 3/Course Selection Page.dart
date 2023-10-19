import 'package:flutter/material.dart';

class Microject extends StatelessWidget {

  Widget part1() {
    return Divider(
        thickness: 3,
        color: Color(0xFFE8E8E8),
    );
  }

  Widget part2(String text1, String text2, String text3) {
    return Container(
        height: 103,
        padding: const EdgeInsets.only(left: 23, top: 20),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                text1,
                style: TextStyle(
                  fontSize: 10,
                  color: Color(0xFF757575)
                ),
              ),
              SizedBox(height: 3,),
              Text(
                text2,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 7,),
              Text(
                text3,
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF757575),
                ),
              ),
            ],
          ),
    );
  }
  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 43,),
          part2('English/Korean', 'Web/App development', 'Flutter Framework based applications'),
          part1(),
          part2('Korean', 'Advanced Flutter Camp', 'Camps for flutter experienced'),
          part1(),
          part2('Korean', 'Design and Developer Collaboration', 'To understand each position'),
          part1(),
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
      home: Microject(),
    );
  }
}