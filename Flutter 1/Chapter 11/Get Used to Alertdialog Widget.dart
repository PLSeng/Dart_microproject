import 'package:flutter/material.dart';

class PracticeAlertDialog extends StatefulWidget {
  @override
  State<PracticeAlertDialog> createState() => _PracticeAlertDialogState();
}

class _PracticeAlertDialogState extends State<PracticeAlertDialog> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          // TODO: part 1
          showDialog(
            context: context,
            barrierDismissible: true,
            builder: (BuildContext context) {
              return alertDialog();
            },
          );
        },
        child: const Text("Press to show dialog"),
      ),
    );
  }

  Widget alertDialog() {
    return SizedBox(
      // TODO: part 2
      child: AlertDialog(
        title: const Text("Your Name"),
        content: const TextField(
          decoration: InputDecoration(
            hintText: "Enter your name",
          ),
        ),
        // TODO: part 3
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text("SUBMIT"),
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
            'Practice AlertDialog',
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
              child: PracticeAlertDialog(),
            ),
          ],
        ),
      ),
    );
  }
}
