import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:flutter/services.dart';
import 'dart:math';

import 'listqrcode.dart';

class QRCodePage extends StatefulWidget {
  final String ticketInfo;

  QRCodePage({required this.ticketInfo});

  @override
  _QRCodePageState createState() => _QRCodePageState();
}
List<String> qrCodes = [];
class _QRCodePageState extends State<QRCodePage> {


  void navigateToListQRCodePage(String qrCode) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ListQRCode( ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Code QR'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            QrImageView(
              data: widget.ticketInfo,
              version: QrVersions.auto,
              size: 200.0,
            ),
            SizedBox(height: 20.0),
            const Text(
              'Votre code QR est prêt',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 50),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    final String qrCode = widget.ticketInfo;
                    qrCodes.add(qrCode);
                    navigateToListQRCodePage(qrCode);
                  });
                },
                child: const Text('OK'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}