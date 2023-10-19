import 'package:flutter/material.dart';

class _Part1State extends State<Part1> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 406,
      width: 329,
      // TODO : Part 1
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 225,
              width: 329,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
                image: DecorationImage(
                  image: NetworkImage(widget.imageUrl1),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
                padding: EdgeInsets.fromLTRB(14, 15, 0, 5),
                child: Text(
                  widget.text1,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                )),
            Padding(
              padding: EdgeInsets.only(left: 14, bottom: 29),
              child: Text(
                widget.text2,
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xFFA7A7A7),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(14, 0, 14, 0),
              height: 48,
              constraints: BoxConstraints(
                minWidth: double.infinity,
              ),
              child: ElevatedButton(
                onPressed: () {
                  widget.changeState();
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  "Go!",
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Part2State extends State<Part2> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 177,
      width: 329,
      // TODO : Part 2
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Container(
              height: 177,
              width: 138,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  bottomLeft: Radius.circular(16),
                ),
                image: DecorationImage(
                  image: NetworkImage(widget.imageUrl1),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              width: 26,
            ),
            SizedBox(
              width: 131,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.text1,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(
                    height: 13,
                  ),
                  Container(
                    height: 44,
                    constraints: BoxConstraints(
                      minWidth: double.infinity,
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        widget.changeState();
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        "Go!",
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
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
}

class Part1 extends StatefulWidget {
  const Part1(
      {Key? key,
      required this.text1,
      required this.text2,
      required this.imageUrl1,
      required this.changeState})
      : super(key: key);
  final String text1;
  final String text2;
  final String imageUrl1;
  final Function() changeState;

  @override
  _Part1State createState() => _Part1State();
}

class Part2 extends StatefulWidget {
  const Part2(
      {Key? key,
      required this.text1,
      required this.imageUrl1,
      required this.changeState})
      : super(key: key);
  final String text1;
  final String imageUrl1;
  final Function() changeState;

  @override
  _Part2State createState() => _Part2State();
}

class _MicrojectState extends State<Microject> {
  final imageUrl1 =
      'https://firebasestorage.googleapis.com/v0/b/new-ml-6c02d.appspot.com/o/Course2_Microproject%2CExam_image%2Fspace3.png?alt=media&token=ddf6c282-94cd-4a9a-89f4-b8e02e493272';

  bool _isClicked = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: _isClicked
          ? Part1(
              text1: 'Neon Playroom',
              text2: 'Come to enjoy diverse rooms in different sizes',
              imageUrl1: imageUrl1,
              changeState: changeState,
            )
          : Part2(
              text1: 'Neon Playroom',
              imageUrl1: imageUrl1,
              changeState: changeState,
            ),
    ));
  }

  changeState() {
    setState(() {
      _isClicked = !_isClicked;
    });
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
