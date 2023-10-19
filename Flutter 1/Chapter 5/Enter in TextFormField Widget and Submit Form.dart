import 'package:flutter/material.dart';

class TextFormFieldMpState extends State<TextFormFieldMP> {
  String textEmail = "Please Enter your Email";
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();


  Widget part1() {
    return SizedBox(
      // TODO : part1
      child: Form(
        key: _formKey,
        child: buildBody(),
      ),
    );
  }

  Widget part2() {
    return Text(
      textEmail,
      // TODO : part2
      style: TextStyle(
        fontSize: 20,
      )
    );
  }

  Widget part3() {
    return TextFormField(
      // TODO : part3
      controller: _emailController,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        hintText: 'ex) microlearnable@gmail.com',
        icon: Icon(Icons.email),
      ),
    );
  }

  Widget part4() {
    return IconButton(
      icon: const Icon(Icons.send),
      iconSize: 40,
      color: Colors.blue,
      onPressed: () {
        setState(() {
          // TODO : part4
          textEmail = _emailController.text;
          _emailController.clear();
        },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: part1(),
    );
  }

  Widget buildBody() {
    return Column(
      children: <Widget>[
        part2(),
        const SizedBox(
          height: 16.0,
        ),
        part3(),
        const SizedBox(
          height: 16.0,
        ),
        part4(),
      ],
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
          title: const Text('Text Form Field'),
          centerTitle: true,
        ),
        body: ListView(children: [
          SizedBox(height: 600, child: TextFormFieldMP()),
        ]),
      ),
    );
  }
}

class TextFormFieldMP extends StatefulWidget {
  @override
  TextFormFieldMpState createState() => TextFormFieldMpState();
}