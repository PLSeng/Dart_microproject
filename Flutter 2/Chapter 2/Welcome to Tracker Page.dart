import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _Home();
}

class _Home extends State<Home> {
  PageController pageController = PageController();
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // TODO : Part 1
      body: PageView.builder(
        controller: pageController,
        itemCount: 3,
        onPageChanged: (int page) {
          setState(() {
            currentPage = page;
          });
        },
        itemBuilder: (context, index) {
          return Stack(
            children: [
              bgImage(index),
              contents(index),
            ],
          );
        },
      ),
    );
  }

  Widget bgImage(int index) {
    return Container(
      decoration: BoxDecoration(
        // TODO : Part 2
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(pages[index].bgImage),
        ),
      ),
    );
  }

  Widget contents(int index) {
    return Container(
      margin: const EdgeInsets.fromLTRB(25, 0, 25, 54),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(pages[index].title,
              style: TextStyle(
                  fontSize: 34,
                  color: Colors.white,
                  fontWeight: FontWeight.bold)),
          SizedBox(height: 12),
          Text(pages[index].subTitle,
              style: TextStyle(fontSize: 16, color: Colors.white)),
          SizedBox(height: 32),
          // TODO : Part 3
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              indicator(),
              SizedBox(
                width: 130,
                height: 40,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xffFFEF61),
                    elevation: 0,
                  ),
                  onPressed: () {
                    currentPage == 2
                        ? showDialog(
                            context: context,
                            builder: (context) => dialog(),
                          )
                        : pageController.nextPage(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.ease,
                          );
                  },
                  child: Text(
                    'Go Next',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget dialog() {
    return CupertinoAlertDialog(
      title: const Text('“Tracker” Would Like to Send you Notifications'),
      content: const Text(
          'Notifications may include alerts,sounds, and icon badges. These can be configured in Settings.'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text("Don't Allow"),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Allow'),
        ),
      ],
    );
  }

  Widget indicator() {
    return SizedBox(
      width: 60,
      child: Row(
        children: [
          for (int i = 0; i < 3; i++)
            Padding(
                padding: const EdgeInsets.all(3),
                child: Container(
                  height: 4,
                  width: i == currentPage ? 18 : 8,
                  decoration: BoxDecoration(
                      color: i == currentPage
                          ? Color(0xffFFEF61)
                          : Color(0xffFEFEFE),
                      borderRadius: BorderRadius.circular(2)),
                ))
        ],
      ),
    );
  }
}

void main() {
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Page {
  String title;
  String subTitle;
  String bgImage;

  Page(this.title, this.subTitle, this.bgImage);
}

List<Page> pages = [
  Page('Welcome to Tracker', 'For those of you who want the best tracking.',
      'https://firebasestorage.googleapis.com/v0/b/new-ml-6c02d.appspot.com/o/Course3_Microproject%2CExam_image%2Fnature1.png?alt=media&token=c971078b-5137-40a8-8d49-01afcca0ccf8'),
  Page(
      'Find the best tracking location',
      'There are a lot of tracking places prepared for you.',
      'https://firebasestorage.googleapis.com/v0/b/new-ml-6c02d.appspot.com/o/Course3_Microproject%2CExam_image%2Fnature2.png?alt=media&token=019b7bf3-75bd-459a-8a47-12898bd054af'),
  Page(
      'Find the best tracking location',
      'There are a lot of tracking places prepared for you.',
      'https://firebasestorage.googleapis.com/v0/b/new-ml-6c02d.appspot.com/o/Course3_Microproject%2CExam_image%2Fnature3.png?alt=media&token=c8323f9b-43eb-4be9-8139-8ab385a1e0a2'),
];
