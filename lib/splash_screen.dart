import 'dart:async';
import 'package:flutter/material.dart';
import 'login_screen.dart';

// StatefulWidget to do the 3 seconds delay before navigating to the profile
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // call the start time function.
    _startTimer();
  }

  void _startTimer() {
    Timer(const Duration(seconds: 3), () {
    //using the setState method to update the display after the 3 seconds is up.
      setState(() {
        
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            //calls the profile screen class in profile_screen.dart
            builder: (context) =>  LoginScreen()
          ),
        );
      });
    });
  }
  @override
  // building the wideget that will contain the splash screen layout and design
  // this widget will go after 3 seconds.
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(flex: 2),
              //i changed the image in the splash screen to a netwok image from pintrest where i downloaded it from
              Image.network(
                'https://i.pinimg.com/webp85/736x/6b/65/41/6b6541cf791ecf8680de60f51e44e95f.webp',
                width: 150,
                height: 150,
                fit: BoxFit.contain,
              ),
             const SizedBox(height: 16),
              // App Title
              Text(
                'Product-List-Cart (PLC)',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF009BBD),
                ),
              ),
              const Spacer(flex: 3),
              // Loading Indicator placeholder at the bottom
              Padding(
                padding: const EdgeInsets.only(bottom: 45.0),
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF009BBD)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}