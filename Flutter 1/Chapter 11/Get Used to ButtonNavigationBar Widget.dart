import 'package:flutter/material.dart';

class PracticeDrawer extends StatefulWidget {
  @override
  State<PracticeDrawer> createState() => _PracticeDrawerState();
}

class _PracticeDrawerState extends State<PracticeDrawer> {
  int _selectedIndex = 1;

  static const List<Widget> _buildBody = <Widget>[
    BodyPage(title: 'Sell Page'),
    BodyPage(title: 'Home Page'),
    BodyPage(title: 'Profile Page'),
  ];

  Widget bottomNavBar() {
    return SizedBox(
      //TODO: part 1
      child: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.text_snippet),
            label: 'Sell',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.lightBlue,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Practice Bottom Navigation Bar',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 600,
            child: _buildBody.elementAt(_selectedIndex),
          ),
        ],
      ),
      bottomNavigationBar: bottomNavBar(),
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

class BodyPage extends StatelessWidget {
  final String title;
  const BodyPage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('This is Get Used to BottomNavigationBar Widget'),
    );
  }
}
