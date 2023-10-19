import 'package:flutter/material.dart';

class Microject extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  Widget part1(String text1, TextEditingController controller, bool isObscure) {
    // TODO : part1
    return Container(
      constraints: BoxConstraints(minWidth: double.infinity),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        ),
        obscureText: isObscure,
        validator: (String? value) {
          return value!.isEmpty ? text1 : null;
        },
      ),
    );
  }

  Widget part2(String text1) {
    // TODO : part2
    return Container(
      constraints: BoxConstraints(
        minWidth: double.infinity,
      ),
      height: 48,
      child: ElevatedButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {}
        },
        child: Text(
          text1,
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          primary: Color(0xff2196F3),
        ),
      ),
    );
  }

  Widget part3() {
    // TODO : part3
    return Form(
      key: _formKey,
      child: buildBody(),
    );
  }

  final TextEditingController idController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Registration',
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.w700, color: Colors.black),
          ),
          backgroundColor: Colors.white,
          centerTitle: false,
          elevation: 1,
        ),
        body: part3());
  }

  Widget buildBody() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(23, 18, 23, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('ID',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700)),
          const SizedBox(
            height: 10,
          ),
          part1('Enter a valid ID', idController, false),
          const SizedBox(
            height: 20,
          ),
          const Text('Password',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700)),
          const SizedBox(
            height: 10,
          ),
          part1('Enter a valid Password', passwordController, true),
          const SizedBox(
            height: 20,
          ),
          const Text('Name',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700)),
          const SizedBox(
            height: 10,
          ),
          part1('Enter a valid Name', nameController, false),
          const SizedBox(
            height: 26,
          ),
          part2('Register')
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
      home: Microject(),
    );
  }
}
