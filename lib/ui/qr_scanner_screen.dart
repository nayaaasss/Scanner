import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QrScannerScreen extends StatefulWidget {
  const QrScannerScreen({super.key});

  @override
  State<QrScannerScreen> createState() => _QrScannerScreenState();
}

class _QrScannerScreenState extends State<QrScannerScreen> {
  String? scannerData;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
         leading: IconButton(
         onPressed: () {
  Navigator.pushNamed(context, "/");
},
          icon: const Icon(Icons.arrow_back, color: Colors.black),
        ),
        title: const Text('Scan QR Code', 
        style: 
        TextStyle(
          color: Colors.black
          ),
          ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.popAndPushNamed(context, "/generator");
            }, 
            icon: const Icon(Icons.qr_code,)
            )
        ],
      ),
  body: Center(
  child: Column(
    children: [
      const SizedBox(height: 40),
      const Text(
        "Please place the QR code in the area",
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 20, 20, 20),
        ),
      ),
      const Text(
        "Hold the QR code steady for a better scan.",
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.normal,
          color: Color.fromARGB(255, 0, 0, 0),
        ),
      ),
      const SizedBox(height: 80),
      // QR scanner camera view
      ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: Container(
          width: 300,
          height: 300,
          child: MobileScanner(
            controller: MobileScannerController(
              detectionSpeed: DetectionSpeed.noDuplicates,
              returnImage: true,
            ),
            onDetect: (capture) {
              final List<Barcode> barcodes = capture.barcodes;
              final Uint8List? image = capture.image;
              for (final barcode in barcodes) {
                print('Barcode is valid! Here is the source ${barcode.rawValue}');
              }
              if (image != null) {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text(
                        barcodes.first.rawValue ?? "No Reference Found From This QR Code",
                      ),
                      content: Image(
                        image: MemoryImage(image),
                      ),
                    );
                  }
                );
              }
            },
          ),
        ),
      ),
      const SizedBox(height: 90), 
      const Text(
        "Designed by Kanaya Riany",
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.normal,
          color: Color.fromARGB(255, 0, 0, 0),
        ),
      ),
    ],
  ),
),
    );
  }
}