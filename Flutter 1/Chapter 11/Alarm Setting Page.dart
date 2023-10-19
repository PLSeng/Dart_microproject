import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class _MicrojectState extends State<Microject> {
  void part1() {
    // TODO : Part 1
    ScaffoldMessenger.of(context).showMaterialBanner(
      MaterialBanner(
        padding: const EdgeInsets.all(20),
        elevation: 5,
        content: const Text('Set the watch before using the service'),
        backgroundColor: Colors.white,
        actions: [
          TextButton(
            onPressed: () {
              ScaffoldMessenger.of(context).removeCurrentMaterialBanner();
            },
            child: const Text(
              'look around',
              style: TextStyle(
                color: Colors.blue,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              ScaffoldMessenger.of(context).removeCurrentMaterialBanner();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SetAlarmScreen(
                    showDialog: part2,
                  ),
                ),
              );
            },
            child: const Text(
              'Go set',
              style: TextStyle(
                color: Colors.blue,
              ),
            ),
          ),
        ],
      ),
    );
  }

  part2() {
    // TODO : Part 2
    showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: const Text(
            'Please save to apply changes',
          ),
          content: const Text(
            'Unsaved data of the alarm will be lost',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                'cancel',
                style: TextStyle(
                  color: Color(0xFFAEAEAE),
                  fontSize: 15,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: const Text(
                'exit',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 15,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  final List<Alarm> _alarms = [
    Alarm(const TimeOfDay(hour: 5, minute: 29), DateTime.utc(2022, 7, 18), true,
        true, true),
    Alarm(const TimeOfDay(hour: 5, minute: 29), DateTime.utc(2022, 7, 18),
        false, false, false),
    Alarm(const TimeOfDay(hour: 17, minute: 29), DateTime.utc(2022, 7, 18),
        true, true, false),
    Alarm(const TimeOfDay(hour: 17, minute: 29), DateTime.utc(2022, 7, 18),
        false, false, true),
  ];
  var weekDayType = ['', 'Mon', 'Tue', 'Web', 'Thu', 'Fri', 'Sat', 'Sun'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Watch',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w700, color: Colors.black),
        ),
        centerTitle: false,
        backgroundColor: Colors.white,
        actions: [
          TextButton(
              onPressed: () {
                part1();
              },
              child: const Text(
                'add',
                style: TextStyle(color: Colors.blue),
              ))
        ],
      ),
      body: ListView.builder(
          itemCount: _alarms.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(22, 20, 22, 0),
              child: Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Container(
                  height: 63,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${_alarms[index].time.period.name} ${_alarms[index].time.hour}:${_alarms[index].time.minute}',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: _alarms[index].isOn
                                ? Colors.black
                                : const Color(0xFFBCBABA)),
                      ),
                      Text(
                        '${_alarms[index].date.month}/${_alarms[index].date.day} ${weekDayType[_alarms[index].date.weekday]}',
                        style: TextStyle(
                            fontSize: 14,
                            color: _alarms[index].isOn
                                ? Colors.black
                                : const Color(0xFFBCBABA)),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.alarm),
            label: 'Alarm',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.language),
            label: 'World Time',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.timer),
            label: 'Timer',
          ),
        ],
        currentIndex: 0,
        backgroundColor: Colors.white,
        unselectedIconTheme: const IconThemeData(color: Color(0xFFAEAEAE)),
        selectedItemColor: Colors.blue,
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
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Microject(),
    );
  }
}

class Microject extends StatefulWidget {
  const Microject({Key? key}) : super(key: key);

  @override
  State<Microject> createState() => _MicrojectState();
}

class SetAlarmScreen extends StatefulWidget {
  const SetAlarmScreen({Key? key, required this.showDialog}) : super(key: key);
  final Function() showDialog;

  @override
  State<SetAlarmScreen> createState() => _SetAlarmScreenState();
}

