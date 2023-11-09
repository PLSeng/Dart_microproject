import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class _AlarmPageState extends State<AlarmPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          // TODO: Part 2 - Instruction1
          itemCount: AlarmList.length,
          itemBuilder: (BuildContext context, int index) {
            return Slidable(
              key: ValueKey(0),
              startActionPane: ActionPane(
                motion: ScrollMotion(),
                // TODO: Part 2 - Instruction2
                dismissible: DismissiblePane(
                  onDismissed: () {
                    AlarmList.removeAt(index);
                  },
                ),
                children: [
                  // TODO: Part 2 - Instruction3
                  SlidableAction(
                    onPressed: null,
                    backgroundColor: Color(0xFFFE4A49),
                    foregroundColor: Colors.white,
                    icon: Icons.delete,
                    label: 'Delete',
                  ),
                ],
              ),
              child: alarmTile(index),
            );
          }),
      backgroundColor: Colors.white,
      appBar: appBar(context),
    );
  }

  Widget alarmTile(int index) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: ListTile(
            title: showTime(AlarmList[index].timeInfo),
            subtitle: Padding(
              padding: EdgeInsets.fromLTRB(3, 3, 0, 0),
              child: Text(
                AlarmList[index].repeat,
                style: TextStyle(fontSize: 12, color: Color(0xFF6D798E)),
              ),
            ),
            trailing: Switch(
                value: AlarmList[index].switchValue,
                // TODO: Part 2 - Instruction4
                activeColor: Colors.white,
                activeTrackColor: Color(0xFF7DA5F0),
                inactiveTrackColor: Color(0xFF9F9F9F),
                inactiveThumbColor: Colors.white,
                splashRadius: 90,
                onChanged: (value) {
                  setState(() {
                    AlarmList[index].switchValue = value;
                  });
                }),
          ),
        ),
        Divider(
          thickness: 1,
        )
      ],
    );
  }
}

class _CreateAlarmState extends State<CreateAlarm> {
  DateTime? timeInfo = DateTime.now();

  modalBottomSheet() {
    return showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Container(
                height: MediaQuery.of(context).size.height * 0.7,
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    bottomSheetTitle(),
                    weekDayCheckTile('Monday', setState),
                    // TODO: Part 1 - Instruction1
                    Text('Tuesday'),
                    Text('Wednesday'),
                    Text('Thursday'),
                    weekDayCheckTile('Monday', setState),
                    weekDayCheckTile('Monday', setState),
                    weekDayCheckTile('Monday', setState),
                    weekDayCheckTile('Friday', setState),
                    weekDayCheckTile('Saturday', setState),
                    weekDayCheckTile('Sunday', setState),
                    Expanded(child: Container()),
                  ],
                ),
              );
            },
          );
        });
  }

  Widget weekDayCheckTile(String weekDay, StateSetter setState) {
    return InkWell(
      child: Column(
        children: [
          Divider(
            thickness: 1,
            color: Color(0xFFE2E8F3),
          ),
          ListTile(
            title: Text(
              weekDay,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
            trailing: Checkbox(
                // TODO: Part 1 - Instruction2
                activeColor: Colors.transparent,
                checkColor: Color(0xFF5C8AE1),
                side: MaterialStateBorderSide.resolveWith(
                    (Set<MaterialState> states) {
                  return BorderSide.none;
                }),
                value: _weekCheck[weekDay],
                onChanged: (value) {
                  setState(() {
                    _weekCheck[weekDay] = value;
                  });
                }),
            dense: true,
            visualDensity: VisualDensity(vertical: -3),
          ),
        ],
      ),
      onTap: () {
        setState(() {
          _weekCheck[weekDay] = !_weekCheck[weekDay];
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Alarm",
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.w700, color: Colors.black),
          ),
          elevation: 1,
          backgroundColor: Colors.white,
          centerTitle: true,
          actions: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: TextButton(
                child: Text("Save",
                    style: TextStyle(fontSize: 15, color: Color(0xFF5C8AE1))),
                onPressed: () {
                  AlarmList.add(Alarm(timeInfo!, _weekCheck, weekText(), true));
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (BuildContext context) => AlarmPage(),
                    ),
                  );
                },
              ),
            ),
          ],
          leading: TextButton(
            child: Text("Cancel",
                style: TextStyle(fontSize: 12, color: Color(0xFF5C8AE1))),
            onPressed: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (BuildContext context) => AlarmPage(),
              ));
            },
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 20,
              ),
              hourMinute12H(),
              Container(
                height: 126,
                width: 329,
                decoration: BoxDecoration(
                  color: Color(0xFFEBF1FC),
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                child: Column(
                  children: [
                    settingTile("Repeat", "Alarm "),
                    Divider(
                      thickness: 1,
                      height: 0,
                    ),
                    settingTile("Label", "Alarm "),
                    Divider(
                      thickness: 1,
                      height: 0,
                    ),
                    settingTile("Sound", "Siren "),
                  ],
                ),
              ),
              SizedBox(
                height: 16,
              ),
              InkWell(
                child: Container(
                  height: 42,
                  width: 329,
                  decoration: BoxDecoration(
                    color: Color(0xFFEBF1FC),
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  child: Center(
                      child: Text(
                    "Delete Alarm",
                    style: TextStyle(color: Color(0xFFE84949)),
                  )),
                ),
                onTap: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (BuildContext context) => AlarmPage(),
                    ),
                  );
                },
              ),
            ],
          ),
        ));
  }

  Widget settingTile(String title, String tail) {
    return InkWell(
      child: ListTile(
        dense: true,
        visualDensity: VisualDensity(vertical: -2),
        title: Row(
          children: [
            Text(title,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400)),
            Expanded(child: Container()),
            Text(
              title == "Repeat" ? weekText() : tail,
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF6D798E)),
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 10,
            )
          ],
        ),
      ),
      onTap: () {
        title == "Repeat" ? modalBottomSheet() : null;
      },
    );
  }

  String weekText() {
    String? week = '';
    if (!_weekCheck.values.contains(false)) {
      week = 'Every day';
    } else if (!_weekCheck.values.contains(true)) {
      week = "Once";
    } else
      _weekCheck.forEach((k, v) => {
            v == true ? (week = week! + k.toString().substring(0, 3) + " ") : ''
          });
    return week!;
  }

  Widget bottomSheetTitle() {
    return ListTile(
      title: Center(child: Text('Repeat')),
      leading: TextButton(
          child: Text("Cancel"),
          onPressed: () {
            setState(() {});
            Navigator.pop(context);
          }),
      trailing: TextButton(
          child: Text("Save"),
          onPressed: () {
            setState(() {});
            Navigator.pop(context);
          }),
    );
  }

  final Map _weekCheck = {
    'Monday': false,
    'Tuesday': false,
    'Wednesday': false,
    'Thursday': false,
    'Friday': false,
    'Saturday': false,
    'Sunday': false,
  };

  Widget hourMinute12H() {
    return Container(
      height: MediaQuery.of(context).size.height / 4,
      width: 329,
      child: CupertinoTheme(
        data: CupertinoThemeData(
          barBackgroundColor: Colors.black,
          textTheme: CupertinoTextThemeData(
            dateTimePickerTextStyle: TextStyle(color: Color(0xFF5C8AE1)),
          ),
        ),
        child: CupertinoDatePicker(
          mode: CupertinoDatePickerMode.time,
          onDateTimeChanged: (value) {
            timeInfo = value;
          },
          use24hFormat: false,
          minuteInterval: 1,
          initialDateTime: DateTime.now(),
        ),
      ),
    );
  }
}

