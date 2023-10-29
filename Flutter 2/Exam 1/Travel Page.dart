import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:ui';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = window.physicalSize.width;

    // TODO: Part 1

    return ScreenUtilInit(
      designSize: width <= 500 ? Size(375, 812) : Size(500, 812),
      builder: (BuildContext context, Widget? child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MicroProjectPage(),
      ),
    );
  }
}

class MicroProjectPage extends StatelessWidget {
  MicroProjectPage({Key? key}) : super(key: key);

  //TODO: Part 2
  @override
  Widget build(BuildContext context) {
    //TODO: Part 2 - instruction 1
    dynamic width = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: Text(
            'Time to Travel',
            //TODO: Part 2 - instruction 2
            style: TextStyle(
              fontSize: 18.sp,
              color: Colors.black,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  width: width,
                  child: Image.network(
                    'https://firebasestorage.googleapis.com/v0/b/new-ml-6c02d.appspot.com/o/Course3_Microproject%2CExam_image%2Ftravel1.png?alt=media&token=ead9f6dc-e2ee-40bf-a4a0-6079ed7ad37e',
                  )),
              Container(
                padding: const EdgeInsets.only(left: 30, right: 30, top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //TODO: Part 2 - instruction 3, 4
                    Text(
                      'Posts',
                      style: TextStyle(
                        fontSize: 20.sp,
                        color: Color(0xff54435C),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    width < 500
                        ? verticalPostcardBuilder()
                        : horizontalPostcardBuilder(),
                  ],
                ),
              )
            ],
          ),
        ));
  }

  //TODO: Part 3
  verticalPostcardBuilder() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: posts.length,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.only(bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //TODO: Part3 - Instruction 1, 2
              Container(
                height: 151.h,
                width: 1.sw,
                child: Image.network(
                  posts[index]['image'],
                  fit: BoxFit.fitWidth,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              //TODO: Part3 - Instruction 3
              Text(
                posts[index]['title'],
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              //TODO: Part3 - Instruction 4
              Text(
                posts[index]['describe'],
                style: TextStyle(
                  color: Color(0xff585858),
                  fontSize: 12.sp,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //TODO: Part3 - Instruction 5
                  Text(
                    posts[index]['date'],
                    style: TextStyle(
                      fontSize: 10.sp,
                      color: Color(0xffC6C6C6),
                    ),
                  ),
                  Row(
                    children: [
                      //TODO: Part3 - Instruction 6
                      Icon(
                        Icons.favorite_border,
                        color: Color(0xffFF7171),
                        size: 10.w,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      //TODO: Part3 - Instruction 7
                      Text(
                        posts[index]['likes'].toString(),
                        style: TextStyle(
                          fontSize: 9.sp,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      //TODO: Part3 - Instruction 8
                      Icon(
                        Icons.comment,
                        size: 10.w,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      //TODO: Part3 - Instruction 9
                      Text(
                        posts[index]['comments'].toString(),
                        style: TextStyle(
                          fontSize: 9.sp,
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        );
      },
    );
  }

  //TODO: Part 4
  horizontalPostcardBuilder() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: posts.length,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.only(bottom: 20),
          width: 1.sw,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //TODO: Part 4 - Instruction 1, 2
              Container(
                width: 198.w,
                height: 0.25.sw,
                child: Image.network(
                  posts[index]['image'],
                  fit: BoxFit.fitHeight,
                ),
              ),
              SizedBox(
                width: 14,
              ),
              Container(
                //TODO: Part 4 - Instruction 3
                width: 228.h,
                height: 0.25.sw,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //TODO: Part 4 - Instruction 4
                        Text(
                          posts[index]['title'],
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        //TODO: Part 4 - Instruction 5
                        Text(
                          posts[index]['describe'],
                          style: TextStyle(
                            color: Color(0xff585858),
                            fontSize: 12.sp,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //TODO: Part 4 - Instruction 6
                        Text(
                          posts[index]['date'],
                          style: TextStyle(
                            fontSize: 10.sp,
                            color: Color(0xffC6C6C6),
                          ),
                        ),
                        Row(
                          children: [
                            //TODO: Part 4 - Instruction 7
                            Icon(
                              Icons.favorite_border,
                              color: Color(0xffFF7171),
                              size: 10.w,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            //TODO: Part 4 - Instruction 8
                            Text(
                              posts[index]['likes'].toString(),
                              style: TextStyle(fontSize: 9.sp),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            //TODO: Part 4 - Instruction 9
                            Icon(
                              Icons.comment,
                              size: 10.w,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            //TODO: Part 4 - Instruction 10
                            Text(
                              posts[index]['comments'].toString(),
                              style: TextStyle(fontSize: 9.sp),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  List<Map> posts = [
    {
      'title': 'A Summer Trip to Thailand',
      'image':
          'https://firebasestorage.googleapis.com/v0/b/new-ml-6c02d.appspot.com/o/Course3_Microproject%2CExam_image%2Ftravel2.png?alt=media&token=9dceb55f-6a86-41c9-b47f-542ea846eafe',
      'describe':
          'Today\'s recommended travel destination is Thailand. Thailand is a Southeast Asian country with a variety of food and attractions...',
      'date': '2022.08.07',
      'likes': 7,
      'comments': 3,
    },
    {
      'title': 'Let Me Introduce Seoul',
      'image':
          'https://firebasestorage.googleapis.com/v0/b/new-ml-6c02d.appspot.com/o/Course3_Microproject%2CExam_image%2Ftravel3.png?alt=media&token=40866e7b-326b-4038-a8f8-66391135947f',
      'describe':
          'I live in South Korea. Today, I would like to introduce Seoul, the capital of Korea. I will also tell you about Korean traditional houses such as hanok, hanbok, and Korean...',
      'date': '2022.04.12',
      'likes': 11,
      'comments': 6,
    }
  ];
}
