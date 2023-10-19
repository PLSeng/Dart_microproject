import 'package:flutter/material.dart';

class Microject extends StatelessWidget {
  // TODO : part1
  PreferredSizeWidget part1() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation:1,
      centerTitle: false,
      title: Text(
        'Movie Poster',
        style: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  // TODO : part2
  Widget part2() {
    return Container(
      constraints: const BoxConstraints(minWidth: double.infinity,),
      height: 520,
      child: Image(
        image: NetworkImage(imageUrl),
        fit: BoxFit.fill,
      ),
    );
  }

  // TODO : part3
  Widget part3(String text1, String text2) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 68,
          width: 5,
          color: Colors.black,
        ),
        SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              text1,
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.w900,
              ),
            ),
            Text(
              text2,
              style: TextStyle(
                fontSize: 22,
                color : Color(0xFF969696)
              ),
            ),
          ],
        ),
      ],
    );
  }

  final imageUrl = 'https://images.unsplash.com/photo-1518676590629-3dcbd9c5a5c9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80 ';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: part1(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          part2(),
          Padding(
            padding: const EdgeInsets.fromLTRB(26, 25, 0, 0),
            child: part3('The Action', 'Story of producers'),
          )
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