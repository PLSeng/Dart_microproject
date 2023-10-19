import 'package:flutter/material.dart';

class PracticeTabBanner extends StatefulWidget {
  @override
  State<PracticeTabBanner> createState() => _PracticeTabBannerState();
}

class _PracticeTabBannerState extends State<PracticeTabBanner>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  showMaterialBanner(String text, Icon icon) {
    //TODO: part 1
    return ScaffoldMessenger.of(context).showMaterialBanner(
      MaterialBanner(
        padding: EdgeInsets.all(20),
        elevation: 5,
        backgroundColor: Colors.lightBlue,
        leading: icon,
        content: Text(
          text,
        ),
        contentTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
        actions: [
          TextButton(
            onPressed: () {
              ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
            },
            child: Text(
              'Dismiss',
              style: TextStyle(
                color: Colors.amberAccent,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Which it is?',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.white,
          centerTitle: true,
          elevation: 1,
          //TODO: part 2
          bottom: TabBar(
            controller: _tabController,
            indicatorColor: Colors.lightBlue,
            labelColor: Colors.blue,
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(
                icon: Icon(
                  Icons.question_mark_outlined,
                  color: Colors.blue,
                ),
              ),
              Tab(
                icon: Icon(
                  Icons.question_mark_outlined,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        ),
        //TODO: part 3
        body: TabBarView(
          controller: _tabController,
          children: [
            Center(
              child: ElevatedButton(
                onPressed: () {
                  showMaterialBanner(
                    "This is Search Page",
                    const Icon(
                      Icons.search_outlined,
                      color: Colors.white,
                      size: 30,
                    ),
                  );
                },
                child: const Text("Show Material Banner"),
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  showMaterialBanner(
                    "This is Camera Page",
                    const Icon(
                      Icons.camera_alt_outlined,
                      color: Colors.white,
                      size: 30,
                    ),
                  );
                },
                child: const Text("Show Material Banner"),
              ),
            ),
          ],
        ));
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PracticeTabBanner(),
    );
  }
}
