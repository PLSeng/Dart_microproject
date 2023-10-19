import 'package:flutter/material.dart';

class PracticePadding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          width: 200,
          height: 140,
          decoration: BoxDecoration(
              color: Colors.indigo, borderRadius: BorderRadius.circular(20)),
          child: Padding(

            // TODO : part2
            // Do after PART 1
            padding: EdgeInsets.all(24),

            // TODO : part1

            child: Container(
              decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(20)),
            ),
          ),
        ),
        Container(
          width: 200,
          height: 140,
          decoration: BoxDecoration(
              color: Colors.amber, borderRadius: BorderRadius.circular(20)),
          child: Padding(

            // TODO PART 4
            // Do after PART 3
            padding : EdgeInsets.symmetric(horizontal: 48, vertical:24),

            // TODO PART 3
            child:Container(
              decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(20)),
            ),


          ),
        ),
      ],
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
        body: ListView(children: [
          SizedBox(height: 812, child: PracticePadding()),
        ]),
      ),
    );
  }
}
7