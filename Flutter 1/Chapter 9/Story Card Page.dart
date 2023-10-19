import 'package:flutter/material.dart';

class _MicrojectState extends State<Microject> {
  Widget part1() {
    // TODO : Part 1
    return Container(
      child: Scrollbar(
        thickness: 4,
        controller: _scrollController,
        thumbVisibility: true,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          controller: _scrollController,
          child: buildBody(),
        ),
      ),
    );
  }

  Widget part2(String text1, String text2, String imageUrl, int index) {
    // TODO : Part 2
    return GestureDetector(
      onDoubleTap: () {
        setState(() {
          _isClicked[index] = !_isClicked[index];
        });
      },
      child: buildCard(text1, text2, imageUrl, index),
    );
  }

  Widget buildCard(String text1, String text2, String imageUrl, int index) {
    return SizedBox(
      height: 322,
      width: 329,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                  image: DecorationImage(
                      fit: BoxFit.cover, image: NetworkImage(imageUrl))),
              height: 225,
              width: 329,
            ),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(14, 15, 0, 2),
                        child: Text(
                          text1,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w700),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 14),
                        child: Text(
                          text2,
                          style: const TextStyle(
                              fontSize: 16, color: Color(0xFFA7A7A7)),
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(
                  _isClicked[index] ? Icons.favorite : Icons.favorite_border,
                  color: _isClicked[index] ? Colors.red : Colors.grey,
                ),
                const SizedBox(
                  width: 22,
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  final imageUrl1 =
      'https://firebasestorage.googleapis.com/v0/b/new-ml-6c02d.appspot.com/o/Course2_Microproject%2CExam_image%2Fnature3.jpg?alt=media&token=8b7447b2-5861-4c99-85cb-98c87f71e366';
  final imageUrl2 =
      'https://firebasestorage.googleapis.com/v0/b/new-ml-6c02d.appspot.com/o/Course2_Microproject%2CExam_image%2Fgirls.png?alt=media&token=829662ef-fe53-4889-aada-30846a390e0c';
  final imageUrl3 =
      'https://firebasestorage.googleapis.com/v0/b/new-ml-6c02d.appspot.com/o/Course2_Microproject%2CExam_image%2Fneon.png?alt=media&token=56f8113f-1bca-4e73-a73e-d11dd48dd94e';

  final List<bool> _isClicked = [false, false];

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: const Text(
            'Story',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
          backgroundColor: Colors.white,
          elevation: 1,
        ),
        body: part1());
  }

  Widget buildBody() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(23, 20, 23, 0),
          child: part2('went to the Mountains', '2022.9.9', imageUrl1, 0),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(23, 20, 23, 0),
          child: part2('Back to teen', '2022.8.7', imageUrl2, 1),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(23, 20, 23, 20),
          child: part2('Went to the museum', '2022.5.19', imageUrl3, 0),
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
      home: Microject(),
    );
  }
}

class Microject extends StatefulWidget {
  @override
  State<Microject> createState() => _MicrojectState();
}
