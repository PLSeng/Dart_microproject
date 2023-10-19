import 'package:flutter/material.dart';

class PracticeDraggable extends StatefulWidget {
  @override
  State<PracticeDraggable> createState() => _PracticeDraggableState();
}

class _PracticeDraggableState extends State<PracticeDraggable> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Draggable"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              // TODO : Part 1
              Draggable<int>(
                data: 1,
                feedback: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red,
                  ),
                ),
                childWhenDragging: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.green,
                  ),
                ),
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.yellow,
                  ),
                  child: Center(
                    child: Text("Drag this"),
                  ),
                ),
              ),
              // TODO : Part 2
              DragTarget(
                builder: (BuildContext context, List<dynamic> accepted,
                    List<dynamic> rejected) {
                  return Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                      color: Colors.lightBlueAccent,
                    ),
                    child: Center(
                      child: Text(
                        "Count: $count",
                      ),
                    ),
                  );
                },
                onAccept: (data) {
                  setState(() {
                    count += data as int;
                  });
                },
              ),
            ],
          ),
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
      home: PracticeDraggable(),
    );
  }
}
