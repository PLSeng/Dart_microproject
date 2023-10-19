import 'package:flutter/material.dart';

class Microject extends StatefulWidget {
  @override
  MicrojectState createState() => MicrojectState();
}

class MicrojectState extends State<Microject> {
  double sliderValue = 0.0;
  int _selectedIndex = 4;
  Map chips = {
    'Flutter': false,
    'JavaScript': false,
    'Dart': false,
  };

  Widget part1() {
    return SizedBox(
      //TODO: part 1
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Q 1 / 3',
            style: TextStyle(
              fontSize: 12,
              color: Color(0xff555555),
            ),
          ),
          Text(
            'Your Coding Skill',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget part2(String text, int index) {
    return SizedBox(
      height: 56,
      width: 329,
      //TODO: part 2
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(48),
          ),
          backgroundColor:
              _selectedIndex == index ? Color(0xff346FDC) : Colors.white,
          side: BorderSide(
            color: _selectedIndex == index ? Colors.transparent : Colors.black,
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: _selectedIndex == index ? Colors.white : Colors.black,
          ),
        ),
        onPressed: () {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }

  Widget part3() {
    return SliderTheme(
      data: SliderThemeData(
        tickMarkShape: SliderTickMarkShape.noTickMark,
        trackHeight: 4,
        inactiveTrackColor: const Color(0xffCCCCCC),
        activeTrackColor: const Color(0xff3491FF),
        thumbColor: const Color(0xff346FDC),
        thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 10),
      ),
      child: SizedBox(
        //TODO: part 3
        child: Slider(
          value: sliderValue,
          min: 0,
          max: 3,
          divisions: 3,
          onChanged: (double val) {
            setState(() {
              sliderValue = val;
            });
          },
        ),
      ),
    );
  }

  Widget part4(String text) {
    return SizedBox(
      //TODO: part 4
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(height: 6, width: 1, color: Colors.grey),
          Text(
            text,
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  Widget part5({String? lang}) {
    return SizedBox(
      //TODO: part 5
      child: FilterChip(
        showCheckmark: false,
        selected: chips[lang],
        selectedColor: Color(0xffBCBCCC),
        backgroundColor: Colors.white,
        label: Text(
          lang!,
        ),
        labelStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          fontFamily: "Pretendard",
          color: Colors.black,
        ),
        shape: StadiumBorder(
          side: BorderSide(
            color: Color(0xFFADB6C8),
          ),
        ),
        onSelected: (value) {
          setState(() {
            chips[lang] = value;
          });
        },
      ),
    );
  }

  Widget part6() {
    return SizedBox(
      width: 335,
      height: 54,
      //TODO: part 6
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Color(0xff3491FF),
        ),
        child: Text(
          'NEXT',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        onPressed: () {},
      ),
    );
  }

  Widget titleText(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 14,
        color: Color(0xff3491FF),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(
            height: 812,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 28),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  part1(),
                  const SizedBox(height: 20),
                  titleText("What's your step?"),
                  const SizedBox(height: 8),
                  part2("I can use List Data type", 0),
                  const SizedBox(height: 12),
                  part2("I Know what is Flutter", 1),
                  const SizedBox(height: 12),
                  part2("I can make a App UI", 2),
                  const SizedBox(height: 40),
                  titleText("Learning Period"),
                  part3(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        part4("Newbie"),
                        part4("6 Month"),
                        part4("1 Year"),
                        part4("2 Year"),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),
                  titleText("Select your skill set (choose All)"),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      part5(lang: "Flutter"),
                      const SizedBox(width: 9),
                      part5(lang: "JavaScript"),
                      const SizedBox(width: 9),
                      part5(lang: "Dart"),
                    ],
                  ),
                  const SizedBox(height: 144),
                  part6(),
                ],
              ),
            ),
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
      home: Microject(),
    );
  }
}
