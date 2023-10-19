import 'package:flutter/material.dart';

class Microject extends StatefulWidget {
  const Microject(
      {Key? key,
      required this.imageUrl1,
      required this.imageUrl2,
      required this.imageUrl3,
      required this.imageUrl4})
      : super(key: key);
  final String imageUrl1;
  final String imageUrl2;
  final String imageUrl3;
  final String imageUrl4;

  @override
  MicrojectState createState() => MicrojectState();
}

class MicrojectState extends State<Microject> {
  List<bool> selected = [false, false, false, false];

  PreferredSizeWidget part1() {
    return AppBar(
      //TODO: part 1
      elevation: 0,
      backgroundColor: const Color(0xff212837),
      titleSpacing: 23,
      centerTitle: false,
      title: const Text(
        'Achievements',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          fontFamily: 'Roboto',
          color: Color(0xffE3F1FF),
        ),
      ),
    );
  }

  Widget part2(String imageUrl, int i) {
    return SizedBox(
      height: 148,
      width: 157,
      //TODO: part 2
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Color(0xff7c94b6),
          image:
              DecorationImage(image: NetworkImage(imageUrl), fit: BoxFit.cover),
        ),
        child: ColorFiltered(
          colorFilter: selected[i]
              ? ColorFilter.mode(Colors.transparent, BlendMode.dst)
              : ColorFilter.mode(
                  Colors.white.withOpacity(0.6), BlendMode.srcATop),
        ),
      ),
    );
  }

  Widget part3(String imageUrl, int i) {
    return SizedBox(
      height: 36,
      width: 141,
      //TODO: part 3
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: selected[i] ? Color(0xff3491FF) : Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Text(
          'Achieved!',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: selected[i] ? Colors.white : const Color(0xff77839D),
          ),
        ),
        onPressed: () {
          setState(() {
            selected[i] = !selected[i];
          });
        },
      ),
    );
  }

  Widget part4() {
    return SizedBox(
      height: 56,
      width: 329,
      //TODO: part 4
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: (selected[0] == true &&
                  selected[1] == true &&
                  selected[2] == true &&
                  selected[3] == true)
              ? Color(0xff3491FF)
              : Color(0xffCBD3E2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          'CONFIRM',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: (selected[0] == true &&
                    selected[1] == true &&
                    selected[2] == true &&
                    selected[3] == true)
                ? Colors.white
                : Color(0xff77839D),
          ),
        ),
        onPressed: () {
          setState(() {
            selected[0] = !selected[0];
            selected[1] = !selected[1];
            selected[2] = !selected[2];
            selected[3] = !selected[3];
          });
        },
      ),
    );
  }

  Widget _buildSelections() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                part2(widget.imageUrl1, 0),
                const SizedBox(
                  height: 4,
                ),
                part3(widget.imageUrl1, 0),
              ],
            ),
            Column(
              children: [
                part2(widget.imageUrl2, 1),
                const SizedBox(
                  height: 4,
                ),
                part3(widget.imageUrl2, 1),
              ],
            ),
          ],
        ),
        const SizedBox(
          height: 28,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                part2(widget.imageUrl3, 2),
                const SizedBox(
                  height: 4,
                ),
                part3(widget.imageUrl3, 2),
              ],
            ),
            Column(
              children: [
                part2(widget.imageUrl4, 3),
                const SizedBox(
                  height: 4,
                ),
                part3(widget.imageUrl4, 3),
              ],
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size);
    return Scaffold(
      backgroundColor: const Color(0xff212837),
      appBar: part1(),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 23),
        child: Column(
          children: [
            _buildSelections(),
            const SizedBox(
              height: 178,
            ),
            part4(),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  final String imageUrl1 =
      "https://firebasestorage.googleapis.com/v0/b/new-ml-6c02d.appspot.com/o/Course2_Microproject%2CExam_image%2Fmeat1.png?alt=media&token=a1fe8e7a-ad61-4499-9c41-abad4ff3898a";
  final String imageUrl2 =
      "https://firebasestorage.googleapis.com/v0/b/new-ml-6c02d.appspot.com/o/Course2_Microproject%2CExam_image%2Ffactory2.png?alt=media&token=4c100254-77c6-418f-87aa-3976d707a573";
  final String imageUrl3 =
      "https://firebasestorage.googleapis.com/v0/b/new-ml-6c02d.appspot.com/o/Course2_Microproject%2CExam_image%2Fsky1.png?alt=media&token=6587f25c-20c8-4531-a6e1-f4732bee96ea";
  final String imageUrl4 =
      "https://firebasestorage.googleapis.com/v0/b/new-ml-6c02d.appspot.com/o/Course2_Microproject%2CExam_image%2Fplant1.png?alt=media&token=925de975-0176-461e-a7d1-1dc67fe02665";

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Microject(
          imageUrl1: imageUrl1,
          imageUrl2: imageUrl2,
          imageUrl3: imageUrl3,
          imageUrl4: imageUrl4),
    );
  }
}
