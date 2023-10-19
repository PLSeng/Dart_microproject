import 'package:flutter/material.dart';

class _MicrojectState extends State<Microject> {
  Widget part1() {
    // TODO: Part 1
    return Wrap(
      spacing: 11,
      runSpacing: 6,
      children: [
        part2('Hotel', 0),
        part2('Motel', 1),
        part2('Resort', 2),
        part2('Housing', 3),
      ],
    );
  }

  Widget part2(String text1, int index) {
    return Container(
      //TODO: Part 2
      child: ChoiceChip(
        label: Text(text1),
        selected: _choiceIndex == index,
        labelStyle: TextStyle(
          color: _choiceIndex == index ? Colors.white : Color(0xFFE0E0E0),
          fontWeight: FontWeight.w700,
        ),
        selectedColor: Colors.blue,
        shape: const StadiumBorder(
          side: BorderSide(color: Color(0xFFE0E0E0)),
        ),
        backgroundColor: Colors.white,
        onSelected: (bool selected) {
          setState(() {
            _choiceIndex = selected ? index : 0;
          });
        },
      ),
    );
  }

  Widget part3() {
    // TODO: Part 3
    return Column(
      children: [
        Slider(
          value: _sliderValue,
          min: 0.0,
          max: 999.0,
          onChanged: (double newValue) {
            setState(() {
              _sliderValue = newValue;
            });
          },
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 6,
                width: 1,
                color: Color(0xFFE0E0E0),
              ),
              Container(
                height: 6,
                width: 1,
                color: Color(0xFFE0E0E0),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '\$0',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
            ),
            Text(
              '\$999',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget part4(String text1, int index) {
    // TODO: Part 4
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text1,
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
        ),
        Switch(
            value: _isClicked[index],
            onChanged: (value) {
              setState(() {
                _isClicked[index] = !_isClicked[index];
              });
            }),
      ],
    );
  }

  int _choiceIndex = 0;
  double _sliderValue = 300;
  final List<bool> _isClicked = [false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Filter',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w700, color: Colors.black),
        ),
        backgroundColor: Colors.white,
        centerTitle: false,
        elevation: 1,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Type',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 20,
            ),
            part1(),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'Min Price',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 23,
            ),
            part3(),
            const SizedBox(
              height: 47,
            ),
            part4('Sale', 0),
            part4('Room Service', 1),
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
  const MyApp({Key? key}) : super(key: key);

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
