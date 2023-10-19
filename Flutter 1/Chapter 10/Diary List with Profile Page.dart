import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // TODO : Part 1
      routes: {
        '/': (context) => Microject(),
        '/profile': (context) => const ProfilePage(),
      },
      initialRoute: '/',
    );
  }
}

class _MicrojectState extends State<Microject> {
  Widget part2() {
    // TODO : Part 2
    return IconButton(
      onPressed: () {
        Navigator.pushNamed(context, '/profile');
      },
      icon: Icon(
        Icons.account_circle,
        color: Colors.black,
      ),
    );
  }

  final imageUrl1 =
      'https://firebasestorage.googleapis.com/v0/b/new-ml-6c02d.appspot.com/o/Course2_Microproject%2CExam_image%2Fnature3.jpg?alt=media&token=8b7447b2-5861-4c99-85cb-98c87f71e366';
  final imageUrl2 =
      'https://images.unsplash.com/photo-1529333166437-7750a6dd5a70?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1169&q=80';
  final imageUrl3 =
      'https://images.unsplash.com/photo-1500462918059-b1a0cb512f1d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80 ';

  final List<bool> _isClicked = [false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text(
          'Home',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 1,
        actions: [part2()],
      ),
      body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(23, 20, 23, 0),
                child: buildCard(
                    'Went to the Mountains', '2022.9.9', imageUrl1, 0),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(23, 20, 23, 0),
                child: buildCard('Back to teen', '2022.8.7', imageUrl2, 1),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(23, 20, 23, 20),
                child:
                    buildCard('Went to the museum', '2022.5.19', imageUrl3, 0),
              ),
            ],
          )),
    );
  }

  Widget buildCard(String text1, String text2, String imageUrl, int index) {
    return GestureDetector(
      onDoubleTap: () {
        setState(() {
          _isClicked[index] = !_isClicked[index];
        });
      },
      child: SizedBox(
        height: 322,
        width: 329,
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                    image: DecorationImage(
                        fit: BoxFit.cover, image: NetworkImage(imageUrl))),
                height: 225,
                width: 329,
              ),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(14, 15, 0, 2),
                          child: Text(
                            text1,
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w700),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 14),
                          child: Text(
                            text2,
                            style: const TextStyle(
                                fontSize: 16, color: Color(0xFFA7A7A7)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    _isClicked[index] ? Icons.favorite : Icons.favorite_border,
                    color: _isClicked[index] ? Colors.red : Colors.grey,
                  ),
                  const SizedBox(
                    width: 22,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MyApp());
}

class Microject extends StatefulWidget {
  @override
  State<Microject> createState() => _MicrojectState();
}

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            'Profile',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
          centerTitle: false,
          elevation: 1,
          iconTheme: const IconThemeData(color: Colors.black),
        ),
        body: buildBody(
            'https://firebasestorage.googleapis.com/v0/b/new-ml-6c02d.appspot.com/o/Course2_Microproject%2CExam_image%2Fperson1.jpg?alt=media&token=8d88face-f7de-4b73-a9df-72ae2fdc1116',
            "Patrick Kwon",
            "UX Designer"));
  }

  Widget buildBody(String url, String text1, String text2) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 196,
            width: 196,
            child: CircleAvatar(
              backgroundImage: NetworkImage(url),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            text1,
            style: const TextStyle(
                fontSize: 26, fontWeight: FontWeight.bold, letterSpacing: -1),
          ),
          const SizedBox(
            height: 13,
          ),
          Text(
            text2,
            style: const TextStyle(
              fontSize: 18,
              color: Color(0xffA5A5A5),
            ),
          ),
        ],
      ),
    );
  }
}
