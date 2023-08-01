 import 'package:flutter/material.dart';
import 'package:marcheedenoel/screen/listqrcode.dart';

class Choix extends StatefulWidget {
   const Choix({super.key});

   @override
   State<Choix> createState() => _ChoixState();
 }

 class _ChoixState extends State<Choix> {


   @override
   Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(
         title: const Text(
           'TICKET',
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
                     Navigator.push(context, MaterialPageRoute(builder: (context) => const ListQRCode( )));
                   },
                   child: ClipRRect(
                     borderRadius: BorderRadius.circular(10), // Spécifiez le rayon souhaité ici
                     child: Container(
                       width: 120,
                       height: 120,
                       decoration: const BoxDecoration(
                         image: DecorationImage(
                           image: AssetImage('assets/images/photo10.jpg'),
                           fit: BoxFit.cover,
                         ),
                       ),
                     ),
                   ),
                 ),

                 InkWell(
                   onTap: () {

                   },
                   child: ClipRRect(
                     borderRadius: BorderRadius.circular(10), // Spécifiez le rayon souhaité ici
                     child: Container(
                       width: 120,
                       height: 120,
                       decoration: const BoxDecoration(
                         image: DecorationImage(
                           image: AssetImage('assets/images/photo3.jpg'),
                           fit: BoxFit.cover,
                         ),
                       ),
                     ),
                   ),
                 ),
               ],
             ),
             SizedBox(height: 20),
             Row(
               children: const [
                 SizedBox(width: 60),
                 Text(
                   "Ticket D'entree",
                   style: TextStyle(fontSize: 18),
                 ),

                 SizedBox(width: 60),
                 Text(
                   'Ticket Manege',
                   style: TextStyle(fontSize: 18),
                 ),
               ],
             )
           ],
         ),
       ),
     );
   }
 }
