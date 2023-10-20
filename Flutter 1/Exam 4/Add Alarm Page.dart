import 'package:flutter/material.dart';

class AlarmPage extends StatefulWidget {
  const AlarmPage({Key? key}) : super(key: key);
  @override
  State<AlarmPage> createState() => _AlarmPageState();
}

class _AlarmPageState extends State<AlarmPage> {
  int _selected = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white),
      body: _selected == 0
          ? SizedBox(
              child: ListView.builder(
                  itemCount: alarmList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: alarmList[index].isActive
                                  ? [
                                      const Color(0xffA4D7FF),
                                      const Color(0xff0992FF)
                                    ]
                                  : [Colors.white, Colors.white]),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.grey,
                                blurRadius: 5,
                                offset: Offset(0, 5))
                          ]),
                      height: 132,
                      margin: const EdgeInsets.fromLTRB(32, 32, 32, 0),
                      padding: const EdgeInsets.fromLTRB(24, 24, 0, 0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // TODO : Part 1
                            Text(
                              alarmList[index].name,
                              style: TextStyle(
                                color: alarmList[index].isActive
                                    ? Colors.white
                                    : Colors.grey,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // TODO : Part 2
                                Text(
                                  alarmList[index].time,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: alarmList[index].isActive
                                        ? Colors.white
                                        : Colors.grey,
                                  ),
                                ),
                                SizedBox(
                                  width: 112,
                                ),
                                Switch(
                                  value: alarmList[index].isActive,
                                  onChanged: (bool value) {
                                    setState(() {
                                      alarmList[index].isActive = value;
                                    });
                                  },
                                  activeColor: Colors.white,
                                ),
                              ],
                            ),
                            Row(
                              children: List.generate(days.length, (idx) {
                                return Text('${days[idx]}  ',
                                    style: TextStyle(
                                        color: alarmList[index].isActive
                                            ? alarmList[index].day[idx]
                                                ? Colors.white
                                                : Colors.transparent
                                            : alarmList[index].day[idx]
                                                ? Colors.grey
                                                : Colors.white));
                              }),
                            )
                          ]),
                    );
                  }))
          : Container(),
      // TODO : Part 3
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selected,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.alarm),
            label: 'Alarm',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.public),
            label: 'World Time',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.timer),
            label: 'Timer',
          ),
        ],
        onTap: (int index) {
          setState(() {
            _selected = index;
          });
        },
      ),

      floatingActionButton: _selected == 0
          ? FloatingActionButton(
              onPressed: () {
                // TODO : Part 4
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AddAlarmPage()));
              },
              child: const Icon(Icons.add),
            )
          : null,
    );
  }
}

class AddAlarmPage extends StatefulWidget {
  const AddAlarmPage({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _AddAlarmPageState();
}

class _AddAlarmPageState extends State<AddAlarmPage> {
  Alarm alarm = Alarm('', '', List.generate(7, (index) => false), true);
  TextEditingController nameController = TextEditingController();
  TextEditingController timeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add Alarm',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              // TODO : Part 5
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    actionsAlignment: MainAxisAlignment.spaceEvenly,
                    title: dialogTitle(),
                    content: dialogContent(),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text(
                          'cancel',
                          style: TextStyle(
                            color: Colors.blue,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                        child: Text(
                          "exit",
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    ],
                  );
                },
                barrierDismissible: false,
              );
            },
            icon: const Icon(Icons.arrow_back, color: Colors.black)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _title('Name'),
            _input(nameController),
            _title('Time'),
            _input(timeController),
            _title('Day'),
            selectDay(),
            const Spacer(),
            SizedBox(
              height: 40,
              width: double.infinity,
              // TODO : Part 6
              child: Tooltip(
                message: 'Save the alarm',
                child: ElevatedButton(
                  onPressed: () {
                    addAlarm();
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => AlarmPage()),
                        (route) => false);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('New alarm added!'),
                      ),
                    );
                  },
                  child: Text('Save'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _title(String title) {
    return SizedBox(
      height: 28,
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _input(TextEditingController controller) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 4, 0, 12),
      height: 40,
      child: TextFormField(
        controller: controller,
        decoration: const InputDecoration(
            contentPadding: EdgeInsets.only(left: 10),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
            )),
      ),
    );
  }

  Widget selectDay() {
    return ToggleButtons(
      constraints: const BoxConstraints.expand(
        height: 28,
        width: 44,
      ),
      isSelected: alarm.day,
      children: List<Widget>.generate(days.length, (idx) {
        return Text(
          days[idx],
          style: TextStyle(
            color: alarm.day[idx] ? Colors.blue : Colors.grey,
          ),
        );
      }),
      onPressed: (int idx) {
        setState(() {
          alarm.day[idx] = !alarm.day[idx];
        });
      },
    );
  }

  Widget dialogTitle() {
    return Text("Please save to add alarm", textAlign: TextAlign.center);
  }

  Widget dialogContent() {
    return Text("Unsaved alarm will be automatically erased.",
        textAlign: TextAlign.center);
  }

  void addAlarm() {
    alarm.name = nameController.text;
    alarm.time = timeController.text;
    setState(() {
      alarmList.add(alarm);
    });
  }
}

class Alarm {
  String name;
  String time;
  List<bool> day;
  bool isActive;

  Alarm(this.name, this.time, this.day, this.isActive);
}

List<String> days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
List<Alarm> alarmList = [
  Alarm('Breakfast', '09:25 AM', [true, true, true, true, true, false, false],
      true),
];

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: AlarmPage());
  }
}
