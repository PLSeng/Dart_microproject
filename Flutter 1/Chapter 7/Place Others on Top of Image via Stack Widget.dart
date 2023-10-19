import 'package:flutter/material.dart';

class PracticeStack extends StatefulWidget {
  @override
  State<PracticeStack> createState() => _PracticeStackState();
}

class _PracticeStackState extends State<PracticeStack> {
  final String imageUrl =
      'https://firebasestorage.googleapis.com/v0/b/new-ml-6c02d.appspot.com/o/Course2_Microproject%2CExam_image%2Fproduct1.png?alt=media&token=d1f0878a-3f6b-4ea8-a577-5a1616c172f6';

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // TODO: part 1
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          part2(),
          part3(),
        ],
      ),
    );
  }

  Widget part2() {
    return SizedBox(
      // TODO: part 2
      child: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(imageUrl),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget part3() {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          // TODO: part 3
          Text(
            "Stack It Up",
            style: TextStyle(
              color: Colors.white,
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
          ),
          Icon(
            Icons.stacked_line_chart,
            color: Colors.white,
            size: 80,
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
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Practice Stack'),
          centerTitle: true,
        ),
        body: PracticeStack(),
      ),
    );
  }
}
