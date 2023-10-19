import 'dart:ui';
import 'package:flutter/material.dart';

class Microject extends StatefulWidget {
  const Microject({Key? key, required this.imageUrl}) : super(key: key);
  final String imageUrl;

  @override
  MicrojectState createState() => MicrojectState();
}

class MicrojectState extends State<Microject> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final RegExp _emailRegExp = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+.[a-zA-Z]+");
  final RegExp _passwordRegExp =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$');

  Widget part1() {
    return const Column(
      children: [
        //TODO: part 1
        Text(
          'New to Microlearnable?',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: 'Roboto',
            color: Colors.white,
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          'Join us to learn flutter from the \n base to the professional.',
          style: TextStyle(
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w500,
            fontSize: 16,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget part2(String hintText, String errorText,
      TextEditingController controller, RegExp regExp) {
    return TextFormField(
      //TODO: part 2
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(left: 19),
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          fontFamily: 'Roboto',
          color: Colors.white,
        ),
        errorStyle: TextStyle(
          fontSize: 10,
          height: 0.4,
          color: Color(0xffEE3E36),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: Colors.white,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: Colors.white,
            width: 1,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: Color(0xffEE3E36),
            width: 1,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: Color(0xffEE3E36),
            width: 1,
          ),
        ),
      ),
      controller: controller,
      validator: (String? value) {
        return !regExp.hasMatch(value!) ? errorText : null;
      },
    );
  }

  Widget part3() {
    return Row(
      children: const [
        //TODO: part 3
        SizedBox(
          width: 157,
        ),
        Text(
          'Forgotten Password',
          style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget part4() {
    return SizedBox(
      width: 330,
      height: 52,
      //TODO: part 4
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: const Color(0xff2D313D),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Text(
          'Sign up',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.white,
          ),
        ),
        onPressed: () {
          _formKey.currentState!.validate();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(widget.imageUrl),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.fromLTRB(23.0, 35.0, 23.0, 33.0),
          child: Center(
            child: ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                child: Container(
                  height: 506,
                  width: 329,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                    border: Border.all(
                      width: 1,
                      color: Colors.white,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 30, horizontal: 33),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          part1(),
                          const SizedBox(
                            height: 40,
                          ),
                          part2("Email", "The entered Email already exists",
                              _emailController, _emailRegExp),
                          const SizedBox(
                            height: 20,
                          ),
                          part2(
                              "Password",
                              "Write least one upper, lower case, and digit",
                              _passwordController,
                              _passwordRegExp),
                          const SizedBox(
                            height: 8,
                          ),
                          part3(),
                          const SizedBox(
                            height: 56,
                          ),
                          part4(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  String imageUrl =
      "https://firebasestorage.googleapis.com/v0/b/new-ml-6c02d.appspot.com/o/Course2_Microproject%2CExam_image%2Fspace3_1.png?alt=media&token=bfa5aac4-9ca0-4d40-ac04-481f467c0653";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Microject(imageUrl: imageUrl),
    );
  }
}
