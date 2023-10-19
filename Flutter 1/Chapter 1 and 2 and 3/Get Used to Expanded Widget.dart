import 'package:flutter/material.dart';

class PracticeExpanded extends StatelessWidget {
  const PracticeExpanded(
      {Key? key,
      required this.imageUrl1,
      required this.imageUrl2,
      required this.imageUrl3,
      required this.imageUrl4})
      : super(key: key);
  final String imageUrl1;
  final String imageUrl2;
  final String imageUrl3;
  final String imageUrl4;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      decoration: const BoxDecoration(
        color: Colors.yellowAccent,
      ),
      child: Column(
        children: [
          Container(
              height: 80,
              width: double.infinity,
              child: Image.network(imageUrl1, fit: BoxFit.cover)),

          // TODO : part1
          Expanded(
              child: Container(
                width: double.infinity,
                child: Image.network(imageUrl2, fit: BoxFit.cover),
              ),
          ),


          // TODO : part2
          Expanded(
            child: Container(
              width: double.infinity,
              child: Image.network(imageUrl3, fit: BoxFit.cover),
            ),
          ),
         

          Container(
            height: 80,
            width: double.infinity,
            child: Image.network(imageUrl4, fit: BoxFit.cover),
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
  final String imageUrl1 =
      "https://firebasestorage.googleapis.com/v0/b/new-ml-6c02d.appspot.com/o/Course2_Microproject%2CExam_image%2Fmovie1.jpg?alt=media&token=65e84654-2001-47cd-ba0d-5a978a163a2d";
  final String imageUrl2 =
      "https://firebasestorage.googleapis.com/v0/b/new-ml-6c02d.appspot.com/o/Course2_Microproject%2CExam_image%2Fmovie2.jpg?alt=media&token=d102e69f-96c3-46d3-bffd-12e48ef39cdf";
  final String imageUrl3 =
      "https://firebasestorage.googleapis.com/v0/b/new-ml-6c02d.appspot.com/o/Course2_Microproject%2CExam_image%2Fmovie3.jpg?alt=media&token=fabeaf0d-d479-4a3e-9346-b40a5ed15ce3";
  final String imageUrl4 =
      "https://firebasestorage.googleapis.com/v0/b/new-ml-6c02d.appspot.com/o/Course2_Microproject%2CExam_image%2Fmovie4.jpg?alt=media&token=ef3ab1be-0416-4eab-a5a6-cfe6b1381811";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: ListView(children: [
          PracticeExpanded(
              imageUrl1: imageUrl1,
              imageUrl2: imageUrl2,
              imageUrl3: imageUrl3,
              imageUrl4: imageUrl4),
        ]),
      ),
    );
  }
}