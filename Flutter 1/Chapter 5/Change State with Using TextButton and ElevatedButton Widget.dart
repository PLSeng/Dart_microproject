import 'package:flutter/material.dart';

class _PracticeTextButtonState extends State<PracticeTextButton> {
  bool favoriteLike = false;
  bool thumbUp = false;
  bool star = false;
  bool check = false;

  Widget part1() {
    return SizedBox(
      height: 80,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // TODO : part1
          Icon(
            thumbUp ? Icons.thumb_up : Icons.thumb_up,
            color: thumbUp ? Colors.blue : Colors.grey[300],
          ),
          TextButton(
            child: Text('LIKE BUTTON'),
            onPressed: () {
              setState(() {
                thumbUp = !thumbUp;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget part2() {
    return SizedBox(
      height: 80,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // TODO : part2
          Icon(
            favoriteLike ? Icons.favorite : Icons.favorite_border,
            color: star ? Colors.red : Colors.red,
          ),
          TextButton(
            child: Text('FAVORITE BUTTON'),
            onPressed: () {
              setState(() {
                favoriteLike = !favoriteLike;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget part3() {
    return SizedBox(
      height: 80,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // TODO : part3
          Icon(
            star ? Icons.star : Icons.star_outline,
            color: star ? Colors.amber : Colors.amber,
          ),
          ElevatedButton.icon(
            onPressed: () {
              setState(() {
                star = !star;
              });
            },
            icon: Icon(
              Icons.flash_on,
            ),
            label: Text('STAR BUTTON'),
          ),
        ],
      ),
    );
  }

  Widget part4() {
    return SizedBox(
      height: 80,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // TODO : part4
          Icon(
            check ? Icons.check_circle : Icons.circle,
            color: check ? Colors.green : Colors.green,
          ),
          ElevatedButton.icon(
            onPressed: () {
              setState(() {
                check = !check;
              });
            },
            icon: Icon(Icons.add),
            label: Text('CHECK BUTTON'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Practice TextButton'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                part1(),
                part2(),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                part3(),
                part4(),
              ],
            ),
          ],
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
      home: PracticeTextButton(),
    );
  }
}

class PracticeTextButton extends StatefulWidget {
  @override
  State<PracticeTextButton> createState() => _PracticeTextButtonState();
}
