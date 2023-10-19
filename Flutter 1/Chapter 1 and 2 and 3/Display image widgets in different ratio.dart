import 'package:flutter/material.dart';

class DivisionSizedBox extends StatelessWidget {
  const DivisionSizedBox({Key? key, required this.imageUrl}): super(key: key);
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          imageContainer(),
          SizedBox(
            height: 20,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              imageContainer(),
              const SizedBox(
                width: 10,
              ),
              imageContainer(),
            ],
          ),
          const SizedBox(
            height: 20.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              imageContainer(),
              SizedBox(
                width: 10,
              ),
              imageContainer(),
              SizedBox(
                width: 10,
              ),
              imageContainer(),
            ],
          ),
        ],
      ),
    );
  }

  Widget imageContainer() {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.fill,
        ),
        border: Border.all(
          color: Colors.blue,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final String imageUrl =
      "https://firebasestorage.googleapis.com/v0/b/new-ml-6c02d.appspot.com/o/Course2_Microproject%2CExam_image%2Fmovie4.jpg?alt=media&token=ef3ab1be-0416-4eab-a5a6-cfe6b1381811";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('How to use SizedBox'),
          centerTitle: true,
        ),
        body: ListView(children: [
          SizedBox(height: 600, child: DivisionSizedBox(imageUrl: imageUrl)),
        ]),
      ),
    );
  }
}