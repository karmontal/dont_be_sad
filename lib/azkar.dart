// ignore_for_file: prefer_typing_uninitialized_variables, no_leading_underscores_for_local_identifiers

import 'package:dont_be_sad/zekr.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'db/azkar_db.dart';

import 'package:sqflite/sqlite_api.dart';

class Azkar extends StatefulWidget {
  const Azkar({super.key});

  @override
  State<Azkar> createState() => _AzkarState();
}

class _AzkarState extends State<Azkar> {
  Database? db;
  var list;
  final AzkarDb _db = AzkarDb();

  void _requestSqlData() async {
    var _list = await _db.requestSqlDataAsync();
    setState(() {
      list = _list;
    });
  }

  @override
  void initState() {
    super.initState();
    _requestSqlData();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
            backgroundColor: Colors.grey[100],
            appBar: AppBar(
                //leading: Image.asset("assets/logo.png"),
                title: Text('أدعية وأذكار',
                    style: TextStyle(
                        fontFamily: 'Rubik',
                        fontSize: 24,
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
                child: ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: list == null ? 0 : list.length,
                  itemBuilder: (context, index) {
                    return listItem(list[index], context);
                  },
                ),
              ),
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

  Widget listItem(item, context) {
    return TextButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => Zekr(
                zekrStr: item["cat_name"],
              ),
            ),
          );
        },
        child: Container(
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.all(5),
          decoration: BoxDecoration(
              color: Colors.white60,
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                color: const Color.fromRGBO(46, 125, 50, 1),
                width: 1,
              )),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            // ignore: sized_box_for_whitespace
            Container(
                width: MediaQuery.of(context).size.width - 140,
                child: Text(
                  item["cat_name"],
                  softWrap: true,
                  overflow: TextOverflow.fade,
                  maxLines: 2,
                  style: const TextStyle(
                      fontSize: 16,
                      fontFamily: "Rubik",
                      color: Color.fromRGBO(46, 125, 50, 1)),
                )),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  item["has_alarm"] == null
                      ? Icons.alarm_add_outlined
                      : Icons.alarm_on_outlined,
                  color: item["has_alarm"] == null
                      ? const Color.fromARGB(255, 192, 192, 192)
                      : const Color.fromRGBO(46, 125, 50, 1),
                ))
          ]),
        ));
  }
}
