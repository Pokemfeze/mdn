 import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marcheedenoel/screen/payscreen.dart';
import 'package:ticket_widget/ticket_widget.dart';

import '../services/data1.dart';

class TicketPage1 extends StatefulWidget {
   const TicketPage1({super.key});

   @override
   State<TicketPage1> createState() => _TicketPage1State();
 }

 class _TicketPage1State extends State<TicketPage1> {
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
               "Ticket Manege".toUpperCase(),
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
                               backgroundImage: AssetImage("assets/images/photo3.jpg"),
                             ),
                           ),
                           const SizedBox(height: 15),
                           const Text(
                             "1500",
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
                                               GlobalData1.selectedValue1++;
                                               GlobalData1.totalPrice1 = GlobalData1.selectedValue1 * 1500;
                                             });
                                           },
                                         ),
                                         IconButton(
                                           icon: Icon(Icons.remove),
                                           onPressed: () {
                                             // Diminuer la valeur sélectionnée
                                             setState(() {
                                               if (GlobalData1.selectedValue1 > 1) {
                                                 GlobalData1.selectedValue1--;
                                                 GlobalData1.totalPrice1 = GlobalData1.selectedValue1 * 1500;
                                               }
                                             });
                                           },
                                         ),
                                       ],
                                     ),
                                   ),
                                   controller:
                                   TextEditingController(text: GlobalData1.selectedValue1.toString()),
                                   keyboardType: TextInputType.number,
                                   onChanged: (value) {
                                     // Mettre à jour la valeur sélectionnée
                                     setState(() {
                                       GlobalData1.selectedValue1 = int.tryParse(value) ?? GlobalData1.selectedValue1;
                                       GlobalData1.totalPrice1 = GlobalData1.selectedValue1 * 1500;
                                     });
                                   },
                                 ),
                               ),
                             ],
                           ),
                           const SizedBox(height: 10),
                           Row(
                             mainAxisAlignment: MainAxisAlignment.center,
                             children: [
                               Expanded(
                                 child: TextFormField(
                                   enabled: false,
                                   controller: TextEditingController(text: GlobalData1.totalPrice1.toString()),
                                   decoration: const InputDecoration(
                                     labelText: 'Prix Total',
                                   ),
                                 ),
                               ),
                             ],
                           ),
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
                     String ticketInfo = 'Nombre de personne: ${GlobalData1.selectedValue1}\n'
                         'Prix Total: ${GlobalData1.totalPrice1}';

                     Navigator.push(
                       context,
                       MaterialPageRoute(
                         builder: (context) => PayPage(),
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
 }
