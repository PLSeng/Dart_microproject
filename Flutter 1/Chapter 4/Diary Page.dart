import 'package:flutter/material.dart';

class MicroProject extends StatefulWidget {
  const MicroProject({Key? key}) : super(key: key);

  @override
  State<MicroProject> createState() => _MicroProjectState();
}

class _MicroProjectState extends State<MicroProject> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // TODO : part1
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.favorite),
        backgroundColor: Colors.red,
        onPressed: () {
          setState(() {
            isFavorite = !isFavorite;
          });
        },
      ),

      //TODO: Part 2

      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.white,
        title: const Text(
          'Diary',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20.0),
        ),
      ),
      body: Column(
        children: [
          Image.network(
            width: 375,
            height: 209,
            imgUrl,
            fit: BoxFit.fill,
          ),
          Padding(
            padding: const EdgeInsets.all(22.0),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      fit: FlexFit.tight,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text('Cross the Country',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                          Text('2021.9.9',
                              style: TextStyle(
                                  fontSize: 12, color: Color(0xFFB4B4B4))),
                        ],
                      ),
                    ),
                    isFavorite == true ? favoriteIcon : notFavoriteIcon,
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
                const Text(
                  'Ornare tempus faucibus sit integer nibh magnis hac. Vulputate pellentesque risus gravida feugiat cras ut donec eu posuere. Vestibulum at placerat curabitur laoreet pharetra, nunc scelerisque ullamcorper. Tortor tempus tincidunt nisi condimentum mauris integer purus nulla ac.',
                  style: TextStyle(fontSize: 16.0),
                )
              ],
            ),
          ),
        ],
      ),

      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: SizedBox(height: 83, child: Row()),
      ),
    );
  }

  Icon favoriteIcon = const Icon(
    Icons.favorite,
    color: Colors.red,
  );
  Icon notFavoriteIcon = const Icon(
    Icons.favorite_border,
    color: Colors.black,
  );
  bool isFavorite = false;
  String imgUrl =
      'https://firebasestorage.googleapis.com/v0/b/new-ml-6c02d.appspot.com/o/Course2_Microproject%2CExam_image%2Fnature3.jpg?alt=media&token=8b7447b2-5861-4c99-85cb-98c87f71e366';
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MicroProject(),
    );
  }
}
