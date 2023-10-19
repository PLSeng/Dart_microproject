import 'package:flutter/material.dart';

class _MicrojectState extends State<Microject> {
  Future<void> part1() async {
    // TODO : Part 1
    Container(
      padding: EdgeInsets.only(left: 30, top: 20,),
      alignment: Alignment.centerLeft,
      child: Text(
          'Today'
      ),
    );
  }

  Widget part2() {
    // TODO : Part 2
    return Container(
      child: ReorderableListView(
        buildDefaultDragHandles: false,
        children: [
          for (int i = 0; i < name.length; i++)
            Card(
              elevation: 0,
              key: Key('$i'),
              child: Dismissible(
                key: Key('$i'),
                child: ListTile(
                  contentPadding: EdgeInsets.only(left: 50, right: 25),
                  title: Text('Number ${name[i]}'),
                  subtitle: Text("Sent an Email about the registration"),
                  trailing: ReorderableDragStartListener(index: i, child: Icon(Icons.drag_handle),),
                ),
              ),
            ),
        ],
        onReorder: (int oldIndex, int newIndex) {
          setState(() {
            if (oldIndex < newIndex) {
              newIndex--;
            }
            var nameVar = name.removeAt(oldIndex);
            name.insert(newIndex, nameVar);
          });
        },
      ),
    );
  }

  Widget buildTitle() {
    return Container(
        padding: const EdgeInsets.only(left: 30, top: 20),
        alignment: Alignment.centerLeft,
        child: const Text("Today"));
  }

  Widget buildListTile(IconData icon, String text) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.black,
      ),
      title: Text(text),
    );
  }

  var name = [
    "Team",
    "Firebase",
    "Mobbin",
    "Naver Team",
    "Figma",
    "Naver Team",
    "Figma"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: false,
          title: const Text(
            "Inbox",
            style: TextStyle(color: Colors.black),
          ),
          iconTheme: const IconThemeData(color: Colors.black),
        ),
        drawer: part2(),
        body: Container(
          color: Colors.white,
          child: Column(
            children: [
              buildTitle(),
              Expanded(
                  child: ListView(
                    padding: const EdgeInsets.only(top: 0, bottom: 0),
                    children: <Widget>[
                      for (int i = 0; i < name.length; i++)
                        Card(
                          elevation: 0,
                          key: Key('$i'),
                          child: Dismissible(
                            key: Key('$i'),
                            onDismissed: (direction) {
                              part1();
                            },
                            background: Container(
                              decoration: const BoxDecoration(
                                color: Colors.red,
                              ),
                              child: ListTile(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                trailing: const Icon(
                                  Icons.delete,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            child: ListTile(
                              contentPadding:
                              const EdgeInsets.only(left: 50, right: 25),
                              title: Text(
                                name[i],
                                style: const TextStyle(
                                    fontWeight: FontWeight.w700, fontSize: 16),
                              ),
                              subtitle: const Text(
                                  "Sent an Email about the registration"),
                            ),
                          ),
                        ),
                    ],
                  ))
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
      home: Microject(),
    );
  }
}

class Microject extends StatefulWidget {
  @override
  State<Microject> createState() => _MicrojectState();
}
