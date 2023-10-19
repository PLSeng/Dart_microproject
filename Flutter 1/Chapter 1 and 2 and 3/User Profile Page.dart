 import 'package:flutter/material.dart';

class Microject extends StatelessWidget {
  Widget part1() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Text(
          'Peter Ashe',
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          'Product Designer',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w400,
            color: Color(0xFF8C8C8C),
          ),
        ),
        SizedBox(height: 24,),
        Divider(
            thickness: 1,
            color : Color(0xFFE2E2E2)
        ),
      ],
    );
  }

  Widget part2(IconData icon, String text) {
    return Row(
      children: [
        Icon(
          icon,
          size: 14,
          color: Colors.grey,
        ),
        const SizedBox(width: 10,),
        Text(
          text,
        style: const TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size);
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(left: 31),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(height: 520, child: part1()),
          Padding(
            padding: const EdgeInsets.only(bottom: 61),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                part2(Icons.call, '+82 10-1234-5678'),
                const SizedBox(
                  height: 7,
                ),
                part2(Icons.email, 'microlearnable@gmail.com'),
                const SizedBox(
                  height: 7,
                ),
                part2(Icons.location_on, 'MicroLearnable'),
              ],
            ),
          )
        ],
      ),
    ));
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