import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:async';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static final ValueNotifier<ThemeMode> themeNotifier =
      ValueNotifier(ThemeMode.light);

  @override
  Widget build(BuildContext context) {
    //TODO: Part1
    return ValueListenableBuilder(
      valueListenable: themeNotifier,
      builder: (_, ThemeMode currentMode, __) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: currentMode,
          theme: ThemeData(
            dividerTheme: DividerThemeData(
              color: Color(0xff3D3C41),
              indent: 14,
              endIndent: 14,
            ),
            scaffoldBackgroundColor: Color(0xffF2F1F6),
            brightness: Brightness.light,
            floatingActionButtonTheme: FloatingActionButtonThemeData(
                backgroundColor: Color(0xFF36A7F4)),
            appBarTheme: AppBarTheme(
              color: Colors.white,
              elevation: 0,
              iconTheme: IconThemeData(color: Color(0xff36A7F4)),
              titleTextStyle: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 20,
                color: Colors.black,
              ),
            ),
          ),
          darkTheme: ThemeData(
            dividerTheme: DividerThemeData(
              color: Color(0xffBCBCBC),
              indent: 14,
              endIndent: 14,
            ),
            scaffoldBackgroundColor: Color(0xff373737),
            brightness: Brightness.dark,
            floatingActionButtonTheme: FloatingActionButtonThemeData(),
            appBarTheme: AppBarTheme(
              color: Color(0xff252525),
              elevation: 0,
              iconTheme: IconThemeData(color: Color(0xff5DCEB5)),
            ),
          ),
          home: HomePage(),
        );
      },
    );
  }
}

//TODO: Part3
textStyleButtonStyle() {
  ElevatedButton.styleFrom(
    fixedSize: Size(60, 60),
    shape: CircleBorder(),
    backgroundColor: strikeThrough
        ? darkTheme
            ? Color(0xff5DCEB5)
            : Colors.blue
        : Colors.grey,
  );
}

//TODO: Part4
addButtonStyle() {
  OutlinedButton.styleFrom(
    side: BorderSide(
      color: temp.isEmpty
          ? Colors.grey
          : darkTheme
              ? Color(0xff5DCEB5)
              : Colors.blue,
    ),
  );
}

//TODO: Part5
void setCurrentStyle() {
  TextStyle(
    color: darkTheme ? Colors.white : Colors.black,
    fontSize: 20,
    fontWeight: bold ? FontWeight.bold : FontWeight.normal,
    fontStyle: italic ? FontStyle.italic : FontStyle.normal,
    decoration: underline
        ? TextDecoration.underline
        : strikeThrough
            ? TextDecoration.lineThrough
            : TextDecoration.none,
  );
}

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
//TODO: Part2
  Widget Part2() {
    return IconButton(
      onPressed: () {
        setState(() {
          darkTheme = !darkTheme;
          MyApp.themeNotifier.value =
              MyApp.themeNotifier.value == ThemeMode.light
                  ? ThemeMode.dark
                  : ThemeMode.light;
        });
      },
      icon: Icon(darkTheme ? Icons.sunny : Icons.nightlight,
          color: darkTheme ? Colors.white : Colors.black),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MEMO'),
        actions: [
          Part2(),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        width: 119,
        child: FloatingActionButton.extended(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          label: const Text(
            'ADD',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
          ),
          onPressed: () {
            Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const WritePage()),
            );
          },
        ),
      ),
      body: Column(children: [
        Container(
            padding: const EdgeInsets.only(left: 38, top: 11, bottom: 12),
            alignment: Alignment.centerLeft,
            child: const Text(
              'All',
              style: TextStyle(fontSize: 18),
            )),
        Expanded(
          child: Container(
            constraints: BoxConstraints(
              minHeight: 100,
              maxHeight: 1000,
            ),
            decoration: BoxDecoration(
              color: darkTheme ? const Color(0xff1E1E1E) : Colors.white,
              borderRadius: const BorderRadius.all(
                Radius.circular(13),
              ),
            ),
            margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
            child: ListView.builder(
              itemCount: myMemos.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    ListTile(
                      contentPadding:
                          EdgeInsets.only(top: 8, left: 22, right: 22),
                      title: Text(myMemos[index].title),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 3),
                          Text(
                            myMemos[index]
                                .todoList[0]
                                .toString()
                                .replaceAll("[", '')
                                .replaceAll("]", ''),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(myMemos[index].date),
                        ],
                      ),
                      onTap: () {},
                    ),
                    const Divider()
                  ],
                );
              },
            ),
          ),
        ),
        SizedBox(
          height: 100,
        )
      ]),
    );
  }
}

//------------------------------------------------------------------------------

class WritePage extends StatefulWidget {
  const WritePage({super.key});

  @override
  State<WritePage> createState() => _WritePageState();
}

class _WritePageState extends State<WritePage> {
  String date1 =
      DateFormat('MMMM d, yyyy kk:mm').add_jm().format(DateTime.now());
  String date2 = DateFormat('yyyy.MM.dd').format(DateTime.now());

