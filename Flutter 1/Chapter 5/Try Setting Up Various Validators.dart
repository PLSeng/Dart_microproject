import 'package:flutter/material.dart';

class ValidatorMpState extends State<ValidatorMP> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  final emailRegExp = RegExp(
    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
  );
  final passwordRegExp = RegExp(
    r'/(?=.\d)(?=.[a-z]).{8,}',
  );

  String text = "Check your validation";

  Widget part1() {
    return TextFormField(
      decoration: const InputDecoration(
        hintText: 'Write your name',
        icon: Icon(Icons.account_circle),
      ),
      // TODO: part 1
      controller: _nameController,
      validator: (String? value) {
        return value!.isEmpty ? 'Write your name' : null;
      },
    );
  }

  Widget part2() {
    return TextFormField(
      decoration: const InputDecoration(
        hintText: 'Write your age',
        icon: Icon(Icons.tag),
      ),
      // TODO : part2
      controller: _ageController,
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'Write your age';
        } else if (num.tryParse(value) == null) {
          return 'Write your age as number';
        } else {
          return null;
        }
      },
    );
  }

  Widget part3() {
    return TextFormField(
      decoration: const InputDecoration(
        hintText: 'Write your email',
        icon: Icon(Icons.email),
      ),
      // TODO : part3
      controller: _emailController,
      validator: (String? value) {
        return !emailRegExp.hasMatch(value!) ? 'Wrong email form' : null;
      },
    );
  }

  Widget part4() {
    return TextFormField(
      decoration: const InputDecoration(
        hintText: 'Write your password',
        icon: Icon(Icons.lock),
      ),
      // TODO : part4
      controller: _passwordController,
      obscureText: true,
      validator: (String? value) {
        return !passwordRegExp.hasMatch(value!)
            ? 'Write least one upper, lower case, and digit'
            : null;
      },
    );
  }

  Widget part5() {
    return TextFormField(
      decoration: const InputDecoration(
        hintText: 'Write your password again',
        icon: Icon(Icons.check),
      ),
      // TODO : part5
      controller: _confirmPasswordController,
      obscureText: true,
      validator: (String? value) {
        return !RegExp(r'^(?=.?[A-Z])(?=.?[a-z])(?=.*?[0-9]).{8,}$')
                .hasMatch(value!)
            ? 'Check your confirm password'
            : null;
      },
    );
  }

  Widget part6() {
    return IconButton(
      icon: const Icon(Icons.send),
      iconSize: 40,
      color: Colors.blue,
      onPressed: () {
        // TODO : part6
        if (_formKey.currentState!.validate()) {
          setState(() {
            text = "Well Done!";
          });
        }
        ;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32.0),
      child: buildBody(),
    );
  }

  Widget buildBody() {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Text(
            text,
            style: const TextStyle(fontSize: 25),
          ),
          part1(),
          part2(),
          part3(),
          part4(),
          part5(),
          part6(),
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
          title: const Text('Practice Validator'),
          centerTitle: true,
        ),
        body: ListView(children: [
          SizedBox(height: 600, child: ValidatorMP()),
        ]),
      ),
    );
  }
}

class ValidatorMP extends StatefulWidget {
  @override
  ValidatorMpState createState() => ValidatorMpState();
}
