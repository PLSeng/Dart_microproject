import 'package:flutter/material.dart';

class PracticeST extends StatefulWidget {
  @override
  State<PracticeST> createState() => _PracticeSTState();
}

class _PracticeSTState extends State<PracticeST> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // TODO: part 1
          Tooltip(
            message: "Press to show Snackbar",
            height: 30,
            padding: EdgeInsets.all(8),
            child: ElevatedButton(
              child: Text(
                "Show Snackbar",
              ),
              // TODO: part 2
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      "Hi! I'm snackbar",
                      style: TextStyle(fontSize: 16),
                    ),
                    padding: EdgeInsets.all(10),
                    elevation: 10,
                    backgroundColor: Colors.lightBlue,
                    behavior: SnackBarBehavior.floating,
                    shape: StadiumBorder(),
                    action: SnackBarAction(
                      label: "Dismiss",
                      textColor: Colors.grey[400],
                      onPressed: () {},
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
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
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Practice Snackbar & Tooltip',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.white,
          centerTitle: true,
          elevation: 1,
        ),
        body: ListView(
          children: [
            SizedBox(
              height: 600,
              child: PracticeST(),
            ),
          ],
        ),
      ),
    );
  }
}
