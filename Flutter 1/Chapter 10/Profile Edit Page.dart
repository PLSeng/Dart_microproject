import 'package:flutter/material.dart';

class _MicrojectState extends State<Microject> {
  Widget part1() {
    // TODO : Part 1
    return TextButton(
      onPressed: () async {
        var result = await Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => EditProfilePage(profile: profile)));
        setState(() {
          profile = result;
        });
      },
      child: Text(
        'edit',
        style: TextStyle(
          color: Colors.blue,
        ),
      ),
    );
  }

  Profile profile = Profile("Patrick Kwon", 'Handong Global University',
      'https://firebasestorage.googleapis.com/v0/b/new-ml-6c02d.appspot.com/o/Course2_Microproject%2CExam_image%2Fperson1.jpg?alt=media&token=8d88face-f7de-4b73-a9df-72ae2fdc1116');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            'Profile',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
          centerTitle: false,
          elevation: 1,
          actions: [part1()],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 196,
                width: 196,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(profile.url),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                profile.name,
                style: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    letterSpacing: -1),
              ),
              const SizedBox(
                height: 13,
              ),
              Text(
                profile.university,
                style: const TextStyle(
                  fontSize: 18,
                  color: Color(0xffA5A5A5),
                ),
              ),
            ],
          ),
        ));
  }
}

class _EditProfilePageState extends State<EditProfilePage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _universityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context, widget.profile);
          },
          icon: const Icon(
            Icons.keyboard_backspace,
            color: Colors.black,
          ),
        ),
        title: const Text(
          'Edit Profile',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        actions: [
          TextButton(
              onPressed: () {
                // TODO : Part 2
                widget.profile.name = _nameController.text;
                widget.profile.university = _universityController.text;
                Navigator.pop(context, widget.profile);
              },
              child: const Text(
                'save',
                style: TextStyle(color: Colors.blue),
              ))
        ],
      ),
      body: buildBody(),
    );
  }

  Widget buildTextFormField(TextEditingController controller, String text) {
    return Container(
      constraints: const BoxConstraints(minWidth: double.infinity),
      height: 46,
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            contentPadding: const EdgeInsets.only(left: 16),
            hintText: text,
            hintStyle:
                const TextStyle(fontSize: 16.0, color: Color(0xffCCC3C3))),
      ),
    );
  }

  Widget buildBody() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 35),
          const Text(
            'Name',
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.w700, letterSpacing: -0.5),
          ),
          const SizedBox(height: 9),
          buildTextFormField(_nameController, widget.profile.name),
          const SizedBox(height: 30),
          const Text(
            'University',
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.w700, letterSpacing: -0.5),
          ),
          const SizedBox(height: 9),
          buildTextFormField(_universityController, widget.profile.university),
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

class EditProfilePage extends StatefulWidget {
  Profile profile;
  EditProfilePage({Key? key, required this.profile}) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class Profile {
  String name;
  String university;
  String url;

  Profile(this.name, this.university, this.url);
}
