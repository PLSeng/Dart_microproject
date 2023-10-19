import 'package:flutter/material.dart';

class _MicrojectState extends State<Microject> {
  Widget part1(String url, String name) {
    // TODO : Part 1
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPage(url: url, name: name),
          ),
        );
      },
      child: Hero(
        tag: name,
        child: CircleAvatar(
          radius: 35,
          backgroundImage: NetworkImage(url),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            'Poster',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
          centerTitle: false,
          elevation: 1,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                part1(imageUrl1, 'Dancing'),
                part1(imageUrl2, 'Hiking'),
                part1(imageUrl3, 'Swimming')
              ],
            ),
            const SizedBox(
              height: 40,
            )
          ],
        ));
  }

  String imageUrl1 =
      'https://firebasestorage.googleapis.com/v0/b/new-ml-6c02d.appspot.com/o/Course2_Microproject%2CExam_image%2Fmovie1.jpg?alt=media&token=65e84654-2001-47cd-ba0d-5a978a163a2d';
  String imageUrl2 =
      'https://firebasestorage.googleapis.com/v0/b/new-ml-6c02d.appspot.com/o/Course2_Microproject%2CExam_image%2Fmovie2.jpg?alt=media&token=d102e69f-96c3-46d3-bffd-12e48ef39cdf';
  String imageUrl3 =
      'https://firebasestorage.googleapis.com/v0/b/new-ml-6c02d.appspot.com/o/Course2_Microproject%2CExam_image%2Fmovie3.jpg?alt=media&token=fabeaf0d-d479-4a3e-9346-b40a5ed15ce3';
}

class _DetailPageState extends State<DetailPage> {
  Widget part2() {
    // TODO : Part 2
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Card(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 30),
              child: Hero(
                tag: widget.name,
                child: Container(
                  width: 250,
                  height: 250,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(widget.url),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            Text(
              widget.name,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 25,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 370,
          width: 310,
          child: part2(),
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
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Microject(),
    );
  }
}

class Microject extends StatefulWidget {
  const Microject({Key? key}) : super(key: key);

  @override
  State<Microject> createState() => _MicrojectState();
}

class DetailPage extends StatefulWidget {
  final String url;
  final String name;
  const DetailPage({Key? key, required this.url, required this.name})
      : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}
