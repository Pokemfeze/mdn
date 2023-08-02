
import 'package:flutter/material.dart';
import 'package:marcheedenoel/screen/qrcode1.dart';

import '../services/data1.dart';

class PayPage1 extends StatefulWidget {
  const PayPage1({super.key});

  @override
  State<PayPage1> createState() => _PayPage1State();
}

class _PayPage1State extends State<PayPage1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Paiement',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    String ticketInfo1 = 'Acces autorise a : ${GlobalData1.selectedValue1} personne(s)\n'
                        'Prix Total: ${GlobalData1.totalPrice1}';

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => QRCodePage1(ticketInfo1: ticketInfo1),
                      ),
                    );
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10), // Spécifiez le rayon souhaité ici
                    child: Container(
                      width: 120,
                      height: 120,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/om3.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    String ticketInfo1 = 'Acces autorise a : ${GlobalData1.selectedValue1} personne(s)\n'
                        'Prix Total: ${GlobalData1.totalPrice1}';

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => QRCodePage1(ticketInfo1: ticketInfo1),
                      ),
                    );
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10), // Spécifiez le rayon souhaité ici
                    child: Container(
                      width: 120,
                      height: 120,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/mtn.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
