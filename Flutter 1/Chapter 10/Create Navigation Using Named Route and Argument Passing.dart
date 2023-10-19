import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // TODO : Part 1
      initialRoute: '/',
      routes: {
        '/': (context) => FirstPage(),
        '/signUp': (context) => SignUp(),
        '/welcome': (context) => WelcomePage(),
      },
      onGenerateRoute: (settings) {},
    );
  }
}

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
            ElevatedButton(
              child: const Text(
                'Sign Up',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 48,
                ),
              ),
              onPressed: () {
                // TODO : Part 2
                Navigator.pushNamed(
                  context,
                  '/signUp',
                );
              },
            ),
          ]),
        ));
  }
}

class SignUp extends StatelessWidget {
  SignUp({Key? key}) : super(key: key);
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
        actions: [
          TextButton(
            child: const Text('next', style: TextStyle(color: Colors.white)),
            onPressed: () {
              // TODO : Part 3
              Navigator.pushNamed(
                context,
                '/welcome',
                arguments: User(nameController.text, emailController.text)
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              const SizedBox(height: 100),
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(
                    labelText: 'name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4.0)),
                    )),
              ),
              const SizedBox(height: 30),
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                    labelText: 'email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4.0)),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO : Part 4
    var args;
    args = ModalRoute.of(context)!.settings.arguments as User;

    return Scaffold(
        appBar: AppBar(
          title: const Text('Welcome Page'),
          actions: [
            TextButton(
              child: const Text('next', style: TextStyle(color: Colors.white)),
              onPressed: () {
                // TODO : Part 5
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/',
                  (route) => false,
                );
              },
            )
          ],
        ),
        body: Center(
            child: Column(
          children: [
            const SizedBox(height: 100),
            const Text('Hello!'),
            const SizedBox(height: 50),
            const Text(
              'name',
              style: TextStyle(fontSize: 30),
            ),
            Text(args.name),
            const SizedBox(height: 50),
            const Text(
              'email',
              style: TextStyle(fontSize: 30),
            ),
            Text(args.email),
          ],
        )));
  }
}

class User {
  final String name;
  final String email;

  User(this.name, this.email);
}

void main() {
  runApp(const MyApp());
}
