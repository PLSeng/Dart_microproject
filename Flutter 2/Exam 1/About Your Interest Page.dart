import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static final ValueNotifier<ThemeMode> themeNotifier =
      ValueNotifier(ThemeMode.light);

  @override
  Widget build(BuildContext context) {
    //TODO: Part 1
    return ValueListenableBuilder(
        valueListenable: themeNotifier,
        builder: (_, ThemeMode currentMode, __) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            //TODO: Part 1 - Instruction 1
            themeMode: currentMode,
            //TODO: Part 1 - Instruction 2
            theme: ThemeData(
              scaffoldBackgroundColor: Color(0xffF5F5F5),
              brightness: Brightness.light,
              cardColor: Color(0xffffffff),
              //TODO: Part 1 - Instruction 3
              switchTheme: SwitchThemeData(
                trackColor: MaterialStateProperty.all(Color(0xffE6E5EA)),
                thumbColor: MaterialStateProperty.all(Colors.white),
              ),
            ),
            //TODO: Part 1 - Instruction 4
            darkTheme: ThemeData(
              brightness: Brightness.dark,
              cardColor: Color(0xff585858),
              //TODO: Part 1 - Instruction 5
              switchTheme: SwitchThemeData(
                trackColor: MaterialStateProperty.all(Color(0xff5B5B5B)),
                thumbColor: MaterialStateProperty.all(Color(0xff303030)),
              ),
            ),
            home: HomePage(),
          );
        });
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
//TODO: Part 2
  Widget Part2() {
    return Row(
      children: [
        Spacer(),
        //TODO: Part 2 - Instruction 1
        Switch(
          value: darkTheme,
          onChanged: (value) {
            //TODO: Part 2 - Instruction 2
            setState(() {
              darkTheme = value;
              MyApp.themeNotifier.value =
                  MyApp.themeNotifier.value == ThemeMode.light
                      ? ThemeMode.dark
                      : ThemeMode.light;
            });
          },
        ),
        //TODO: Part 2 - Instruction 3
      ],
    );
  }

  //TODO: Part 3
  Widget Part3() {
    return Row(
      children: [
        SizedBox(
          width: 22.w,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20.h,
              ),
              //TODO: Part 3 - Instruction 1
              Text(
                'Where are you interested in now?',
                //TODO: Part 3 - Instruction 2
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),

              SizedBox(
                height: 12.h,
              ),
              //TODO: Part 3 - Instruction 3
              Text(
                'You can choose up three.',
                //TODO: Part 3 - Instruction 4
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 12.sp,
                  color: Color(0xff9051C9),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  //TODO: Part 4
  Widget Part4() {
    return Container(
      height: 470.h,
      //TODO: Part 4 - Instruction 1
      padding: EdgeInsets.symmetric(horizontal: 22.0.w),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          //TODO: Part 4 - Instruction 2
          childAspectRatio: 1.0,
          mainAxisSpacing: 22.0.h,
          crossAxisSpacing: 16.0.w,
        ),
        itemCount: 12,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              setState(() {
                if (chooseCnt < 3) {
                  isSelected[index] = !isSelected[index];
                  if (isSelected[index]) {
                    chooseCnt++;
                  } else {
                    chooseCnt--;
                  }
                } else {
                  if (isSelected[index]) {
                    isSelected[index] = !isSelected[index];
                    chooseCnt--;
                  }
                }
              });
            },
            child: Card(
              shadowColor: isSelected[index]
                  ? Colors.purple
                  : Color(0xff00000040).withOpacity(0.25),
              color: isSelected[index] ? Color(0xff9050CA) : null,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              elevation: 10,
              child: Center(
                //TODO: Part 4 - Instruction 3
                child: Padding(
                  padding: EdgeInsets.all(20.0.h),
                  //TODO: Part 4 - Instruction 4
                  child: Icon(
                    icons[index],
                    size: 45.w,
                    color: isSelected[index] ? Colors.white : null,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  //TODO: Part 5
  Container Part5() {
    return Container(
      height: 125.h,
      //TODO: Part 5 - Instruction 1
      padding: EdgeInsets.fromLTRB(22.w, 16.h, 22.w, 56.h),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: chooseCnt == 0
                  ? [Color(0xffCDA7EF), Color(0xffABC1F2)]
                  : [Color(0xffAF71E8), Color(0xff769BEE)]),
        ),
        child: Center(
          //TODO: Part 5 - Instruction 2
          child: Text(
            'COMPLETION',
            //TODO: Part 5 - Instruction 3
            style: TextStyle(
              color: chooseCnt == 0 ? Color(0xffFDFDFD) : Colors.white,
              fontSize: 18.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(375, 812));

    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 40.h,
          ),
          Part2(),
          Part3(),
          SizedBox(
            height: 50.h,
          ),
          Expanded(child: Part4()),
          Part5()
        ],
      ),
    );
  }

  bool darkTheme = false;
  int chooseCnt = 0;

  List<IconData> icons = [
    Icons.camera_alt,
    Icons.sports_soccer,
    Icons.science,
    Icons.sports_esports,
    Icons.theaters,
    Icons.architecture,
    Icons.headset,
    Icons.food_bank,
    Icons.drive_eta,
    Icons.emoji_food_beverage,
    Icons.palette,
    Icons.menu_book
  ];

  List<bool> isSelected = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];
}