  Memo myMemo = Memo();

  final titleController = TextEditingController();
  final contentController = TextEditingController();

  List<String> todoList = [];
  List<TextStyle> styleList = [];
  int cnt = 0;

  Color buttonColor = darkTheme ? Color(0xff5DCEB5) : Color(0xff36A7F4);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              IconButton(
                icon: Icon(Icons.arrow_back,
                    color: darkTheme
                        ? const Color(0xff5DCEB5)
                        : Color(0xff36A7F4)),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
              ),
              const Spacer(),
              TextButton(
                child: Text(
                  'SAVE',
                  style: TextStyle(
                      color: darkTheme
                          ? const Color(0xff5DCEB5)
                          : Color(0xff36A7F4)),
                ),
                onPressed: () {
                  //save the text
                  print(titleController.text);
                  myMemo.title = titleController.text;
                  myMemo.todoList.add(todoList);
                  print(myMemo.todoList);
                  myMemo.todoListStyle.add(styleList);
                  myMemo.date = date2;
                  myMemos.add(myMemo);
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
              ),
              const SizedBox(
                width: 10,
              ),
            ],
          ),
          Text(
            date1,
            style: TextStyle(
              color:
                  darkTheme ? const Color(0xffB4B4B4) : const Color(0xff7D7D7D),
              fontSize: 11,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 18),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  myMemo.title = value;
                });
              },
              controller: titleController,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800),
              // currentStyle,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color:
                        darkTheme ? const Color(0xff5DCEB5) : Color(0xff36A7F4),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color:
                        darkTheme ? const Color(0xff5DCEB5) : Color(0xff36A7F4),
                  ),
                ),
                hintText: "Title",
                border: myMemo.title.isEmpty
                    ? const OutlineInputBorder()
                    : InputBorder.none,
              ),
            ),
          ),
          Container(
            constraints: BoxConstraints(maxHeight: 300),
            child: ListView.builder(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              shrinkWrap: true,
              itemCount: todoList.length,
              itemBuilder: (context, index) {
                return SizedBox(
                  child: ListTile(
                    title: Text(todoList[index], style: styleList[index]),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
            child: Container(
              // height: 50,
              child: TextField(
                controller: contentController,
                onChanged: (value) {
                  setState(() {
                    temp = value;
                  });
                },
                style: currentStyle,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: darkTheme
                          ? const Color(0xff5DCEB5)
                          : Color(0xff36A7F4),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: darkTheme
                          ? const Color(0xff5DCEB5)
                          : Color(0xff36A7F4),
                    ),
                  ),
                  hintText: "content",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ),
          OutlinedButton(
              style: addButtonStyle(),
              onPressed: () {
                setState(() {
                  todoList.add(contentController.text);
                  styleList.add(currentStyle);
                  contentController.clear();
                });
              },
              child: Icon(Icons.add,
                  color: temp.isEmpty
                      ? Colors.grey
                      : darkTheme
                          ? Color(0xff5DCEB5)
                          : Color(0xff36A7F4))),
          const Spacer(),
          Container(
            height: 154,
            child: Column(
              children: [
                const Divider(
                  endIndent: 0,
                  indent: 0,
                ),
                Container(
                    margin:
                        const EdgeInsets.only(left: 20, top: 12, bottom: 10),
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      'Text style',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    //bold
                    ElevatedButton(
                      style: textStyleButtonStyle(),
                      onPressed: () {
                        setState(() {
                          bold = !bold;
                          setCurrentStyle();
                        });
                        setCurrentStyle();
                      },
                      child: const Icon(
                        Icons.format_bold,
                        size: 30,
                      ),
                    ),
                    ElevatedButton(
                      style: textStyleButtonStyle(),
                      onPressed: () {
                        setState(() {
                          italic = !italic;
                          setCurrentStyle();
                        });
                      },
                      child: const Icon(Icons.format_italic, size: 30),
                    ),
                    ElevatedButton(
                      style: textStyleButtonStyle(),
                      onPressed: () {
                        setState(() {
                          strikeThrough = false;
                          underline = !underline;
                          setCurrentStyle();
                        });
                      },
                      child: const Icon(Icons.format_underlined, size: 30),
                    ),
                    ElevatedButton(
                      style: textStyleButtonStyle(),
                      onPressed: () {
                        setState(() {
                          underline = false;
                          strikeThrough = !strikeThrough;
                          setCurrentStyle();
                        });
                      },
                      child: const Icon(
                        Icons.strikethrough_s,
                        size: 30,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

bool darkTheme = false;

class Memo {
  String title = '';
  List<List<String>> todoList = [];
  List<List<TextStyle>> todoListStyle = [];
  String date = '';
}

List<Memo> myMemos = [];
String temp = '';
TextStyle currentStyle = const TextStyle();

bool bold = false;
bool italic = false;
bool underline = false;
bool strikeThrough = false;
