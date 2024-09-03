import 'package:flutter/material.dart';

class Zekr extends StatefulWidget {
  final String zekrStr;
  const Zekr({super.key, required this.zekrStr});

  @override
  _ZekrState createState() => _ZekrState();
}

class _ZekrState extends State<Zekr> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
            backgroundColor: Colors.grey[100],
            appBar: AppBar(
                //leading: Image.asset("assets/logo.png"),
                title: Text(widget.zekrStr,
                    style: TextStyle(
                        fontFamily: 'Rubik',
                        fontSize: 18,
                        color: Colors.lightGreen[50])),
                backgroundColor: const Color.fromRGBO(124, 179, 66, 1)),
            body: Stack(children: [
              Container(
                  // Set the background image
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                opacity: 0.2,
                image:
                    AssetImage('assets/background.png'), // Path to your image
                fit: BoxFit.cover, // Makes the image cover the entire container
              ))),
              Container(
                  padding: const EdgeInsets.only(bottom: 40),
                  child: ListView(
                    padding: const EdgeInsets.all(8),
                    children: const [Text("ورد اليوم الأول")],
                  )),
              Container(
                  padding: const EdgeInsets.all(4),
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    "هذا العمل صدقة جارية عن شهدائنا في غزة",
                    style: TextStyle(color: Colors.lightGreen[800]),
                  ))
            ])
            //Center(

            // Text(
            //   'مرحبا بك في تطبيق لا تحزن!',
            //   style: TextStyle(
            //       fontSize: 24, fontFamily: "Rubik", color: Colors.green[800]),
            // ),
            //),
            ));
  }
}
