import 'package:flutter/material.dart';

class Microject extends StatelessWidget {
  Widget part1() {
    // TODO : part1
    return Container(
      constraints: BoxConstraints(minWidth: double.infinity),
      height: 183,
      child: Image.network(movieImage, fit: BoxFit.fill),
    );
  }

  Widget part2(String url, String text1, String text2, String text3) {
    // TODO : part2
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 33,
          backgroundImage: NetworkImage(url),
        ),
        SizedBox(width: 28,),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(text1, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),),
              Text(text2, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: Color(0xFFA8A2A2)),),
              SizedBox(height: 11,),
              Text(text3, style: TextStyle(fontSize: 12, color: Color(0xFF555555)),),
            ],
          ),
        ),
      ],
    );
  }

  final String commentImage1 = 'https://firebasestorage.googleapis.com/v0/b/new-ml-6c02d.appspot.com/o/Course2_Microproject%2CExam_image%2Fperson4.jpg?alt=media&token=faf47c4a-1bf9-463a-bb97-4cedc695f023';
  final String commentImage2 = 'https://firebasestorage.googleapis.com/v0/b/new-ml-6c02d.appspot.com/o/Course2_Microproject%2CExam_image%2Fperson5.jpg?alt=media&token=f70c2481-b744-49fd-9d12-4ca092c42127';
  final String movieImage = 'https://firebasestorage.googleapis.com/v0/b/new-ml-6c02d.appspot.com/o/Course2_Microproject%2CExam_image%2Fmovie1.jpg?alt=media&token=65e84654-2001-47cd-ba0d-5a978a163a2d';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie Detail', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: Colors.black),),
        backgroundColor: Colors.white,
        centerTitle: false,
        elevation: 1,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(23, 24, 23, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            part1(),
            const SizedBox(height: 22,),
            const Text('Love for all', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),),
            const SizedBox(height: 4,),
            const Text('Peter Kane', style: TextStyle(fontSize: 16, color: Color(0xFFA7A7A7))),
            const SizedBox(height: 24,),
            const Text('Comments', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Color(0xFF767676)),),
            const SizedBox(height: 20,),
            part2(commentImage1, 'Anna Montana', 'Movie critic', '“ Ante massa sed et turpis. Feugiat nisl, neque, mauris justo, cum. Nunc, mauris, in nisl consectetur. Auctor felis aliquet pretium nec ac sed.”'),
            const SizedBox(height: 14,),
            const Divider(thickness: 1, color: Color(0xFFCBCBCB)),
            const SizedBox(height: 14,),
            part2(commentImage2, 'Jenny Wilson Kim', 'Movie director', '“ The filming was sensational. “ '),
            const SizedBox(height: 14,),
            const Divider(thickness: 1, color: Color(0xFFCBCBCB)),
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
      home: Microject(),
    );
  }
}