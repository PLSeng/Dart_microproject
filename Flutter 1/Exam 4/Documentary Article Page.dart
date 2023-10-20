import 'package:flutter/material.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);
  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      //asynchronous delay
      Navigator.pushNamed(context, '/home');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(56, 0, 56, 0),
          // TODO : Part 1
          child: LinearProgressIndicator(
            color: Color(0xffF0C541),
            backgroundColor: Colors.white,
          ),
        ),
        SizedBox(height: 79)
      ],
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selected = 0;
  List<Color> gradientColor = [
    Color.fromRGBO(25, 25, 23, 1),
    Color.fromRGBO(0, 0, 0, 1)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _selected == 0
          ? Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: gradientColor)),
                ),
                Column(
                  children: [
                    // TODO : Part 2
                    Hero(
                      tag: 'tiger',
                      child: Image.network(
                        tigerImg,
                        width: double.infinity,
                        height: 290,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Opacity(
                      opacity: 0.15,
                      child: Image.network(
                        tigerImg2,
                        width: double.infinity,
                        height: 290,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    todayArticleSection(),
                    Expanded(child: subscriberExclusiveSection())
                  ],
                ),
              ],
            )
          : Container(color: Colors.black),
      bottomNavigationBar: bottomNavBar(),
    );
  }

  Widget subscriberExclusiveSection() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        _header('SUBSCRIBER EXCLUSIVE'),
        SizedBox(
            height: 120,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: subscriberExclusive.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  child: Container(
                      margin: const EdgeInsets.all(10),
                      width: 160,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(subscriberExclusive[index]),
                            fit: BoxFit.fill),
                        borderRadius: BorderRadius.circular(12),
                      )),
                  onTap: () {
                    // TODO : Part 3
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'This content only for subscriber',
                          style: TextStyle(color: Color(0xff737373)),
                        ),
                        backgroundColor: Colors.white,
                      ),
                    );
                  },
                );
              },
            ))
      ],
    );
  }

  Widget bottomNavBar() {
    return BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        currentIndex: _selected,
        onTap: (int index) {
          setState(() {
            _selected = index;
          });
        },
        items: navBarItems);
  }

  Widget todayArticleSection() {
    return Column(
      children: [
        _header('TODAY ARTICLE'),
        const SizedBox(height: 270),
        const Text(
          'Secret Bengal Tiger',
          style: TextStyle(
              fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
        SizedBox(
          width: 280,
          height: 52,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Color(0xffF0C541),
            ),
            child: const Text('READ NOW',
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5)),
            onPressed: () {
              Navigator.pushNamed(context, '/article');
            },
          ),
        )
      ],
    );
  }
}

class Article extends StatefulWidget {
  const Article({Key? key}) : super(key: key);
  @override
  State<Article> createState() => _ArticleState();
}

class _ArticleState extends State<Article> {
  int likes = 2243;
  bool liked = false;
  bool disliked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.black,
          ),
          Column(
            children: [
              _header('Secret Bengal Tiger'),
              const SizedBox(height: 20),
              // TODO : Part 4
              Hero(
                tag: 'tiger',
                child: Image.network(tigerImg),
              ),
              const SizedBox(height: 20),
              Flexible(
                  child: SingleChildScrollView(
                      child: Padding(
                padding: EdgeInsets.all(23),
                child: Text(
                  tigerDesc,
                  style: const TextStyle(
                      color: Colors.white, letterSpacing: 2.0, height: 2.0),
                ),
              )))
            ],
          )
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: const Color(0xff1A1A1A),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () {
                  Navigator.pop(context);
                }),
            Row(
              children: [
                // TODO : Part 5
                Text(
                  likes.toString(),
                  style: TextStyle(
                    color: liked ? Colors.yellow : Colors.white,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    if (!disliked) {
                      setState(() {
                        if (liked)
                          likes--;
                        else
                          likes++;
                        liked = !liked;
                      });
                    }
                  },
                  icon: Icon(
                    Icons.thumb_up_alt,
                    color: liked ? Colors.yellow : Colors.white,
                  ),
                ),
              ],
            ),
            IconButton(
                icon: Icon(Icons.thumb_down_alt,
                    color: disliked ? Colors.yellow : Colors.white),
                onPressed: () {
                  if (!liked) {
                    setState(() {
                      disliked = !disliked;
                    });
                  }
                }),
          ],
        ),
      ),
    );
  }
}

String tigerImg =
    'https://firebasestorage.googleapis.com/v0/b/new-ml-6c02d.appspot.com/o/Course2_Microproject%2CExam_image%2Ftiger1.png?alt=media&token=3f62f0fc-ba87-4d61-bca0-ec3a18444df3';
String tigerImg2 =
    'https://firebasestorage.googleapis.com/v0/b/new-ml-6c02d.appspot.com/o/Course2_Microproject%2CExam_image%2Ftiger1_1.png?alt=media&token=63b1fdbb-8544-45d2-ad21-04ef97c00832';
List<String> subscriberExclusive = [
  'https://firebasestorage.googleapis.com/v0/b/new-ml-6c02d.appspot.com/o/Course2_Microproject%2CExam_image%2Fturtle1.png?alt=media&token=752a9b9f-e5bc-4373-a185-385d63bab4f0',
  'https://firebasestorage.googleapis.com/v0/b/new-ml-6c02d.appspot.com/o/Course2_Microproject%2CExam_image%2Fspace2.png?alt=media&token=811254b4-7c8c-449d-b022-6f66af0c69f8',
  'https://firebasestorage.googleapis.com/v0/b/new-ml-6c02d.appspot.com/o/Course2_Microproject%2CExam_image%2Fcat1.png?alt=media&token=c76655de-b6c9-4a22-a5f5-0ce383baa21f',
  'https://firebasestorage.googleapis.com/v0/b/new-ml-6c02d.appspot.com/o/Course2_Microproject%2CExam_image%2Fjob3.png?alt=media&token=87da4f6b-1771-42b8-aacd-2ff6d61aafea',
  'https://firebasestorage.googleapis.com/v0/b/new-ml-6c02d.appspot.com/o/Course2_Microproject%2CExam_image%2Fspace1.png?alt=media&token=04442973-8468-4e65-a45e-89ebc49151fb'
];
String tigerDesc =
    'The Bengal tiger (also known as the Bengal tiger Panthera tigris or Bengal tiger) is a subspecies of the tiger, distributed in Sundarbans, Nepal, India, and Bangladesh. It is brown with black striped fur. But the mutant white tiger is white with brown stripes. Based on the male Bengal tiger, the total length is 2.4~3.6m, the weight is 140~320kg, and the average weight of the male Bengal tiger is 230kg. The fur is short and is purple. Among the tiger subspecies, it is the second largest after the Siberian tiger and has the largest population, accounting for more than 70%. (However, the largest subspecies of wild populations have become Bengal tigers, as the number of Siberian tigers has decreased due to the only overfishing of wild populations.';

List<BottomNavigationBarItem> navBarItems = const [
  BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
  BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
  BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
];

Widget _header(String title) {
  return Column(
    children: [
      const SizedBox(height: 20),
      Row(
        children: [
          const SizedBox(width: 20),
          Container(height: 10, width: 4, color: const Color(0xffF0C541)),
          const SizedBox(width: 4),
          Text(
            title,
            style: const TextStyle(
                fontSize: 12, color: Colors.white, fontWeight: FontWeight.bold),
          )
        ],
      )
    ],
  );
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => Loading(),
        '/home': (context) => Home(),
        '/article': (context) => Article(),
      },
    );
  }
}
