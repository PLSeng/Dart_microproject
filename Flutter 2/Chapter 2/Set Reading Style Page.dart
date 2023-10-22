import 'package:flutter/material.dart';

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
      body: Stack(
        children: [
          // TODO : Part 1
          middle(),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                top(),
                bottom(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget middle() {
    return Container(
      width: 400, height: 900,
      padding: const EdgeInsets.fromLTRB(20, 100, 20, 100),
      // TODO : Part 2
      child: PageView.builder(
        itemBuilder: (context, index) => SetReadingStyle(pages[index]),
        itemCount: 2,
        controller: pageController,
        onPageChanged: (int page) {
          setState(() {
            currentPage = page;
          });
        },
      ),
    );
  }

  Widget top() {
    return Container(
      width: 55,
      margin: const EdgeInsets.only(top: 71),
      child: Row(
        children: [
          for (int i = 0; i < 2; i++)
            if (i == currentPage) bigCircle() else circle()
        ],
      ),
    );
  }

  Widget bottom() {
    return Container(
      margin: const EdgeInsets.only(bottom: 48),
      width: 329, height: 54,
      // TODO : Part 3
      child: ElevatedButton(
        onPressed: () {
          pageController.nextPage(
            duration: Duration(milliseconds: 300),
            curve: Curves.ease,
          );
        },
        child: Text(
          'next',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        style: ElevatedButton.styleFrom(
          primary: Color(0xff8EB17A),
          elevation: 0,
        ),
      ),
    );
  }

  Widget circle() {
    return const Padding(
      padding: EdgeInsets.all(3),
      // TODO : Part 4
      child: CircleAvatar(
        radius: 3,
        backgroundColor: Color(0xffE3F3DA),
      ),
    );
  }

  Widget bigCircle() {
    return Padding(
        padding: const EdgeInsets.all(3),
        child: Container(
          width: 24,
          height: 6,
          decoration: BoxDecoration(
              color: const Color(0xffB3D3A3),
              borderRadius: BorderRadius.circular(4)),
        ));
  }
}

class SetReadingStyle extends StatefulWidget {
  SetReadingStyle(this.page, {Key? key}) : super(key: key);
  Page page;

  @override
  State<StatefulWidget> createState() => _SetReadingStyle();
}

class _SetReadingStyle extends State<SetReadingStyle> {
  @override
  Widget build(BuildContext context) {
    Page page = widget.page;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 50),
        Text(
          page.title,
          style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Color(0xff2A3325)),
        ),
        const SizedBox(height: 10),
        Text(
          page.subTitle,
          style: const TextStyle(fontSize: 12, color: Color(0xff989A96)),
        ),
        GridView.builder(
            itemCount: page.options.length,
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: page.options.length > 4 ? 2 : 1,
                childAspectRatio: page.options.length > 4 ? 161 / 44 : 329 / 44,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10),
            itemBuilder: (BuildContext context, int index) {
              // TODO : Part 5
              return GestureDetector(
                onTap: () {
                  setState(() {
                    page.selected[index] = !page.selected[index];
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: page.selected[index]
                        ? Color(0xffB3D3A3)
                        : Color(0xffFEFEFE),
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(color: Color(0xffDDDDDD)),
                  ),
                  child: Center(
                    child: Text(
                      page.options[index],
                      style: TextStyle(
                        color: Color(0xff585858),
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              );
            })
      ],
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
  List<String> options;
  List<bool> selected;

  Page(this.title, this.subTitle, this.options, this.selected);
}

List<Page> pages = [
  Page(
      'What kind of reading\nstyle do you like?',
      'Choose the one that is closest to you preference.',
      [
        'Read slowly and leisurely',
        'Read key information quickly',
        'Read little by little at a time',
        'Read a book over and over again'
      ],
      List<bool>.filled(4, false)),
  Page(
      'What interests do you want\nto get recommended?',
      'For the category of interest, the main screen\nwill recommend you books every day.',
      [
        'Nobel',
        'Poem/Essay',
        'History',
        'Philosophy',
        'Social/Politics',
        'Art/Culture',
        'Science',
        'Cooking',
        'Computier/IT',
        'Kids',
        'Hobby/Sports',
        'Magazine'
      ],
      List<bool>.filled(12, false)),
];