AppBar appBar(BuildContext context) {
  return AppBar(
    title: Text(
      "Alarm",
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: Colors.black,
      ),
    ),
    actions: [
      IconButton(
          icon: Icon(
            Icons.add,
            color: Colors.black,
            size: 18,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CreateAlarm(),
              ),
            );
          }),
    ],
    automaticallyImplyLeading: false,
    centerTitle: false,
    elevation: 1,
    backgroundColor: Colors.white,
  );
}

Widget showTime(DateTime dateTime) {
  String format = "";
  int hour = 0;
  int min = dateTime.minute;

  if (dateTime.hour == 0) {
    hour = dateTime.hour + 12;
    format = "AM";
  } else if (dateTime.hour == 12) {
    format = "PM";
  } else if (dateTime.hour > 12) {
    hour = dateTime.hour - 12;
    format = "PM";
  } else {
    hour = dateTime.hour;
    format = "AM";
  }
  return Row(
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      Text(
          "${hour.toString().padLeft(2, '0')}:${min.toString().padLeft(2, '0')} ",
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.w400)),
      Padding(
        padding: EdgeInsets.only(bottom: 5.0),
        child: Text(
          "${format}",
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.w400),
        ),
      ),
    ],
  );
}

class AlarmPage extends StatefulWidget {
  AlarmPage({Key? key}) : super(key: key);

  @override
  State<AlarmPage> createState() => _AlarmPageState();
}

class CreateAlarm extends StatefulWidget {
  @override
  State<CreateAlarm> createState() => _CreateAlarmState();
}

class Alarm {
  DateTime timeInfo;
  Map week = {
    'Monday': false,
    'Tuesday': false,
    'Wednesday': false,
    'Thursday': false,
    'Friday': false,
    'Saturday': false,
    'Sunday': false,
  };
  String repeat;
  bool switchValue;

  Alarm(this.timeInfo, this.week, this.repeat, this.switchValue);
}

List<Alarm> AlarmList = [
  Alarm(
      DateTime.parse("2022-11-13 09:00:00.000"),
      {
        'Monday': false,
        'Tuesday': false,
        'Wednesday': false,
        'Thursday': false,
        'Friday': false,
        'Saturday': false,
        'Sunday': false,
      },
      "Once",
      true),
  Alarm(
      DateTime.parse("2022-11-13 19:30:00.000"),
      {
        'Monday': false,
        'Tuesday': false,
        'Wednesday': true,
        'Thursday': false,
        'Friday': false,
        'Saturday': false,
        'Sunday': true,
      },
      "Wed Sun",
      false),
  Alarm(
      DateTime.parse("2022-11-13 07:30:00.000"),
      {
        'Monday': false,
        'Tuesday': false,
        'Wednesday': true,
        'Thursday': true,
        'Friday': true,
        'Saturday': false,
        'Sunday': true,
      },
      "Wed Thr Fri Sun",
      true),
];

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CreateAlarm(),
    );
  }
}
