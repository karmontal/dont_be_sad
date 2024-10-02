import 'package:dont_be_sad/db/azkar_db.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class Zekr extends StatefulWidget {
  final String zekrStr;
  const Zekr({super.key, required this.zekrStr});

  @override
  _ZekrState createState() => _ZekrState();
}

class _ZekrState extends State<Zekr> {
  Database? db;
  var list;
  late List<int> cnts = List.empty(growable: true);
  var indx = 0;
  final AzkarDb _db = AzkarDb();
  final PageController _pageController = PageController();

  void _requestSqlData() async {
    var _list = await _db.getZekr(widget.zekrStr);
    setState(() {
      list = _list;
      for (var element in list) {
        cnts.add(element["count"]);
      }
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
                  padding: const EdgeInsets.all(4),
                  alignment: Alignment.bottomCenter,
                  child: Column(children: [
                    // SizedBox(
                    //   height: MediaQuery.of(context).size.height - 240,
                    // ),
                    Expanded(
                        //padding: const EdgeInsets.only(bottom: 140),
                        child: PageView.builder(
                            controller: _pageController,
                            onPageChanged: (value) {
                              setState(() {
                                indx = value;
                              });
                            },
                            itemCount: list == null ? 0 : list.length,
                            itemBuilder: (context, index) {
                              return zekrPage(list[index]);
                            })),
                    Container(
                      margin: const EdgeInsets.all(10),
                      height: 80,

                      //padding: EdgeInsets.all(15),
                      child: Row(
                        children: [
                          Container(
                              height: 80,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: Colors.green[400],
                                  border: Border.all(
                                      color:
                                          const Color.fromRGBO(85, 139, 47, 1),
                                      width: 2),
                                  borderRadius: const BorderRadius.only(
                                      topRight: Radius.circular(20),
                                      bottomRight: Radius.circular(20))),
                              width:
                                  (MediaQuery.of(context).size.width - 30) / 3,
                              child: TextButton(
                                onPressed: () {
                                  if (indx > 0) {
                                    indx--;
                                    _pageController.animateToPage(
                                      indx,
                                      duration:
                                          const Duration(milliseconds: 350),
                                      curve: Curves.easeIn,
                                    );
                                  }
                                },
                                child: const Text(
                                  "<<",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              )),
                          Container(
                            height: 80,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.green[900],
                              border: Border.all(
                                  color: const Color.fromRGBO(85, 139, 47, 1),
                                  width: 2),
                            ),
                            width: (MediaQuery.of(context).size.width - 40) / 3,
                            child: Text(
                              list == null
                                  ? "0"
                                  : "${cnts[indx]}/${list[indx]["count"]}",
                              style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                          Container(
                              height: 80,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: Colors.green[400],
                                  border: Border.all(
                                      color:
                                          const Color.fromRGBO(85, 139, 47, 1),
                                      width: 2),
                                  borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      bottomLeft: Radius.circular(20))),
                              width:
                                  (MediaQuery.of(context).size.width - 30) / 3,
                              child: TextButton(
                                onPressed: () {
                                  if (indx < list.length - 1) {
                                    indx++;
                                    _pageController.animateToPage(
                                      indx,
                                      duration:
                                          const Duration(milliseconds: 350),
                                      curve: Curves.easeIn,
                                    );
                                  }
                                },
                                child: const Text(
                                  ">>",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ))
                        ],
                      ),
                    ),
                    Text(
                      "هذا العمل صدقة جارية عن شهدائنا في غزة",
                      style: TextStyle(color: Colors.lightGreen[800]),
                    )
                  ]))
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

  Widget zekrPage(item) {
    return TextButton(
        onPressed: () {
          if (cnts[indx] == 1 || cnts[indx] == 0) {
            if (indx < list.length - 1) {
              setState(() {
                cnts[indx] = 0;
              });
              indx++;
              _pageController.animateToPage(
                indx,
                duration: const Duration(milliseconds: 350),
                curve: Curves.easeIn,
              );
            }
          } else {
            setState(() {
              cnts[indx] = cnts[indx] - 1;
            });
          }
        },
        child: Container(
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              border: Border.all(
                  color: const Color.fromRGBO(85, 139, 47, 1), width: 2),
              borderRadius: BorderRadius.circular(40)),
          padding: const EdgeInsets.all(15),
          alignment: Alignment.center,
          child: ListView(children: [
            const SizedBox(
              height: 20,
            ),
            Text(
              item["zekr"],
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 18,
                  fontFamily: "Rubik",
                  color: Colors.lightGreen[800]),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              item["description"] + " - " + item["reference"],
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 16,
                  fontFamily: "Rubik",
                  fontStyle: FontStyle.italic,
                  color: Colors.lightGreen[700]),
            )
          ]),
        ));
  }
}
