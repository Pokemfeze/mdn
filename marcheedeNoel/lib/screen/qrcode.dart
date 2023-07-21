import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:flutter/services.dart';

class QRCodePage extends StatefulWidget {
  final String ticketInfo;

  QRCodePage({ required this.ticketInfo});

  @override
  _QRCodePageState createState() => _QRCodePageState();
}

class _QRCodePageState extends State<QRCodePage> {
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
          QrImage(
          data: widget.ticketInfo,
          version: QrVersions.auto,
          size: 200.0,
        ),
        SizedBox(height: 20.0),
        Text (
          'Scannez ce code QR',
        style: TextStyle(fontSize: 18.0),
      ),
      ],
    ),
    ),
    );
  }
}