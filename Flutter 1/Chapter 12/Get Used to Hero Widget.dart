import 'package:flutter/material.dart';

Widget firstPageColumn() {
  // TODO: part1
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      customHero("first tag", 200),
      customHero("second tag", 200),
      customHero("third tag", 200),
    ],
  );
}

Widget secondPageColumn() {
  // TODO: part2
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      customHero("first tag", 300),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          customHero("second tag", 150),
          customHero("third tag", 150),
        ],
      ),
    ],
  );
}

Widget customHero(String tag, double size) {
  // TODO: part3
  return Hero(
    tag: tag,
    child: SizedBox(
      width: size,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.network(
          "https://firebasestorage.googleapis.com/v0/b/new-ml-6c02d.appspot.com/o/Course2_Microproject%2CExam_image%2Fperson2.jpg?alt=media&token=81e986ba-0503-4479-8612-6bc8e71c27ce",
          width: size,
          fit: BoxFit.fitHeight,
        ),
      ),
    ),
  );
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PracticeHero(),
    );
  }
}

class PracticeHero extends StatefulWidget {
  @override
  State<PracticeHero> createState() => _PracticeHeroState();
}

class _PracticeHeroState extends State<PracticeHero> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hero First'),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HeroPage()));
          },
          child: firstPageColumn(),
        ),
      ),
    );
  }
}

class HeroPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hero Second'),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: secondPageColumn(),
        ),
      ),
    );
  }
}
