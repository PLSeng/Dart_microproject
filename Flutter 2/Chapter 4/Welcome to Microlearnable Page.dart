import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:shimmer/shimmer.dart';
import 'package:auto_size_text/auto_size_text.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool finish = false;
  late bool isLoading = true;
  late bool shimmer = false;

  Widget Part1() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(height: 320),
        const Text(
          'Hello, we',
          style: TextStyle(
            fontSize: 32,
            color: Colors.white,
            shadows: [
              Shadow(
                blurRadius: 7.0,
                color: Colors.white,
                offset: Offset(0, 0),
              ),
            ],
          ),
        ),
        Container(
          height: 100,
          // TODO: Part 1 - instruction 1
          child: AnimatedTextKit(
            totalRepeatCount: 1,
            repeatForever: false,
            isRepeatingAnimation: false,
            onFinished: () {
              setState(() {
                finish = true;
              });
            },
            animatedTexts: [
              FlickerAnimatedText(
                'CODE',
                textStyle: flickerStyle,
              ),
              FlickerAnimatedText(
                'DESIGN',
                textStyle: flickerStyle,
              ),
              FlickerAnimatedText(
                'TEACH',
                textStyle: flickerStyle,
              ),
              FlickerAnimatedText(
                'LEARN',
                textStyle: flickerStyle,
              ),
              FlickerAnimatedText(
                'DEVELOP',
                textStyle: flickerStyle,
              ),
            ],
          ),
        ),
        finish
            ? Container(
                margin: const EdgeInsets.only(top: 250),
                // height: 100,
                child: const Text(
                  '(TAP)',
                  style: TextStyle(fontSize: 20, color: Color(0xffF0F0F0)),
                ))
            : Container(),
      ],
    );
  }

  Widget Part2() {
    return Shimmer.fromColors(
        // TODO: Part 2 - instruction 1
        baseColor: const Color(0xffDDDDDD),
        highlightColor: const Color(0xffFFFFFF),
        enabled: true,
        child: Padding(
          padding: const EdgeInsets.only(left: 32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 28,
              ),
              Container(
                width: 177,
                height: 40,
                color: Colors.white,
              ),
              SizedBox(
                height: 17,
              ),
              Container(
                width: 265,
                height: 134,
                color: Colors.white,
              ),
              SizedBox(
                height: 17,
              ),
              Container(
                width: 265,
                height: 134,
                color: Colors.white,
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                width: 273,
                height: 44,
                color: Colors.white,
              )
            ],
          ),
        ));
  }

  Widget Part3() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 32, top: 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "Please check your answer.",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff0F356D)),
              ),
              SizedBox(height: 4),
              Text(
                'Your answer will be useed preciously for us.',
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Color(0xff63676B),
                    fontSize: 12),
              )
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 32, top: 17),
          child: Text(
            '1. Let me know why you use microlearnable.',
            style: TextStyle(
                fontWeight: FontWeight.w400,
                color: Color(0xff3E6B9A),
                fontSize: 12),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 32, top: 8),
          child: Container(
            padding: const EdgeInsets.fromLTRB(10, 12, 10, 12),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey, width: 1),
              borderRadius: BorderRadius.circular(4),
            ),
            width: 265,
            height: 100,
            // TODO: Part 3 - instruction 1
            child: AutoSizeText(
              "I want to develop my own mobile app based on what I learned by studying flutter through microlearnable. It's good just to think about it.",
              maxLines: 4,
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 32, top: 17),
          child: Text(
            '2. What do you want to study the most in flutter?',
            style: TextStyle(
                fontWeight: FontWeight.w400,
                color: Color(0xff3E6B9A),
                fontSize: 12),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 32, top: 8),
          child: Container(
            padding: const EdgeInsets.fromLTRB(10, 12, 10, 12),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey, width: 1),
              borderRadius: BorderRadius.circular(4),
            ),
            width: 265,
            height: 100,
            // TODO: Part 3 - instruction 2
            child: AutoSizeText(
              "I want to learn everything about flutter, but I want to use various packages within flutter. It seems strange and fun to be able to develop without implementing the function directly.",
              maxLines: 4,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 32, top: 42),
          child: Container(
            width: 273,
            height: 44,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  elevation: 0,
                  primary: const Color(0xff3271B4),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6))),
              child: const Text(
                "submit and start",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Color(0xffFFFFFF)),
              ),
            ),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          print('tap');

          finish
              ? {
                  setState(() {
                    shimmer = true;
                  }),
                  Future.delayed(const Duration(seconds: 2), () {
                    setState(() {
                      isLoading = false;
                    });
                  })
                }
              : {};
        },
        child: Center(
          child: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color(0xff003472),
                Color(0xff0B2752),
              ],
            )),
            child: Container(
              decoration: BoxDecoration(
                  gradient: RadialGradient(
                colors: [
                  Color(0xff87FFA9).withOpacity(0.1),
                  Color(0xff264571).withOpacity(0.1),
                ],
              )),
              child: Center(
                  child: Column(
                children: [
                  shimmer
                      ? Container(
                          margin: const EdgeInsets.only(top: 180),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: Colors.white),
                          width: 329,
                          height: 478,
                          child: isLoading ? Part2() : Part3())
                      : Part1(),
                ],
              )),
            ),
          ),
        ),
      ),
    );
  }

  TextStyle flickerStyle = const TextStyle(
    fontSize: 44,
    color: Colors.white,
    shadows: [
      Shadow(
        blurRadius: 7.0,
        color: Colors.white,
        offset: Offset(0, 0),
      ),
    ],
  );
}
