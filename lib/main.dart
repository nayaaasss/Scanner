import 'package:flutter/material.dart';
import 'package:qr_scanner/splash_screen.dart';
import 'package:qr_scanner/ui/home_page.dart';
import 'package:qr_scanner/ui/qr_generator_screen.dart';
import 'package:qr_scanner/ui/qr_scanner_screen.dart';

void main() {
  runApp(const QrScannerApp());
}

class QrScannerApp extends StatelessWidget {
  const QrScannerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "QR Scanner App",
      theme: ThemeData(
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent
      )
      ),
      initialRoute:  "/",
      routes: {
        "/": (context) =>SplashScreen(),
        "/home": (context) => const HomePage(),
        "/scanner" : (context) => const QrScannerScreen(),
        "/generator" : (context) => const QrGeneratorScreen()
      },
    );
  }
}