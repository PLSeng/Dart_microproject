import 'package:flutter/material.dart';

class Microject extends StatelessWidget {
  Widget part1(String text1) {
    // TODO: part1
    return Container(
      constraints: BoxConstraints(minWidth: double.infinity),
      height: 48,
      child: ElevatedButton(
        onPressed: () {},
        child: Text(text1, style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
        style: ElevatedButton.styleFrom(
          primary : Color(0xff2196F3),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
    );
  }

  Widget part2(String text1) {
    // TODO: part2
    return Container(
      constraints: BoxConstraints(minWidth: double.infinity),
      height: 48,
      child: OutlinedButton(
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 30,
              width: 30,
              child: Image.network(iconImageUrl, fit: BoxFit.cover),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              text1,
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700, color: Colors.black),
            ),
          ],
        ),
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          side: BorderSide(color : Color(0xFFA4A4A4),),
        ),
      ),
    );
  }

  Widget part3(String text1) {
    // TODO: part3
    return TextButton(
      onPressed: () {},
      child: Text(
        text1,
        style: TextStyle(color : Color(0xff2196F3),),
      ),
    );
  }

  final TextEditingController idController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final String iconImageUrl = 'https://firebasestorage.googleapis.com/v0/b/new-ml-6c02d.appspot.com/o/Course2_Microproject%2CExam_image%2Fgoogle.jpeg?alt=media&token=9c4cb496-f720-4bfe-bbe3-01ee95dfc196';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22),
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            const FlutterLogo(
              size: 50,
            ),
            const SizedBox(
              height: 40,
            ),
            const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'ID',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                )),
            const SizedBox(
              height: 8,
            ),
            buildTextFormField(idController, false),
            const SizedBox(
              height: 10,
            ),
            const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Password',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                )),
            const SizedBox(
              height: 8,
            ),
            buildTextFormField(passwordController, false),
            const SizedBox(
              height: 21,
            ),
            part1("LOG IN"),
            const SizedBox(
              height: 11,
            ),
            part2("Continue with Google"),
            const SizedBox(
              height: 23,
            ),
            part3("New to Microlearnable?"),
          ],
        ),
      ),
    );
  }

  Widget buildTextFormField(TextEditingController controller, bool isObscure) {
    return Container(
      constraints: const BoxConstraints(minWidth: double.infinity),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            contentPadding:
            const EdgeInsets.symmetric(vertical: 5, horizontal: 10)),
        obscureText: isObscure,
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