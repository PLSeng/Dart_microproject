import 'package:flutter/material.dart';

class PracticeDrawer extends StatefulWidget {
  @override
  State<PracticeDrawer> createState() => _PracticeDrawerState();
}

class _PracticeDrawerState extends State<PracticeDrawer> {
  Widget drawer() {
    return SizedBox(
      // TODO: part 1
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.only(
            top: 0,
          ),
          // TODO: part 2
          children: [
            DrawerHeader(
              child: Center(
                child: Row(
                  children: [
                    Expanded(
                      child: Icon(
                        Icons.account_circle,
                        color: Colors.white,
                        size: 40,
                      ),
                      flex: 2,
                    ),
                    Expanded(
                      child: Text(
                        "MicroLearnable",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      flex: 6,
                    ),
                  ],
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            // TODO: part 3
            customListTile(
              "Home",
              Icon(
                Icons.home,
              ),
            ),
            customListTile(
              "Profile",
              Icon(
                Icons.account_circle,
              ),
            ),
            customListTile(
              "Contact",
              Icon(
                Icons.contact_page,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget customListTile(String text, Icon icon) {
    return Column(
      children: [
        ListTile(
          title: Text(text),
          leading: icon,
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
        const Divider(
          color: Colors.grey,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Practice Drawer',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
        elevation: 1,
      ),
      body: ListView(
        children: const [
          SizedBox(
            height: 600,
            child: Center(
              child: Text("This is Body"),
            ),
          ),
        ],
      ),
      drawer: drawer(),
    );
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
      home: PracticeDrawer(),
    );
  }
}
