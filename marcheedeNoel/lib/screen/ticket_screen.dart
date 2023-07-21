import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marcheedenoel/screen/qrcode.dart';
import 'package:ticket_widget/ticket_widget.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/ticketmodel.dart';
import '../services/dbservices.dart';

class TicketPage extends StatefulWidget {
  const TicketPage({super.key});

  @override
  State<TicketPage> createState() => _TicketPageState();
}

class _TicketPageState extends State<TicketPage> {
  int totalPrice = 0;
  int _selectedValue = 1;
  //TextEditingController totalPriceController = TextEditingController();

  @override
 

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: 25,
                )
              ],
            ),
          //  const SizedBox(height: 20),
            Text(
              "Votre ticket".toUpperCase(),
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 25,
              ),
            ),
            //const SizedBox(height: 15),
            const Text("Profitez des congés avec \nLe marché de Noël. ",
            style: TextStyle(
              fontSize: 16,
              fontStyle: FontStyle.italic,
              color: Colors.white,
            ),
            ),
            //const SizedBox(height: 25),
        TicketWidget(
          width: 300,
          height: 450,
          isCornerRounded: true,
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      const CircleAvatar(
                        backgroundColor: Colors.redAccent,
                        radius: 65,
                        child: CircleAvatar(
                          backgroundColor: Colors.black87,
                          radius: 60,
                          backgroundImage: AssetImage("assets/images/photo10.jpg"),
                        ),
                      ),
                      const SizedBox(height: 15),
                      const Text(
                        "500",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.location_on,
                            color: Colors.grey,
                            size: 18,
                          ),
                          Text(
                            "Marché de Noël",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Colors.redAccent,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: TextFormField(
                              decoration: InputDecoration(
                                labelText: 'Nombre de personne',
                                suffixIcon: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                      icon: Icon(Icons.add),
                                      onPressed: () {
                                        // Augmenter la valeur sélectionnée
                                        setState(() {
                                          _selectedValue++;
                                          totalPrice = _selectedValue * 500;
                                        });
                                      },
                                    ),
                                    IconButton(
                                      icon: Icon(Icons.remove),
                                      onPressed: () {
                                        // Diminuer la valeur sélectionnée
                                        setState(() {
                                          if (_selectedValue > 1) {
                                            _selectedValue--;
                                            totalPrice = _selectedValue * 500;
                                          }
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              controller:
                              TextEditingController(text: _selectedValue.toString()),
                              keyboardType: TextInputType.number,
                              onChanged: (value) {
                                // Mettre à jour la valeur sélectionnée
                                setState(() {
                                  _selectedValue = int.tryParse(value) ?? _selectedValue;
                                  totalPrice = _selectedValue * 500;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: TextFormField(
                              enabled: false,
                              controller: TextEditingController(text: totalPrice.toString()),
                              decoration: InputDecoration(
                                labelText: 'Prix Total',
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      const Text("*Seul les enfants de moins de 2 ans "
                          "ne paye pas l'entree  ")
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
            SizedBox(
              height: 40,
              width: 140,
              child: ElevatedButton(
                 onPressed: () {
                   String ticketInfo = 'Nombre de personne: $_selectedValue\n'
                       'Prix Total: $totalPrice';

                   Navigator.push(
                     context,
                     MaterialPageRoute(
                       builder: (context) => QRCodePage(ticketInfo: ticketInfo),
                     ),
                   );
                   //onsave(context, _selectedValue, totalPrice);
                  // saveFormData();
                 },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber,
                ) ,
                child: const Text('Payer')
              ),
            )
          ],
        ),
      ),
    );
  }

void onsave(context,selectevalue,_totalPrice) async {
  try{
  DatabaseService db = DatabaseService();
  db.addTicket(Tickets(
      nbrperssonne: _selectedValue,
      prixTotal: totalPrice,
  ));
  print('Données sauvegardées avec succès.');

  }
  catch (e) {
    print('Erreur lors de la sauvegarde des données : $e');
  }
  }
}

