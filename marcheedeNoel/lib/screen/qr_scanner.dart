import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marcheedenoel/screen/resultqrcode.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class ScannerPAge extends StatefulWidget {
  const ScannerPAge({super.key});

  @override
  State<ScannerPAge> createState() => _ScannerPAgeState();
}

class _ScannerPAgeState extends State<ScannerPAge> {

  bool isScanCompleted = false;

  void closeScreen(){
    isScanCompleted = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Scanner QR code",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
                child: Container(
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text("Placez le code QR dans la zone",
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                      ),
                      ),
                      SizedBox(height: 10),
                      Text("L’analyse sera lancée automatiquement",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black54,
                      ),),
                    ],
                  ),
                ),
            ),
            Expanded(
              flex: 4,
                child: MobileScanner(
                  onDetect: (barcode) {
                    if(!isScanCompleted){
                      String code= barcode.raw ?? '___';
                      isScanCompleted = true;
                      Navigator.push(context, MaterialPageRoute(builder: (_)=> const ResultQRCode()));
                    }
                  },

                )
            ),
            Expanded(
                child: Container(
                  alignment: Alignment.center,
                  color: Colors.white,
                  child: const Text(
                    "Agent : Maxime",
                    style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      letterSpacing: 1,
                    ),
                  ),
                )),
          ],
        ),
      ),

    );
  }
}
