import 'package:flutter/material.dart';


class MicrojectStatefulWidget extends StatefulWidget {
  @override
  State<MicrojectStatefulWidget> createState() => _Microject();
}

class _Microject extends State<MicrojectStatefulWidget> {
  bool isLiked = false;

  Widget top(String text1) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(imageUrl1)
              )
          ),
          height: 195,
          width: 195,
        ),
        const SizedBox(width: 11,),
        SizedBox(
            width: 123,
            child: Text(text1, style: const TextStyle(fontSize: 38, fontWeight: FontWeight.w900),)
        )
      ],
    );
  }

  Widget part1(String text1, String text2) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 21,
          backgroundImage: NetworkImage(imageUrl2),
        ),
        const SizedBox(width: 14,),
        Flexible(
          fit: FlexFit.tight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(text1, style: const TextStyle(fontSize: 16)),
              Text(text2, style: const TextStyle(fontSize: 12, color: Color(0xFFB4B4B4))),
            ],
          ),
        ),
        IconButton(
          onPressed: () {
            // TODO : part1
            setState(() {
              isLiked = !isLiked;
            });
          },
          icon: isLiked? Icon(Icons.favorite) : Icon(Icons.favorite_border),
          color: isLiked? Colors.red : Colors.black,
        ),
        const SizedBox(width: 20,)
      ],
    );
  }

  Widget bottom(String text1) {
    return Container(child: Text(text1));
  }

  final imageUrl1 = 'https://images.unsplash.com/photo-1529333166437-7750a6dd5a70?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1169&q=80';
  final imageUrl2 = 'https://images.unsplash.com/flagged/photo-1570612861542-284f4c12e75f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Magazine', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: Colors.black),),
        backgroundColor: Colors.white,
        centerTitle: false,
        elevation: 1,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(23, 24, 23, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            top('The MZ Generation'),
            const SizedBox(height: 23,),
            part1('Peter K.', 'Apr 5, 2022'),
            const SizedBox(height: 23,),
            bottom('Proin cursus in at nulla sed. Phasellus purus mauris neque, leo morbi mauris. Proin ornare ut dui in egestas pharetra amet commodo cursus. Egestas parturient ornare augue aliquam mauris in. Eget aliquam vel gravida turpis ut varius odio. Duis dolor dis vulputate ipsum. '),
            const SizedBox(height: 23,),
            bottom('Et in diam adipiscing sit dui. Consectetur id netus aliquam nunc, tincidunt. Quis purus magna egestas condimentum tempor proin et.'),
          ],
        ),
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
      home: MicrojectStatefulWidget(),
    );
  }
}