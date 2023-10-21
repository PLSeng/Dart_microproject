import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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

class MicroProjectPage extends StatelessWidget {
  const MicroProjectPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return ScreenUtilInit(
      // TODO: Part 1
      designSize: width > 480 ? Size(480, 812) : Size(375, 812),
      builder: (BuildContext context, Widget? child) {
        return Scaffold(
          // TODO: Part 2
          body: Padding(
            padding: EdgeInsets.fromLTRB(23.w, 96.h, 23.w, 0),
            child: GridView.count(
              crossAxisCount: width > 480 ? 2 : 1,
              mainAxisSpacing: 28.h,
              children: [
                ...List.generate(natureList.length, (index) {
                  return large(index);
                }),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget small(int index) {
    return SizedBox(
      // TODO: Part 3
      height: 290.h,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Column(
          children: [
            Container(
              height: 212.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12)),
                  image: DecorationImage(
                      image: NetworkImage(natureList[index].img),
                      fit: BoxFit.fill)),
            ),
            Expanded(
                child: Row(
              children: [
                SizedBox(width: 16.w),
                CircleAvatar(
                  radius: 24.h,
                  backgroundImage: NetworkImage(natureList[index].profile),
                ),
                SizedBox(width: 12.w),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(natureList[index].title,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    Text(natureList[index].category)
                  ],
                )
              ],
            ))
          ],
        ),
      ),
    );
  }

  Widget large(int index) {
    return SizedBox(
      // TODO: Part 4
      height: 190.h,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          children: [
            Container(
              height: 135.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8)),
                  image: DecorationImage(
                      image: NetworkImage(natureList[index].img),
                      fit: BoxFit.fill)),
            ),
            Expanded(
                child: Row(
              children: [
                SizedBox(width: 12.w),
                CircleAvatar(
                  radius: 18.h,
                  backgroundImage: NetworkImage(natureList[index].profile),
                ),
                SizedBox(width: 8.w),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(natureList[index].title,
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold)),
                    Text(natureList[index].category),
                  ],
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}

class Nature {
  String title;
  String category;
  String img;
  String profile;

  Nature(this.title, this.category, this.img, this.profile);
}

List<Nature> natureList = [
  Nature(
      'A Beautiful Sky',
      'nature',
      'https://firebasestorage.googleapis.com/v0/b/new-ml-6c02d.appspot.com/o/Course2_Microproject%2CExam_image%2Fsky1.png?alt=media&token=6587f25c-20c8-4531-a6e1-f4732bee96ea',
      'https://firebasestorage.googleapis.com/v0/b/new-ml-6c02d.appspot.com/o/Course2_Microproject%2CExam_image%2Fman1.png?alt=media&token=7ac5d5ad-f8eb-43e8-b597-2bcb9dfaecd5'),
  Nature(
      'Plants',
      'nature',
      'https://firebasestorage.googleapis.com/v0/b/new-ml-6c02d.appspot.com/o/Course2_Microproject%2CExam_image%2Fplant2.png?alt=media&token=116d067d-d6de-4e2f-b537-66b9171407cc',
      'https://firebasestorage.googleapis.com/v0/b/new-ml-6c02d.appspot.com/o/Course2_Microproject%2CExam_image%2Fperson4.jpg?alt=media&token=faf47c4a-1bf9-463a-bb97-4cedc695f023'),
  Nature(
      'Cute Turtle',
      'animal',
      'https://firebasestorage.googleapis.com/v0/b/new-ml-6c02d.appspot.com/o/Course2_Microproject%2CExam_image%2Fturtle1.png?alt=media&token=752a9b9f-e5bc-4373-a185-385d63bab4f0',
      'https://firebasestorage.googleapis.com/v0/b/new-ml-6c02d.appspot.com/o/Course2_Microproject%2CExam_image%2Fperson1.jpg?alt=media&token=8d88face-f7de-4b73-a9df-72ae2fdc1116'),
  Nature(
      'A deer',
      'animal',
      'https://firebasestorage.googleapis.com/v0/b/new-ml-6c02d.appspot.com/o/Course2_Microproject%2CExam_image%2Fdeer1.png?alt=media&token=4f3e4f1c-8494-491f-8989-a32eaa210b6d',
      'https://firebasestorage.googleapis.com/v0/b/new-ml-6c02d.appspot.com/o/Course2_Microproject%2CExam_image%2Fperson3.jpg?alt=media&token=86b461c2-320d-47cc-b7df-4c5edae3cf7a'),
  Nature(
      'A Tiger',
      'animal',
      'https://firebasestorage.googleapis.com/v0/b/new-ml-6c02d.appspot.com/o/Course2_Microproject%2CExam_image%2Ftiger1.png?alt=media&token=3f62f0fc-ba87-4d61-bca0-ec3a18444df3',
      'https://firebasestorage.googleapis.com/v0/b/new-ml-6c02d.appspot.com/o/Course2_Microproject%2CExam_image%2Fperson3.jpg?alt=media&token=86b461c2-320d-47cc-b7df-4c5edae3cf7a'),
  Nature(
      'The sight of traveler',
      'nature',
      'https://firebasestorage.googleapis.com/v0/b/new-ml-6c02d.appspot.com/o/Course2_Microproject%2CExam_image%2Fmovie2.jpg?alt=media&token=d102e69f-96c3-46d3-bffd-12e48ef39cdf',
      'https://firebasestorage.googleapis.com/v0/b/new-ml-6c02d.appspot.com/o/Course2_Microproject%2CExam_image%2Fperson6.png?alt=media&token=15a06b7d-611b-4d38-aff8-be5aa457fbd6'),
];
