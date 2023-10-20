import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => const MovieListPage(),
          // TODO : Part 1
          '/detail': (context) => MovieDetailPage(),
        });
  }
}

class MovieListPage extends StatefulWidget {
  const MovieListPage({Key? key}) : super(key: key);
  @override
  State<MovieListPage> createState() => _MovieListPageState();
}

class _MovieListPageState extends State<MovieListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Movie',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: false,
        backgroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: movieList.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
            // TODO : Part 2
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/detail', arguments: index);
              },
              child: Stack(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 150,
                    child: Image.network(
                      movieList[index].image,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(14),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          movieList[index].name,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          movieList[index].author,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class MovieDetailPage extends StatelessWidget {
  MovieDetailPage({Key? key}) : super(key: key);
  late int idx;

  @override
  Widget build(BuildContext context) {
    // TODO : Part 3
    idx = ModalRoute.of(context)!.settings.arguments as int;

    Widget imageSection() {
      return SizedBox(
        height: 223, width: double.infinity,
        // TODO : Part 4
        child: Image.network(
          movieList[idx].image,
          fit: BoxFit.fitWidth,
        ),
      );
    }

    Widget nameAuthorSection() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // TODO : Part 5
          Text(
            movieList[idx].name,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          Text(
            movieList[idx].author,
          ),
        ],
      );
    }

    Widget castingSection() {
      return SizedBox(
        height: 50,
        // TODO : Part 6
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: movieList[idx].casting.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: EdgeInsets.only(right: 9),
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                  movieList[idx].casting[index],
                ),
                backgroundColor: Colors.transparent,
              ),
            );
          },
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Movie Detail',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back, color: Colors.black)),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          imageSection(),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                nameAuthorSection(),
                const SizedBox(height: 13),
                scoreSection(),
                const SizedBox(height: 22),
                header('Casting'),
                const SizedBox(height: 17),
                castingSection(),
                const SizedBox(height: 16),
                header('Synopsis'),
                const SizedBox(height: 11),
                const Text(
                  'Nunc purus nec, auctor elementum dignissim morbi morbi ut. Diam mollis sagittis non parturient sit mauris pellentesque egestas justo.',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget header(String title) {
    return Text(title,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16));
  }

  Widget scoreSection() {
    return Row(children: const [
      Icon(Icons.star, color: Colors.yellow),
      Icon(Icons.star, color: Colors.yellow),
      Icon(Icons.star, color: Colors.yellow),
      Icon(Icons.star, color: Colors.yellow),
      Icon(Icons.star, color: Colors.yellow),
      Text('  9.8', style: TextStyle(color: Colors.yellow))
    ]);
  }
}

List<String> person = [
  'https://firebasestorage.googleapis.com/v0/b/new-ml-6c02d.appspot.com/o/Course2_Microproject%2CExam_image%2Fperson1.jpg?alt=media&token=8d88face-f7de-4b73-a9df-72ae2fdc1116',
  'https://firebasestorage.googleapis.com/v0/b/new-ml-6c02d.appspot.com/o/Course2_Microproject%2CExam_image%2Fperson2.jpg?alt=media&token=81e986ba-0503-4479-8612-6bc8e71c27ce',
  'https://firebasestorage.googleapis.com/v0/b/new-ml-6c02d.appspot.com/o/Course2_Microproject%2CExam_image%2Fperson3.jpg?alt=media&token=86b461c2-320d-47cc-b7df-4c5edae3cf7a',
  'https://firebasestorage.googleapis.com/v0/b/new-ml-6c02d.appspot.com/o/Course2_Microproject%2CExam_image%2Fperson4.jpg?alt=media&token=faf47c4a-1bf9-463a-bb97-4cedc695f023',
  'https://firebasestorage.googleapis.com/v0/b/new-ml-6c02d.appspot.com/o/Course2_Microproject%2CExam_image%2Fperson5.jpg?alt=media&token=f70c2481-b744-49fd-9d12-4ca092c42127',
  'https://firebasestorage.googleapis.com/v0/b/new-ml-6c02d.appspot.com/o/Course2_Microproject%2CExam_image%2Fperson6.png?alt=media&token=15a06b7d-611b-4d38-aff8-be5aa457fbd6',
  'https://firebasestorage.googleapis.com/v0/b/new-ml-6c02d.appspot.com/o/Course2_Microproject%2CExam_image%2Fman1.png?alt=media&token=7ac5d5ad-f8eb-43e8-b597-2bcb9dfaecd5'
];

List<Movie> movieList = [
  Movie(
      'https://firebasestorage.googleapis.com/v0/b/new-ml-6c02d.appspot.com/o/Course2_Microproject%2CExam_image%2Fmovie1.jpg?alt=media&token=65e84654-2001-47cd-ba0d-5a978a163a2d',
      'Name of the Movie',
      'Author',
      [person[0], person[1], person[2], person[3], person[4]]),
  Movie(
      'https://firebasestorage.googleapis.com/v0/b/new-ml-6c02d.appspot.com/o/Course2_Microproject%2CExam_image%2Fmovie2.jpg?alt=media&token=d102e69f-96c3-46d3-bffd-12e48ef39cdf',
      'Name of the Movie',
      'Author',
      [person[2], person[5]]),
  Movie(
      'https://firebasestorage.googleapis.com/v0/b/new-ml-6c02d.appspot.com/o/Course2_Microproject%2CExam_image%2Fmovie3.jpg?alt=media&token=fabeaf0d-d479-4a3e-9346-b40a5ed15ce3',
      'Name of the Movie',
      'Author',
      [person[0], person[6], person[1], person[4]]),
];

class Movie {
  final String image;
  final String name;
  final String author;
  final List<String> casting;
  Movie(
    this.image,
    this.name,
    this.author,
    this.casting,
  );
}

void main() {
  runApp(const MyApp());
}
