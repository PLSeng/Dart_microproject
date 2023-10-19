import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);
  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('First Page'),
        ),
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            TextButton(
              child: const Text(
                'Sign Up',
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                  fontSize: 48,
                ),
              ),
              onPressed: () {
                // TODO: Part 1
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SignUp1(),
                  ),
                );
              },
            ),
            TextButton(
              child: const Text(
                'Already have an account?',
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
              onPressed: () {
                // TODO: Part 4
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WelcomePage(),
                  ),
                );
              },
            ),
          ]),
        ));
  }
}

class SignUp1 extends StatelessWidget {
  const SignUp1({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up 1'),
        actions: [
          TextButton(
            child: const Text(
              'next',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              // TODO: Part 2
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SignUp2(),
                ),
              );
            },
          )
        ],
      ),
      body: _signUpBody('name'),
    );
  }
}

class SignUp2 extends StatelessWidget {
  const SignUp2({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up 2'),
        actions: [
          TextButton(
            child: const Text(
              'register',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              // TODO: Part 3
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => FirstPage(),
                  ),
                  (route) => false);
            },
          )
        ],
      ),
      body: _signUpBody('age'),
    );
  }
}

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Welcome Page'),
        ),
        body: const Center(child: Text('Hello!')));
  }
}

_signUpBody(String txt) {
  return Center(
      child: Padding(
    padding: const EdgeInsets.all(10),
    child: TextFormField(
      decoration: InputDecoration(
          labelText: txt,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(4.0)),
          )),
    ),
  ));
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FirstPage(),
    );
  }
}
