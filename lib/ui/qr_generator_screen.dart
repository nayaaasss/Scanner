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
  final ScreenshotController screenshotController = ScreenshotController();

    // Fungsi untuk membagikan QR Code
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
                            controller: screenshotController,
                            child: Screenshot(
                              controller: ScreenshotController(),
                              child: PrettyQr(
                                data: qrLink!,
                                size: 200,
                                roundEdges: true,
                                elementColor: const Color(0xFF2B61E3),
                              ),
                            ),
                          ),
                          const SizedBox(height: 70),
                          // Tombol Share
                          ElevatedButton.icon(
                            onPressed: () {
                              _shareQrCode();
                            },
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
  Future<void> _shareQrCode() async {
    // ambil screenshot dari QR
    final image = await screenshotController.capture();
    if (image != null) {
      // kalau berhasil ambil gambar, share menggunakan Share Plus
      await Share.shareXFiles([
        XFile.fromData(
          image,
          name: "qr_code.png", // nama file screenshot
          mimeType: "image/png", // format file
        ),
      ]);
    }
  }
  
}