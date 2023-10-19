import 'package:flutter/material.dart';

class _MicrojectState extends State<Microject> {
  Widget part1() {
    // TODO : Part 1
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: shoppingItemData.length,
      itemBuilder: (context, index) {
        return part2(index);
      },
    );
  }

  Widget part2(int index) {
    // TODO : Part 2
    return Card(
      elevation: 2,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: part3(index),
    );
  }

  Widget part3(int index) {
    // TODO : Part 3
    return Stack(
      alignment: AlignmentDirectional.bottomStart,
      children: [
        Image.network(
          shoppingItemData[index]['image'],
          fit: BoxFit.cover,
        ),
        Container(
          color: Colors.black.withOpacity(0.15),
        ),
        Padding(
          padding: EdgeInsets.only(left: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Spacer(),
              Text(
                shoppingItemData[index]['price'],
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xFFDEDEDE),
                ),
              ),
              Text(
                shoppingItemData[index]['title'],
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 13,
              ),
            ],
          ),
        ),
      ],
    );
  }

  List shoppingItemData = [
    {
      'title': 'Game Boy',
      'price': 'Device',
      'image':
          'https://firebasestorage.googleapis.com/v0/b/new-ml-6c02d.appspot.com/o/Course2_Microproject%2CExam_image%2Fproduct1.png?alt=media&token=d1f0878a-3f6b-4ea8-a577-5a1616c172f6'
    },
    {
      'title': 'Perfume',
      'price': 'Men',
      'image':
          'https://firebasestorage.googleapis.com/v0/b/new-ml-6c02d.appspot.com/o/Course2_Microproject%2CExam_image%2Fproduct2.png?alt=media&token=422d0feb-0455-486a-b98c-c3d33b57d7b7'
    },
    {
      'title': 'Toy Car',
      'price': 'Toy',
      'image':
          'https://firebasestorage.googleapis.com/v0/b/new-ml-6c02d.appspot.com/o/Course2_Microproject%2CExam_image%2Fproduct3.png?alt=media&token=c43f7195-adb1-4d49-a613-3516d124298d'
    },
    {
      'title': 'Sunglasses',
      'price': 'Accessories',
      'image':
          'https://firebasestorage.googleapis.com/v0/b/new-ml-6c02d.appspot.com/o/Course2_Microproject%2CExam_image%2Fproduct4.png?alt=media&token=dd7390ab-6bfc-4647-9b6d-cdf8f8ece042'
    },
    {
      'title': 'Skate Board',
      'price': 'Sports',
      'image':
          'https://firebasestorage.googleapis.com/v0/b/new-ml-6c02d.appspot.com/o/Course2_Microproject%2CExam_image%2Fproduct5.png?alt=media&token=a8ccf73f-ab3e-4c89-ac06-08883518a358'
    },
    {
      'title': 'Shoes',
      'price': 'Sports',
      'image':
          'https://firebasestorage.googleapis.com/v0/b/new-ml-6c02d.appspot.com/o/Course2_Microproject%2CExam_image%2Fproduct6.png?alt=media&token=e88053fd-a467-4b02-b26c-6357282b78ad'
    },
    {
      'title': 'Camera',
      'price': 'Accessories',
      'image':
          'https://firebasestorage.googleapis.com/v0/b/new-ml-6c02d.appspot.com/o/Course2_Microproject%2CExam_image%2Fproduct7.png?alt=media&token=3791daca-4bf4-4bca-8780-aa748dc0ee01'
    },
    {
      'title': 'Watches',
      'price': 'Accessories',
      'image':
          'https://firebasestorage.googleapis.com/v0/b/new-ml-6c02d.appspot.com/o/Course2_Microproject%2CExam_image%2Fproduct8.png?alt=media&token=c1758c4c-e1e2-4fca-b85c-e6f2f42e5f9b'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: const Text(
            'Shopping',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
          backgroundColor: Colors.white,
          elevation: 1,
        ),
        body: Padding(
            padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
            // GridView
            child: part1()));
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
