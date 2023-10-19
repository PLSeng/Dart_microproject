import 'package:flutter/material.dart';

class Microject extends StatelessWidget {
  const Microject({
    Key? key,
    required this.imageUrlFood1,
    required this.imageUrlFood2,
    required this.imageUrlIndustry,
    required this.imageUrlMan,
    required this.contentText,
  }) : super(key: key);
  final String imageUrlFood1;
  final String imageUrlFood2;
  final String imageUrlIndustry;
  final String imageUrlMan;
  final String contentText;

  PreferredSizeWidget part1() {
    //TODO: part 1
    return AppBar(
      backgroundColor: Color(0xff2D404E),
      elevation: 0,
      centerTitle: false,
      title: Text('Journal'),
    );
  }

  Widget part2() {
    return SizedBox(
      height: 386,
      //TODO: part 2
      child: Column(
        children: [
          Flexible(
            flex: 1,
            child: SizedBox(
              width: double.infinity,
              child: Image.network(
                imageUrlFood1,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: SizedBox(
              width: double.infinity,
              child: Image.network(
                imageUrlFood2,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Flexible(
            flex: 4,
            child: SizedBox(
              width: double.infinity,
              child: Image.network(
                imageUrlIndustry,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget part3() {
    return Container(
      //TODO: part 3
      height: 52,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xff999999),
      ),
      child: Center(
        child: Text(
          'Steel industry System',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: 'Roboto',
          ),
        ),
      ),
    );
  }

  Widget part4() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 23),
      //TODO: part 4
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(width: 43, height: 43, child: CircleAvatar(backgroundImage: NetworkImage(imageUrlMan),),),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Spencer K.', style: TextStyle(fontSize: 16, color: Colors.white, fontFamily: 'Roboto',),),
              Text('Apr 5, 2022', style: TextStyle(fontFamily: 'Roboto', fontSize: 12, color: Color(0xffC9C9C9),),),
            ],
          ),
          SizedBox(width: 130,),
          Icon(
            Icons.favorite,
            color: Color(0xffFF0000),
          ),
        ],
      ),
    );
  }

  Widget part5() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 23),
      //TODO: part 5
      child: Text(
        contentText,
        textAlign: TextAlign.left,
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontFamily: 'Roboto',
          height: 1.2,
          letterSpacing: 1.1,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size);
    return Scaffold(
      backgroundColor: const Color(0xff2D404E),
      appBar: part1(),
      body: ListView(
        children: [
          SizedBox(
            height: 812,
            child: Column(
              children: [
                part2(),
                const SizedBox(height: 10),
                part3(),
                part4(),
                part5(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  final String imageUrlFood1 =
      "https://firebasestorage.googleapis.com/v0/b/new-ml-6c02d.appspot.com/o/Course2_Microproject%2CExam_image%2Fcafe1.png?alt=media&token=f8dd03a3-95e9-47d7-9fb2-020c581460aa";
  final String imageUrlFood2 =
      "https://firebasestorage.googleapis.com/v0/b/new-ml-6c02d.appspot.com/o/Course2_Microproject%2CExam_image%2Ffood2.png?alt=media&token=3016e21f-7011-4e2a-8ad4-c877222e3a0e";
  final String imageUrlIndustry =
      "https://firebasestorage.googleapis.com/v0/b/new-ml-6c02d.appspot.com/o/Course2_Microproject%2CExam_image%2Ffactory1.png?alt=media&token=3427eb44-4eb6-42f8-84e3-2908d2cfa1d5";
  final String imageUrlMan =
      "https://firebasestorage.googleapis.com/v0/b/new-ml-6c02d.appspot.com/o/Course2_Microproject%2CExam_image%2Fman1.png?alt=media&token=7ac5d5ad-f8eb-43e8-b597-2bcb9dfaecd5";
  final String contentText =
      "Ornare tempus faucibus sit integer nibh magnis hac. Vulputate pellentesque risus gravida feugiat cras ut donec eu posuere. Vestibulum at placerat curabitur laoreet pharetra, nunc scelerisque ullamcorper. Tortor tempus tincidunt nisi condimentum mauris integer purus nulla ac.";

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Microject(
        imageUrlFood1: imageUrlFood1,
        imageUrlFood2: imageUrlFood2,
        imageUrlIndustry: imageUrlIndustry,
        imageUrlMan: imageUrlMan,
        contentText: contentText,
      ),
    );
  }
}
