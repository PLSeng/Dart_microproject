import 'package:flutter/material.dart';

class PracticeCustomWidget extends StatelessWidget {
  const PracticeCustomWidget({Key? key, required this.imageUrl})
      : super(key: key);
  final String imageUrl;

  //TODO: part 1-1
  Widget customListTile({Icon? leading, Text? title, Icon? trailing}) {
    return ListTile(
      leading: leading,
      title: title,
      trailing: trailing,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation: 5,
        color: Colors.black,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.fitHeight,
                ),
              ),
              //TODO: part 1-2
              //DO IT AFTER PART 1-1
              customListTile(
                leading: Icon(
                  Icons.play_arrow_rounded,
                  color: Colors.white,
                ),
                title: Text(
                  "this is art",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                trailing: Icon(
                  Icons.settings,
                  color: Colors.white,
                ),
              ),
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
  final String imageUrl =
      'https://firebasestorage.googleapis.com/v0/b/new-ml-6c02d.appspot.com/o/Course2_Microproject%2CExam_image%2Fmovie4.jpg?alt=media&token=ef3ab1be-0416-4eab-a5a6-cfe6b1381811';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Custom ListTile',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.white,
          centerTitle: true,
          elevation: 1,
        ),
        body: ListView(
          children: [
            SizedBox(
              height: 600,
              child: PracticeCustomWidget(imageUrl: imageUrl),
            ),
          ],
        ),
      ),
    );
  }
}
