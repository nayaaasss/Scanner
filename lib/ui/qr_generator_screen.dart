import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

class QrGeneratorScreen extends StatefulWidget {
  const QrGeneratorScreen({super.key});

  @override
  State<QrGeneratorScreen> createState() => _QrGeneratorScreenState();
}

class _QrGeneratorScreenState extends State<QrGeneratorScreen> {
  String? qrLink;
  bool isGenerated = false;
  final ScreenshotController _screenshotController = ScreenshotController();

    // Fungsi untuk membagikan QR Code
  void _shareQRCode() async {
    if (qrLink != null) {
      // Ambil screenshot QR Code
      final Uint8List imageBytes =
          await _screenshotController.captureFromWidget(
        PrettyQr(
          data: qrLink!,
          size: 200,
          roundEdges: true,
          elementColor: const Color(0xFF2B61E3),
        ),
      );

   // Jika screenshot berhasil
      if (imageBytes!= null) {
        // Simpan file gambar ke penyimpanan lokal
        final directory = await getApplicationDocumentsDirectory();
        final imagePath = '${directory.path}/qr_code.png';

        final imageFile = File(imagePath)..writeAsBytesSync(imageBytes);

        // Mengonversi File ke XFile
        final xFile = XFile(imageFile.path);

        // Bagikan file gambar QR Code
        await Share.shareXFiles(
          [xFile], // Bagikan file gambar QR Code
          text: "Here is my QR code!",
        );
      }
    }
  }
  String? qrRawValue;

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Generate QR Code"),
         leading: IconButton(
          onPressed: () {
            Navigator.pop(context, "/home");
          },
          icon: const Icon(Icons.arrow_back, color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // TextField untuk link QR
            TextField(
              decoration: InputDecoration(
                labelText: "Link to generate",
                hintText: "Enter the URL",
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(width: 3, color: Colors.transparent),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                filled: true,
                fillColor: Color(0xFFE5EDFF),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                prefixIcon: const Icon(Icons.link),
              ),
              onChanged: (value) {
                qrLink = value;
              },
            ),
            const SizedBox(height: 24),
            // Tombol Generate
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF2B61E3),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    "Generate QR",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
                onPressed: () {
                  if (qrLink != null && qrLink!.isNotEmpty) {
                    setState(() {
                      isGenerated = true;
                    });
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text("Please enter a valid link!")),
                    );
                  }
                },
              ),
            ),
            const SizedBox(height: 32),
            // Area hasil QR Code
            Expanded(
              child: Center(
                child: isGenerated
                    ? Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Screenshot(
                            controller: _screenshotController,
                            child: PrettyQr(
                              data: qrLink!,
                              size: 200,
                              roundEdges: true,
                              elementColor: const Color(0xFF2B61E3),
                            ),
                          ),
                          const SizedBox(height: 70),
                          // Tombol Share
                          ElevatedButton.icon(
                            onPressed: _shareQRCode,
                            icon: Icon(Icons.share, color: Colors.white,),
                            label: Text("Share QR Code", style: TextStyle(color: Colors.white),),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blueAccent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                        ],
                      )
                    : const Text(
                        "Your QR Code will appear here!",
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  getApplicationDocumentsDirectory() {}
}