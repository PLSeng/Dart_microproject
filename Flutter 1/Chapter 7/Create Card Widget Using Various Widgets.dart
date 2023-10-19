import 'package:flutter/material.dart';

class PracticeCard extends StatefulWidget {
  @override
  State<PracticeCard> createState() => _PracticeCardState();
}

class _PracticeCardState extends State<PracticeCard> {
  final String imageUrl =
      'https://firebasestorage.googleapis.com/v0/b/new-ml-6c02d.appspot.com/o/Course2_Microproject%2CExam_image%2Favatar1.png?alt=media&token=cd157817-d6f6-4006-b7b8-0232d9e27f5a';

  Widget customCard() {
    return Card(
      //TODO: part 1
      elevation: 5,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            //TODO: part 2
            ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(imageUrl),
              ),
              trailing: Icon(Icons.more_vert_sharp),
              title: Text("Yellow Ghost"),
              subtitle: Text("Hello, I'm a Card"),
            ),
            const Divider(thickness: 1, height: 1, color: Colors.black38),
            Container(
              margin: const EdgeInsets.fromLTRB(10, 10, 20, 0),
              //TODO: part 3
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  OutlinedButton(
                    onPressed: () {},
                    child: Text("CLOSE"),
                  ),
                  OutlinedButton(
                    onPressed: () {},
                    child: Text("SHOW"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget messageWindow() {
    return const Padding(
      padding: EdgeInsets.all(16),
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: "Message...",
          icon: Icon(
            Icons.email,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          customCard(),
          const Text("CHAT ROOM"),
          messageWindow(),
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
          title: const Text('Practice Card'),
        ),
        body: PracticeCard(),
      ),
    );
  }
}
