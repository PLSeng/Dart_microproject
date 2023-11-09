import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class SplashSpinkitPractice extends StatefulWidget {
  const SplashSpinkitPractice({Key? key}) : super(key: key);

  @override
  _SplashSpinkitPractice createState() => _SplashSpinkitPractice();
}

class _SplashSpinkitPractice extends State<SplashSpinkitPractice>
    with TickerProviderStateMixin {
  late Animation<double> _animation;
  late AnimationController _controller;
  late Animation colorAnimation;

  @override
  void initState() {
    super.initState();
    initAnimation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFFFCF1E5),
                    Color(0xFFF5FDEB),
                  ],
                )
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ScaleTransition(
                  scale: _animation,
                  // TODO : Part1
                  child: SpinKitFadingCircle(
                    size: 10,
                    color: colorAnimation.value,
                  ),

                ),
                SizedBox(
                  height: 47.0,
                ),
                // TODO : Part2
                Text(
                  'loading',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: colorAnimation.value,
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  initAnimation() {
    {
      _controller = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 2000),
      );
      _animation = TweenSequence(
        <TweenSequenceItem<double>>[
          TweenSequenceItem<double>(
            tween: ConstantTween<double>(1.0),
            weight: 15,
          ),
          TweenSequenceItem<double>(
            tween: Tween<double>(begin: 1.0, end: 7.0)
                .chain(CurveTween(curve: Curves.ease)),
            weight: 15,
          ),
          TweenSequenceItem<double>(
            tween: Tween<double>(begin: 7.0, end: 1.0)
                .chain(CurveTween(curve: Curves.ease)),
            weight: 15,
          ),
          TweenSequenceItem<double>(
            tween: ConstantTween<double>(1.0),
            weight: 15,
          ),
        ],
      ).animate(_controller);
      colorAnimation = TweenSequence(<TweenSequenceItem>[
        TweenSequenceItem(
            tween: ColorTween(begin: Color(0xFF4C7AB0), end: Color(0xFF4C99F4)),
            weight: 30),
        TweenSequenceItem(
            tween: ColorTween(begin: Color(0xFF4C99F4), end: Color(0xFF4C7AB0)),
            weight: 30),
      ]).animate(
          CurvedAnimation(parent: _controller, curve: Interval(0.25, 0.75)));
      _controller.repeat(reverse: true, period: Duration(milliseconds: 2000));
      _animation.addListener(() => setState(() {}));
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);
  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> with TickerProviderStateMixin{
  late AnimationController _controller;
  late Animation colorAnimation;
  late Animation<double> _animation;
  bool _trigger = true;
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 1)).then((value) {
      _trigger = false;
    });
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _animation = TweenSequence(
      <TweenSequenceItem<double>>[
        TweenSequenceItem<double>(
          tween: ConstantTween<double>(1.0),
          weight: 15,
        ),
        TweenSequenceItem<double>(
          tween: ConstantTween<double>(1.0),
          weight: 15,
        ),
      ],
    ).animate(_controller);
    colorAnimation = TweenSequence(<TweenSequenceItem>[
      TweenSequenceItem(
          tween: ColorTween(begin: Color(0xFF0C5C9F), end: Color(0xFF004178)),
          weight: 30),
      TweenSequenceItem(
          tween: ColorTween(begin: Color(0xFF004178), end: Color(0xFF0C5C9F)),
          weight: 30),
    ]).animate(
        CurvedAnimation(parent: _controller, curve: Interval(0, 1)));
    TickerFuture tickerFuture = _controller.repeat(reverse: true, period: Duration(milliseconds: 2000));

    tickerFuture.timeout(Duration(seconds: 6), onTimeout:  () {
      _controller.forward(from: 0);
      _controller.stop(canceled: true);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SplashSpinkitPractice()),
      );
    });
    _animation.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFFFCF1E5),
                Color(0xFFF5FDEB),
              ],
            )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FlutterLogo(size: 108,),
            AnimatedCrossFade(
              firstChild: Container(),
              secondChild: Text("Flutter",
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.w400, decoration: TextDecoration.none, color: colorAnimation.value),
              ),
              crossFadeState: _trigger ? CrossFadeState.showFirst : CrossFadeState.showSecond,
              duration: Duration(seconds: 1),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splash(),
    );
  }
}