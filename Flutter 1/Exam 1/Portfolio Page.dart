import 'package:flutter/material.dart';

class Microject extends StatelessWidget {
  Widget part1() {
    return SizedBox(
      //TODO: part 1
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Peter',
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                ' Ashe',
                style: TextStyle(
                  fontSize: 50,
                ),
              ),
            ],
          ),
          Text(
            'Product Designer',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height:24),
        ],
      ),
    );
  }

  Widget part2(IconData icon, String text1, String text2, Color color) {
    return Container(
      //TODO: part 2
      height: 62,
      decoration: BoxDecoration(color: color,),
      child: Padding(
        padding: EdgeInsets.only(left: 30,),
        child: Row(
          children: [
            Icon(icon, size: 30, color: Colors.white,),
            const SizedBox(width: 20,),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  text1,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  text2,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget part3(String text) {
    return Container(
      //TODO: part 3
      padding: EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20,),
        ],
      ),
    );
  }

  Widget part4(String text1, String text2) {
    return SizedBox(
      //TODO: part 4
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 220,
                child: Text(
                  text1,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
              Text(
                text2,
                style: TextStyle(
                  fontSize: 13,
                  color: Color(0xFF757575),
                ),
              ),
            ],
          ),
          SizedBox(height: 20,),
        ],
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
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30, top: 80),
                  child: SizedBox(height: 150, child: part1()),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      part2(Icons.location_on, "Address", "MicroLearnable",
                          const Color(0xFFBCDCFF)),
                      part2(Icons.call, "Phone", "+82 10-1234-5678",
                          const Color(0xFF66B1FF)),
                      part2(Icons.email, "Email", "Microlearnable@gmail.com",
                          const Color(0xFF3491FF)),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      part3("Education"),
                      part4("Barchelor of Graphic Design Havard University",
                          "2012 ~ 2016"),
                      part4("Master of UX Design Carnegie Mellon University",
                          "2017 ~ 2019"),
                      const Divider(
                        color: Color(0xFFE8E8E8),
                        thickness: 2,
                      ),
                      part3("Experience"),
                      part4("Google, Product Designer", "2020 ~ present"),
                    ],
                  ),
                ),
              ],
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
