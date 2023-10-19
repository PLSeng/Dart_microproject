import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final Color color;
  bool isThereImage = false;
  final bool topImg;
  final int index;
  CustomCard(
      {Key? key, required this.index, required this.color, this.topImg = false})
      : super(key: key);

  Widget part1() {
    // TODO: part1
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(36.0),
      ),
      margin: EdgeInsets.only(bottom: 20),
      child: SizedBox(
        width: 329,
        height: topImg ? 390 : 159,
        child: topImg ? part2() : part3(),
      ),
    );
  }

  Widget part2() {
    // TODO: part2
    return Padding(
      padding: const EdgeInsets.only(left: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 35),
          ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Image.network(
              data[index].imageUrl,
              height: 178,
              width: 269,
            ),
          ),
          SizedBox(height: 23),
          SizedBox(
            width: 167,
            child: Text(
              data[index].title,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          SizedBox(height: 12),
          SizedBox(
            width: 269,
            child: part5(),
          ),
        ],
      ),
    );
  }

  Widget part3() {
    // TODO: part3
    return Row(
      children: [
        isThereImage
            ? Container(
                margin: EdgeInsets.only(left: 30),
                height: 100,
                width: 100,
                child: Image.network(
                  data[index].imageUrl,
                  fit: BoxFit.fitHeight,
                ),
              )
            : Container(),
        Padding(
          padding: isThereImage
              ? EdgeInsets.only(left: 17, top: 30)
              : EdgeInsets.only(left: 30, top: 32),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                data[index].title,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 6),
              part4(),
            ],
          ),
        ),
      ],
    );
  }

  Widget part4() {
    // TODO: part4
    return isThereImage
        ? SizedBox(
            width: 152,
            child: part5(),
          )
        : SizedBox(
            width: 251,
            child: part5(),
          );
  }

  Widget part5() {
    // TODO: part5
    return Text(
      data[index].description,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: Color(0xFFA5A5A5),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    data[index].imageUrl == "" ? isThereImage = false : isThereImage = true;
    return part1();
  }
}

class _MicrojectState extends State<Microject> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size(375, 74),
        child: AppBar(
          backgroundColor: Colors.white,
          shadowColor: Color(0xFFFFFFFF),
          elevation: 2,
          titleSpacing: 0,
          title: const Padding(
            padding: EdgeInsets.only(left: 22, top: 38),
            child: Text(
              "News",
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(23, 35, 23, 0),
          child: Column(
            children: [
              CustomCard(index: 0, color: Colors.green),
              CustomCard(index: 1, color: Colors.yellow),
              CustomCard(index: 2, color: Colors.orange, topImg: true),
            ],
          ),
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
      home: Microject(),
    );
  }
}

class Microject extends StatefulWidget {
  @override
  State<Microject> createState() => _MicrojectState();
}

List<Data> data = [
  Data(
    title: "Breaking News!",
    description:
        "Due to the rain, many of the cars parked underground were drowned.",
    imageUrl: "",
  ),
  Data(
    title: "Short News",
    description: "Find out the nutrients that egg dish has.",
    imageUrl:
        "https://firebasestorage.googleapis.com/v0/b/new-ml-6c02d.appspot.com/o/Course2_Microproject%2CExam_image%2Ffood1.png?alt=media&token=5d80239a-41b5-4c97-8d5e-3e522897639f",
  ),
  Data(
    title: "Upcoming News!",
    description:
        "Volutpat nunc cursus ultrices vestibulum ullamcorper vel. Suspendisse eu lectus augue ultricies sed ultricies.",
    imageUrl:
        "https://firebasestorage.googleapis.com/v0/b/new-ml-6c02d.appspot.com/o/Course2_Microproject%2CExam_image%2Ffactory2.png?alt=media&token=4c100254-77c6-418f-87aa-3976d707a573",
  ),
];

class Data {
  final String title;
  final String description;
  final String imageUrl;

  Data(
      {required this.title, required this.description, required this.imageUrl});
}
