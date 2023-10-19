import 'package:flutter/material.dart';

class FlexibleMP extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 100),
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: Row(
                children: <Widget>[
                  // TODO : part1
                  Flexible(
                    flex: 1,
                    fit: FlexFit.loose,
                    child: Container(
                      color: Colors.cyan,
                      width: 50,
                    ),
                  ),


                  // TODO : part2
                  Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: Container(
                      color: Colors.teal,
                      width: 50,
                    ),
                  ),


                  // TODO : part3
                  Flexible(
                    flex: 2,
                    child: Container(
                      color: Colors.indigo,
                      width: 500,
                    ),
                  ),


                ],
              ),
            ),
            const SizedBox(height: 200),
          ],
        ),
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
          title: const Text('Flexible with Varying Value'),
          centerTitle: true,
        ),
        body: ListView(children: [
          SizedBox(height: 600, child: FlexibleMP()),
        ]),
      ),
    );
  }
}