class _SetAlarmScreenState extends State<SetAlarmScreen> {
  final Alarm _setAlarm =
      Alarm(TimeOfDay.now(), DateTime.now(), false, false, true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text(
          'Alarm',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        elevation: 1,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(
            Icons.keyboard_backspace,
            color: Colors.black,
          ),
          onPressed: () {
            widget.showDialog();
          },
        ),
        actions: [
          TextButton(
              onPressed: () {},
              child: const Text(
                'save',
                style: TextStyle(color: Colors.blue),
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Padding(
                        padding: EdgeInsets.only(bottom: 20.0),
                        child: Text('Date',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18))),
                    buildDatePicker(
                        text:
                            "${_setAlarm.date.year}-${_setAlarm.date.month}-${_setAlarm.date.day}")
                  ],
                ),
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Padding(
                        padding: EdgeInsets.only(bottom: 20.0),
                        child: Text('Time',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18))),
                    // Time Picker
                    buildTimePicker(
                        text:
                            "${_setAlarm.time.hour}:${_setAlarm.time.minute} ${_setAlarm.time.period.name}")
                  ],
                ),
              ],
            ),
            const Padding(
                padding: EdgeInsets.only(top: 30.0, bottom: 10.0),
                child: Text('Volume',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18))),
            SliderTheme(
              data: SliderThemeData(
                activeTrackColor: Colors.blueAccent,
                inactiveTrackColor: const Color(0xFFEBEBEB),
                thumbColor: Colors.white,
                thumbShape: const RoundSliderThumbShape(
                    enabledThumbRadius: 10, elevation: 3, pressedElevation: 10),
                valueIndicatorShape:
                    const RectangularSliderValueIndicatorShape(),
                overlayShape: SliderComponentShape.noOverlay,
              ),
              child: Slider(
                value: _setAlarm.volume,
                min: 0.0,
                max: 100.0,
                divisions: 100,
                label: '${_setAlarm.volume.round()}',
                onChanged: (double newValue) {
                  setState(() {
                    _setAlarm.volume = newValue;
                  });
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            buildSwitch(text: 'Vibration', isSwitch: _setAlarm.vibration),
            buildSwitch(text: 'Repetition', isSwitch: _setAlarm.repetition),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.alarm),
            label: 'Alarm',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.language),
            label: 'World Time',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.timer),
            label: 'Timer',
          ),
        ],
        currentIndex: 0,
        backgroundColor: Colors.white,
        unselectedIconTheme: const IconThemeData(color: Color(0xFFAEAEAE)),
        selectedItemColor: Colors.blue,
      ),
    );
  }

  Widget buildDatePicker({required String text}) {
    return SizedBox(
      height: 45,
      width: 140,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
            side: const BorderSide(width: 1, color: Colors.black26),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
        onPressed: () async {
          DateTime? selectedDate = await showDatePicker(
            context: context,
            initialDate: _setAlarm.date,
            firstDate: DateTime(2020),
            lastDate: DateTime(2030),
          );
          setState(() {
            _setAlarm.date = selectedDate!;
          });
        },
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            text,
            style: const TextStyle(color: Colors.black45),
          ),
        ),
      ),
    );
  }

  Widget buildTimePicker({required String text}) {
    return SizedBox(
      height: 45,
      width: 140,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
            side: const BorderSide(width: 1, color: Colors.black26),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
        onPressed: () async {
          TimeOfDay? selectedTime = await showTimePicker(
              context: context, initialTime: _setAlarm.time);
          setState(() {
            _setAlarm.time = selectedTime!;
          });
        },
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            text,
            style: const TextStyle(color: Colors.black45),
          ),
        ),
      ),
    );
  }

  Widget buildSwitch({required String text, required bool isSwitch}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text,
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          Switch(
              value: text == 'Vibration'
                  ? _setAlarm.vibration
                  : _setAlarm.repetition,
              onChanged: (value) {
                setState(() {
                  text == 'Vibration'
                      ? _setAlarm.vibration = value
                      : _setAlarm.repetition = value;
                });
              })
        ],
      ),
    );
  }
}

class Alarm {
  late TimeOfDay time;
  late DateTime date;
  late bool vibration;
  late bool repetition;
  late bool isOn;
  double volume = 35;

  Alarm(this.time, this.date, this.vibration, this.repetition, this.isOn);
}
