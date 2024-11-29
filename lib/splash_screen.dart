import 'dart:async';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Timer for automatic navigation
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, '/home');
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/images/Vector (2).png', height: 120),
            const SizedBox(height: 20),
            const Text(
              'Scan Everywhere',
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 30),
            const SizedBox(
              width: 250, 
              child: Text(
                'Scan documents everywhere every time from your pocket.',
                textAlign: TextAlign.center, 
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            const SizedBox(height: 60),
            const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
