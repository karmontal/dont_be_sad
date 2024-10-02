import 'package:flutter/material.dart';
import 'splash_screen.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static const String name = 'Awesome Notifications - Example App';
  static const MaterialColor mainColor = Colors.green;
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // Only after at least the action method is set, the notification events are delivered
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: MyApp.name,
      theme: ThemeData(
        primarySwatch: MyApp.mainColor,
      ),
      home: const SplashScreen(),
    );
  }
}
