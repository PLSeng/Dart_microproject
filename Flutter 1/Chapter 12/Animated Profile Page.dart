import 'package:flutter/material.dart';

class _MicrojectState extends State<Microject> {
  Widget part1(
      {required String url, required String title, required String subTitle}) {
    // TODO : Part 1
    return GestureDetector(
      onTap: () {
        setState(() {
          _isTap = !_isTap;
        });
      },
      child: AnimatedContainer(
        height: _isTap ? 150 : 230,
        width: _isTap ? 320 : 200,
        curve: Curves.linearToEaseOut,
        duration: const Duration(seconds: 2),
        child: _isTap
            ? part2(url: url, title: title, subTitle: subTitle)
            : part3(url: url, title: title, subTitle: subTitle),
      ),
    );
  }

  Widget part2(
      {required String url, required String title, required String subTitle}) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      // TODO : Part 2
      child: Padding(
        padding: EdgeInsets.only(
          left: 20,
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage(url),
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    subTitle,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 13,
                      color: Color(0xFF9c9c9c),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget part3(
      {required String url, required String title, required String subTitle}) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      // TODO : Part 3
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage(url),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              title,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 3,
            ),
            Expanded(
                child: Text(
              subTitle,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 13,
                color: Color(0xFF9c9c9c),
              ),
            ))
          ],
        ),
      ),
    );
  }

  bool _isTap = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text(
          'Profile',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: Center(
        child: part1(
            url:
                'https://firebasestorage.googleapis.com/v0/b/new-ml-6c02d.appspot.com/o/Course2_Microproject%2CExam_image%2Fperson4.jpg?alt=media&token=faf47c4a-1bf9-463a-bb97-4cedc695f023',
            title: 'Anna Lyan',
            subTitle: 'UX Design team'),
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
