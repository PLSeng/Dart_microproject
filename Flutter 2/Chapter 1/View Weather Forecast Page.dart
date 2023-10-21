import 'package:flutter/material.dart';

class MicroProjectPage extends StatelessWidget {
  const MicroProjectPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Weather',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: false,
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          // TODO : Part1
          final maxWidth = constraints.maxWidth;

          return ListView.builder(
            itemCount: weatherList.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                margin:
                    EdgeInsets.fromLTRB(maxWidth / 20, 20, maxWidth / 20, 0),
                padding:
                    EdgeInsets.fromLTRB(maxWidth / 20, 20, maxWidth / 20, 0),
                height: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    color: index.isEven
                        ? const Color(0xff45ADE8)
                        : const Color(0xff6E8EB4)),
                child: weatherItem(index),
              );
            },
          );
        },
      ),
    );
  }

  Widget weatherItem(int index) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(weatherList[index].location,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                )),
            const SizedBox(height: 4),
            Text(weatherList[index].fahrenheit,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold)),
          ],
        ),
        SizedBox(
          width: 54,
          height: 54,
          child: Image.network(
            weatherList[index].img,
            fit: BoxFit.fill,
          ),
        )
      ],
    );
  }
}

class Weather {
  String location;
  String fahrenheit;
  String img;

  Weather(this.location, this.fahrenheit, this.img);
}

List<Weather> weatherList = [
  Weather('New York · USA', '53.6°F',
      'https://firebasestorage.googleapis.com/v0/b/new-ml-6c02d.appspot.com/o/Course2_Microproject%2CExam_image%2Fweather1.png?alt=media&token=e377b7bd-03b5-46ea-82a4-75cae88a6b90'),
  Weather(' D.C.(Washington) · USA', '57.2°F',
      'https://firebasestorage.googleapis.com/v0/b/new-ml-6c02d.appspot.com/o/Course2_Microproject%2CExam_image%2Fweather2.png?alt=media&token=e4e3681e-970f-4458-9822-480e5d34065b'),
  Weather('Chicago · USA', '62.6°F',
      'https://firebasestorage.googleapis.com/v0/b/new-ml-6c02d.appspot.com/o/Course2_Microproject%2CExam_image%2Fweather3.png?alt=media&token=9312a0cd-0ae4-4574-8c6e-86daf67ecda7'),
];

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MicroProjectPage(),
    );
  }
}
