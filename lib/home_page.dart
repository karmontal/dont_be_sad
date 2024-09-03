import 'dart:async';

import 'package:dont_be_sad/azkar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_islamic_icons/flutter_islamic_icons.dart';
import 'package:toastification/toastification.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int currentIndex = 0;
  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();

    Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (currentIndex < 2) {
        currentIndex++;
        _pageController.animateToPage(
          currentIndex,
          duration: const Duration(milliseconds: 350),
          curve: Curves.easeIn,
        );
      } else {
        currentIndex = 0;
        _pageController.animateToPage(
          currentIndex,
          duration: const Duration(milliseconds: 350),
          curve: Curves.easeIn,
        );
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
            backgroundColor: Colors.grey[100],
            appBar: AppBar(
                // leading: Image.asset("assets/logo.png"),
                title: Text('الصفحة الرئيسية',
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
                child: ListView(
                  padding: const EdgeInsets.all(8),
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      alignment: Alignment.center,
                      height: 80,
                      child: Text(
                        "مرحبا بك في تطبيق لا تحزن",
                        style: TextStyle(
                            fontSize: 24,
                            fontFamily: "Rubik",
                            color: Colors.green[800]),
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                            height:
                                MediaQuery.of(context).size.width * 0.5 - 16,
                            width: MediaQuery.of(context).size.width * 0.5 - 16,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              //color: Colors.teal,
                              border: Border.all(
                                  width: 3,
                                  color: const Color.fromRGBO(124, 179, 66, 1)),
                            ),
                            child: TextButton(
                              style: const ButtonStyle(
                                  alignment: Alignment.center),
                              child: const Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Icon(
                                    FlutterIslamicIcons.solidPrayer,
                                    color: Color.fromRGBO(46, 125, 50, 1),
                                    size: 50,
                                  ),
                                  Text("أذكار وأدعية",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 24,
                                          fontFamily: "Rubik",
                                          color:
                                              Color.fromRGBO(46, 125, 50, 1))),
                                ],
                              ),
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const Azkar(),
                                  ),
                                );
                              },
                            )),
                        const SizedBox(
                          width: 16,
                        ),
                        Container(
                            height:
                                MediaQuery.of(context).size.width * 0.5 - 16,
                            width: MediaQuery.of(context).size.width * 0.5 - 16,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              //color: Colors.teal,
                              border: Border.all(
                                  width: 3,
                                  color: const Color.fromRGBO(124, 179, 66, 1)),
                            ),
                            child: TextButton(
                              style: const ButtonStyle(
                                  alignment: Alignment.center),
                              child: const Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Icon(
                                    FlutterIslamicIcons.solidTasbihHand,
                                    color: Color.fromRGBO(46, 125, 50, 1),
                                    size: 50,
                                  ),
                                  Text("ورد يومي",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 24,
                                          fontFamily: "Rubik",
                                          color:
                                              Color.fromRGBO(46, 125, 50, 1))),
                                ],
                              ),
                              onPressed: () {
                                toastification.show(
                                  context: context,
                                  type: ToastificationType.success,
                                  style: ToastificationStyle.flat,
                                  title: const Text("الورد اليومي"),
                                  description:
                                      const Text("هذه الصفحة قيد الإنشاء"),
                                  alignment: Alignment.bottomRight,
                                  autoCloseDuration: const Duration(seconds: 5),
                                  animationBuilder: (
                                    context,
                                    animation,
                                    alignment,
                                    child,
                                  ) {
                                    return FadeTransition(
                                      opacity: animation,
                                      child: child,
                                    );
                                  },
                                  primaryColor: const Color(0xff199f19),
                                  backgroundColor: const Color(0xffbce1c2),
                                  foregroundColor: const Color(0xff0c5d0c),
                                  icon: const Icon(FlutterIslamicIcons.prayer),
                                  boxShadow: lowModeShadow,
                                  showProgressBar: true,
                                  direction: TextDirection.rtl,
                                  dragToClose: true,
                                );

                                // Navigator.of(context).push(
                                //   MaterialPageRoute(
                                //     builder: (context) => DailyWerd(),
                                //   ),
                                // );
                              },
                            )),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8, bottom: 8),
                      child: Row(
                        children: [
                          Container(
                              height:
                                  MediaQuery.of(context).size.width * 0.5 - 16,
                              width:
                                  MediaQuery.of(context).size.width * 0.5 - 16,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                //color: Colors.teal,
                                border: Border.all(
                                    width: 3,
                                    color:
                                        const Color.fromRGBO(124, 179, 66, 1)),
                              ),
                              child: TextButton(
                                style: const ButtonStyle(
                                    alignment: Alignment.center),
                                child: const Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Icon(
                                      FlutterIslamicIcons.mohammad,
                                      color: Color.fromRGBO(46, 125, 50, 1),
                                      size: 50,
                                    ),
                                    Text("الأربعون النووية",
                                        textAlign: TextAlign.center,
                                        //softWrap: true,
                                        //maxLines: 1,
                                        //overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontSize: 24,
                                            fontFamily: "Rubik",
                                            color: Color.fromRGBO(
                                                46, 125, 50, 1))),
                                  ],
                                ),
                                onPressed: () {
                                  toastification.show(
                                    context: context,
                                    type: ToastificationType.success,
                                    style: ToastificationStyle.flat,
                                    title: const Text("الأربعون النووية"),
                                    description:
                                        const Text("هذه الصفحة قيد الانشاء"),
                                    alignment: Alignment.bottomRight,
                                    autoCloseDuration:
                                        const Duration(seconds: 5),
                                    animationBuilder: (
                                      context,
                                      animation,
                                      alignment,
                                      child,
                                    ) {
                                      return FadeTransition(
                                        opacity: animation,
                                        child: child,
                                      );
                                    },
                                    primaryColor: const Color(0xff199f19),
                                    backgroundColor: const Color(0xffbce1c2),
                                    foregroundColor: const Color(0xff0c5d0c),
                                    icon:
                                        const Icon(FlutterIslamicIcons.prayer),
                                    boxShadow: lowModeShadow,
                                    showProgressBar: true,
                                    direction: TextDirection.rtl,
                                    dragToClose: true,
                                  );

                                  // Navigator.of(context).push(
                                  //   MaterialPageRoute(
                                  //     builder: (context) => Forty(),
                                  //   ),
                                  // );
                                },
                              )),
                          const SizedBox(
                            width: 16,
                          ),
                          Container(
                              height:
                                  MediaQuery.of(context).size.width * 0.5 - 16,
                              width:
                                  MediaQuery.of(context).size.width * 0.5 - 16,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                //color: Colors.teal,
                                border: Border.all(
                                    width: 3,
                                    color:
                                        const Color.fromRGBO(124, 179, 66, 1)),
                              ),
                              child: TextButton(
                                style: const ButtonStyle(
                                    alignment: Alignment.center),
                                child: const Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Icon(
                                      FlutterIslamicIcons.solidTasbih,
                                      color: Color.fromRGBO(46, 125, 50, 1),
                                      size: 50,
                                    ),
                                    Text("المسبحة",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 24,
                                            fontFamily: "Rubik",
                                            color: Color.fromRGBO(
                                                46, 125, 50, 1))),
                                  ],
                                ),
                                onPressed: () {
                                  toastification.show(
                                    context: context,
                                    type: ToastificationType.success,
                                    style: ToastificationStyle.flat,
                                    title: const Text("المسبحة"),
                                    description:
                                        const Text("هذه الصفحة قيد الانشاء"),
                                    alignment: Alignment.bottomRight,
                                    autoCloseDuration:
                                        const Duration(seconds: 5),
                                    animationBuilder: (
                                      context,
                                      animation,
                                      alignment,
                                      child,
                                    ) {
                                      return FadeTransition(
                                        opacity: animation,
                                        child: child,
                                      );
                                    },
                                    primaryColor: const Color(0xff199f19),
                                    backgroundColor: const Color(0xffbce1c2),
                                    foregroundColor: const Color(0xff0c5d0c),
                                    icon:
                                        const Icon(FlutterIslamicIcons.prayer),
                                    boxShadow: lowModeShadow,
                                    showProgressBar: true,
                                    direction: TextDirection.rtl,
                                    dragToClose: true,
                                  );

                                  // Navigator.of(context).push(
                                  //   MaterialPageRoute(
                                  //     builder: (context) => Mesbaha(),
                                  //   ),
                                  // );
                                },
                              )),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 8, bottom: 8),
                      height: 200,
                      child: PageView(
                        controller: _pageController,
                        onPageChanged: (int index) {
                          setState(() {
                            currentIndex = index;
                          });
                        },
                        children: [
                          Container(
                            color: Colors.black26,
                          ),
                          Container(
                            color: Colors.teal,
                          ),
                          Container(
                            color: Colors.blue,
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    )
                  ],
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
}
