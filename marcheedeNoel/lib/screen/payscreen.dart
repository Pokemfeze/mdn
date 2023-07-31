import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marcheedenoel/screen/qrcode.dart';

import '../services/data.dart';

class PayPage extends StatefulWidget {
  const PayPage({super.key});

  @override
  State<PayPage> createState() => _PayPageState();
}

class _PayPageState extends State<PayPage> {
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
                    String ticketInfo = 'Nombre de personne: ${GlobalData.selectedValue}\n'
                        'Prix Total: ${GlobalData.totalPrice}';

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => QRCodePage(ticketInfo: ticketInfo),
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
                    // Action deuxième bouton
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
