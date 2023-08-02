 import 'package:flutter/material.dart';
import 'package:marcheedenoel/screen/qrcode.dart';
import 'package:qr_flutter/qr_flutter.dart';

import 'listqrcode1.dart';

class QRCodePage1 extends StatefulWidget {
  final String ticketInfo1;

   const QRCodePage1({required this.ticketInfo1});

   @override
   State<QRCodePage1> createState() => _QRCodePage1State();
 }

 class _QRCodePage1State extends State<QRCodePage1> {

   void navigateToListQRCodePage1(String qrCode) {
     Navigator.push(
       context,
       MaterialPageRoute(
         builder: (context) => ListQrCode1(),
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
               data: widget.ticketInfo1,
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
                     final String qrCode = widget.ticketInfo1;
                     qrCodes.add(qrCode);
                     navigateToListQRCodePage1(qrCode);
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

