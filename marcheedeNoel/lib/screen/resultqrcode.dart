import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';


class ResultQRCode extends StatefulWidget {
  const ResultQRCode({super.key});

  @override
  State<ResultQRCode> createState() => _ResultQRCodeState();
}

class _ResultQRCodeState extends State<ResultQRCode> {

   late String code;
   late Function() closeScreen;

    //ResultScreen({super.key, required this.closeScreen, required this.code})



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Votre Qr Code",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children:  [



            const Text(
              "Resultat Scanner",
              style: TextStyle(
                color: Colors.black87,
                fontSize: 16,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "RESULTAT",
              style: TextStyle(
                color: Colors.black87,
                fontSize: 16,
                letterSpacing: 1,
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: MediaQuery.of(context).size.width - 100,
              height: 48,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue
                ),
                onPressed: () {},
                  child: const Text(
                    "copie",
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 16,
                      letterSpacing: 1,
                    ),
                  ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
