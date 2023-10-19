import 'package:flutter/material.dart';

class Microject extends StatelessWidget {
  const Microject({Key? key, required this.imageUrl, required this.text})
      : super(key: key);
  final String imageUrl;
  final String text;

  PreferredSizeWidget part1() {
    //TODO: part 1
    return AppBar(
      automaticallyImplyLeading: false,
      elevation: 0,
      backgroundColor: const Color(0xFFFEFBE8),
      titleSpacing: 20,
      title: Text(
        'Meal',
        style: TextStyle(
          color: Color(0xFFEA6137),
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 20),
          child: Icon(
            Icons.people,
            color: Color(0xFFEA6137),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: 20),
          child: Icon(
            Icons.favorite_border,
            color: Color(0xFFEA6137),
          )
        ),
      ],
    );
  }

  Widget part2() {
    return SizedBox(
      //TODO: part 2
      child: Image.network(imageUrl, fit: BoxFit.cover),
    );
  }

  Widget part3() {
    return SizedBox(
      //TODO: part 3
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Pesto Eggs',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w600,
                color: Color(0xFF4B6F62),
              ),
            ),
            Divider(
              color: Color(0xFF57946C),
              thickness: 1,
            ),
          ],
        ),
      ),
    );
  }

  Widget part4(String text1, String text2) {
    //TODO: part 4
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: Color(0xFFF2F8C4),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text1,
            style: TextStyle(
              fontSize: 12,
              color: Color(0xFF77831C),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            text2,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFFEA6137),
            ),
          ),
        ],
      ),
    );
  }

  Widget part5() {
    return SizedBox(
      //TODO: part 5
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20,),
        child: Text(
          text,
          textAlign: TextAlign.start,
          style: TextStyle(
            fontSize: 16,
            letterSpacing: 1.1,
            height: 1.5,
          ),
        ),
      ),
    );
  }

  Widget threeRow() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          part4("TOTAL TIME", "30 min"),
          part4("YIELD", "2 servings"),
          part4("INGREDIENT", "Egg"),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: part1(),
      backgroundColor: const Color(0xFFFEFBE8),
      body: ListView(
        children: [
          SizedBox(
            height: 812,
            child: Column(
              children: [
                part2(),
                part3(),
                threeRow(),
                part5(),
              ],
            ),
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
  String imageUrl =
      "https://firebasestorage.googleapis.com/v0/b/new-ml-6c02d.appspot.com/o/Course2_Microproject%2CExam_image%2Ffood1.png?alt=media&token=5d80239a-41b5-4c97-8d5e-3e522897639f";
  String text =
      "The pesto adds a massive flavor boost to traditional fried eggs. Instead of using oil or butter to cook your eggs, you spread a thin layer of pesto in a frying pan and cook the eggs slowly till they have nice crispy edges, but a still runny center.";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Microject(imageUrl: imageUrl, text: text),
    );
  }
}
