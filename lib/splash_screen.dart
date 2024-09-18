import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'home_page.dart'; // Import the new page

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Navigate to HomePage after 3 seconds
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/txt.png', // Ensure you have a logo.png in the assets folder
              width: 250,
              height: 150,
            ).animate().fade(duration: 500.ms, curve: Curves.easeOut).scale(
                delay: 500.ms,
                curve: Curves.easeInOutBack,
                duration: 2.seconds),
            const Text("إن الله معنا")
                .animate()
                .fade(duration: 500.ms, delay: 2500.ms)
                .moveY(delay: 2500.ms, duration: 1.seconds),
            // const SizedBox(height: 30),
            // SpinKitCircle(
            //   color: Colors.lightGreen[800],
            //   size: 50.0,
            // ),
          ],
        ),
      ),
    );
  }
}
