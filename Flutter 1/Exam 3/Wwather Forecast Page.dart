import 'package:flutter/material.dart';

class _MicrojectState extends State<Microject> {
  bool _isListView = true;

  Widget part1() {
    // TODO: part1
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          "Today",
          style: TextStyle(
            fontSize: 33,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
        Spacer(),
        SizedBox(
          height: 32,
          width: 32,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: _isListView ? Color(0xFF2196F3) : Colors.white,
                ),
              ),
              Positioned(
                left: -5,
                child: IconButton(
                  highlightColor: Color(0xFFA0D1FF),
                  onPressed: _isListView
                      ? null
                      : () {
                          setState(() {
                            _isListView = !_isListView;
                          });
                        },
                  iconSize: 26,
                  icon: Icon(
                    Icons.list,
                    color: _isListView ? Colors.white : Color(0xFF2196F3),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: 10,
        ),
        SizedBox(
          width: 32,
          height: 32,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: _isListView ? Colors.white : Color(0xFF2196F3),
                ),
              ),
              Positioned(
                left: -5,
                child: IconButton(
                  highlightColor: Color(0xFFA0D1FF),
                  onPressed: _isListView
                      ? () {
                          setState(() {
                            _isListView = !_isListView;
                          });
                        }
                      : null,
                  iconSize: 26,
                  icon: Icon(
                    Icons.grid_view_sharp,
                    color: _isListView ? Color(0xFF2196F3) : Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: 2,
        ),
      ],
    );
  }

  Widget part2() {
    // TODO: part2
    return ListView.builder(
      padding: EdgeInsets.only(bottom: 15),
      itemCount: 3,
      itemExtent: 120,
      itemBuilder: (context, index) {
        return Column(
          children: [
            ListTile(
              contentPadding: EdgeInsets.only(
                top: 21,
                bottom: 22,
                left: 26,
                right: 24,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              title: Text(
                data[index].temperature.toString() + "'C",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 34,
                  color: Colors.white,
                  height: 1,
                ),
              ),
              subtitle: Text(
                data[index].city,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                  color: Colors.white,
                  height: 1,
                ),
              ),
              tileColor: data[index].color,
              trailing: SizedBox(
                height: 62,
                width: 62,
                child: Image.network(data[index].imageUrl),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget part3() {
    // TODO: part3
    return GridView.builder(
      itemCount: 3,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 157 / 195,
        mainAxisSpacing: 15,
        crossAxisSpacing: 15,
      ),
      itemBuilder: (context, index) {
        return Card(
          margin: EdgeInsets.zero,
          color: data[index].color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Container(
            padding: EdgeInsets.only(
              top: 10,
            ),
            height: 200,
            width: 157,
            child: Column(
              children: [
                SizedBox(
                  height: 62,
                  width: 62,
                  child: Image.network(data[index].imageUrl),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  data[index].temperature.toString() + "'C",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 34,
                    color: Colors.white,
                    height: 1,
                  ),
                ),
                Text(
                  data[index].city,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                    color: Colors.white,
                    height: 1,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFA0D1FF),
      body: Padding(
        padding: const EdgeInsets.only(left: 23, right: 23),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 30),
            part1(),
            _isListView
                ? const SizedBox(height: 24)
                : const SizedBox(height: 17),
            Expanded(
              child: _isListView ? part2() : part3(),
            )
          ],
        ),
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

class Microject extends StatefulWidget {
  @override
  State<Microject> createState() => _MicrojectState();
}

List<Data> data = [
  Data(
      temperature: 35,
      city: "Seoul",
      color: const Color(0xFF2196F3),
      imageUrl:
          "https://firebasestorage.googleapis.com/v0/b/new-ml-6c02d.appspot.com/o/Course2_Microproject%2CExam_image%2Fweather1.png?alt=media&token=e377b7bd-03b5-46ea-82a4-75cae88a6b90"),
  Data(
      temperature: 24,
      city: "Paris",
      color: const Color(0xFF0F7BD0),
      imageUrl:
          "https://firebasestorage.googleapis.com/v0/b/new-ml-6c02d.appspot.com/o/Course2_Microproject%2CExam_image%2Fweather2.png?alt=media&token=e4e3681e-970f-4458-9822-480e5d34065b"),
  Data(
      temperature: 26,
      city: "New York",
      color: const Color(0xFF0F7BD0),
      imageUrl:
          "https://firebasestorage.googleapis.com/v0/b/new-ml-6c02d.appspot.com/o/Course2_Microproject%2CExam_image%2Fweather3.png?alt=media&token=9312a0cd-0ae4-4574-8c6e-86daf67ecda7")
];

class Data {
  final int temperature;
  final String city;
  final Color color;
  final String imageUrl;

  Data(
      {required this.temperature,
      required this.city,
      required this.color,
      required this.imageUrl});
}
