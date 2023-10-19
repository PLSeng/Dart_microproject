import 'package:flutter/material.dart';

class PracticeListTile extends StatelessWidget {
  const PracticeListTile({
    Key? key,
    required this.imageUrl1,
    required this.imageUrl2,
    required this.imageUrl3,
  }) : super(key: key);
  final String imageUrl1;
  final String imageUrl2;
  final String imageUrl3;

  Widget customListTile(
      String title, String subtitle, String imageUrl, Color hoverColor) {
    return SizedBox(
      // TODO : part1
      child: ListTile(
        // TODO : part2
        title: Text(title),
        subtitle: Text(subtitle),
        // TODO : part3
        leading: CircleAvatar(
          backgroundImage: NetworkImage(imageUrl),
        ),
        trailing: Icon(Icons.more_vert_sharp),
        contentPadding: EdgeInsets.all(15),
        // TODO : part4
        hoverColor: hoverColor,
        onTap: () {},
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        customListTile(
          "Yellow Ghost",
          "Avatar 1",
          imageUrl1,
          const Color.fromRGBO(255, 191, 0, 0.1),
        ),
        const Divider(thickness: 1, height: 1, color: Colors.black38),
        customListTile(
          "Green Monster",
          "Avatar 2",
          imageUrl2,
          const Color.fromRGBO(0, 128, 0, 0.1),
        ),
        const Divider(thickness: 1, height: 1, color: Colors.black38),
        customListTile(
          "Anonymous",
          "Avatar 3",
          imageUrl3,
          const Color.fromRGBO(0, 0, 128, 0.1),
        ),
        const Divider(thickness: 1, height: 1, color: Colors.black38),
      ],
    );
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final String imageUrl1 =
      'https://firebasestorage.googleapis.com/v0/b/new-ml-6c02d.appspot.com/o/Course2_Microproject%2CExam_image%2Favatar1.png?alt=media&token=cd157817-d6f6-4006-b7b8-0232d9e27f5a';
  final String imageUrl2 =
      'https://firebasestorage.googleapis.com/v0/b/new-ml-6c02d.appspot.com/o/Course2_Microproject%2CExam_image%2Favatar2.png?alt=media&token=957629df-b4ce-457c-bef3-e60330c8e202';
  final String imageUrl3 =
      'https://firebasestorage.googleapis.com/v0/b/new-ml-6c02d.appspot.com/o/Course2_Microproject%2CExam_image%2Favatar3.png?alt=media&token=29707189-c1d5-439d-8689-6b75ff6c57d1';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Avatar ListTile"),
          centerTitle: true,
        ),
        body: ListView(children: [
          SizedBox(
              height: 600,
              child: PracticeListTile(
                imageUrl1: imageUrl1,
                imageUrl2: imageUrl2,
                imageUrl3: imageUrl3,
              )),
        ]),
      ),
    );
  }
}
