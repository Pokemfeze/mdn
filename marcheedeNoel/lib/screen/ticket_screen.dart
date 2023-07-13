import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ticket_widget/ticket_widget.dart';

class TicketPage extends StatefulWidget {
  const TicketPage({super.key});

  @override
  State<TicketPage> createState() => _TicketPageState();
}

class _TicketPageState extends State<TicketPage> {
  int selectedValue = 1;
  TextEditingController totalPriceController = TextEditingController();

  @override
  void dispose() {
    totalPriceController.dispose();
    super.dispose();
  }

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
            Text("Profitez des congés avec \nLe marché de Noël. ",
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
                                          selectedValue++;
                                          totalPriceController.text =
                                              (selectedValue * 500).toString();
                                        });
                                      },
                                    ),
                                    IconButton(
                                      icon: Icon(Icons.remove),
                                      onPressed: () {
                                        // Diminuer la valeur sélectionnée
                                        setState(() {
                                          if (selectedValue > 1) {
                                            selectedValue--;
                                            totalPriceController.text =
                                                (selectedValue * 500).toString();
                                          }
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              controller:
                              TextEditingController(text: selectedValue.toString()),
                              keyboardType: TextInputType.number,
                              onChanged: (value) {
                                // Mettre à jour la valeur sélectionnée
                                setState(() {
                                  selectedValue = int.tryParse(value) ?? selectedValue;
                                  totalPriceController.text =
                                      (selectedValue * 500).toString();
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
                              controller: totalPriceController,
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
                 onPressed: () {  },
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
}
