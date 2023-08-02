 import 'package:flutter/material.dart';
import 'package:marcheedenoel/screen/qrcode.dart';

import '../model/ListDataModel.dart';
import '../services/data.dart';
import 'home_screen.dart';

 class ListQRCode extends StatefulWidget {

   const ListQRCode({super.key});

   @override
   State<ListQRCode> createState() => _ListQRCodeState();
 }

 class _ListQRCodeState extends State<ListQRCode> {
   List<String> qrCodes = [];
   static List<String> Listqr = ['Entree','Entree','Entree'];

   static List url = [
     'https://st2.depositphotos.com/27392032/48249/i/1600/depositphotos_482496714-stock-photo-code-icon-smartphone-scan-code.jpg',
     'https://st2.depositphotos.com/27392032/48249/i/1600/depositphotos_482496714-stock-photo-code-icon-smartphone-scan-code.jpg',
     'https://st2.depositphotos.com/27392032/48249/i/1600/depositphotos_482496714-stock-photo-code-icon-smartphone-scan-code.jpg' ];

   final List<ListDataModel> ListData = List.generate(
       Listqr.length, (index) =>
   ListDataModel("${Listqr[index]}", "${url[index]}", "${Listqr[index]}"));
   @override
   Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(
         title: const Text(
           "Liste QR Code d'Acces",
           style: TextStyle(color: Colors.white),
         ),
         leading: IconButton(
           icon: Icon(Icons.arrow_back),
           onPressed: () {
             Navigator.push(context, MaterialPageRoute(builder: (context) => const Homepage()));
           },
         ),
       ),
       body: ListView.builder(
         itemCount: ListData.length,
         itemBuilder: (context, index) {
           return Card(
             child: ListTile(
               title: Text(
                ListData[index].name
               ),
               leading: SizedBox(
                 width: 50,
                 height: 50,
                 child: Image.network(ListData[index].ImageUrl),
               ),
               onTap: (){
                 String ticketInfo = 'Acces autorise a : ${GlobalData.selectedValue} personne(s)\n';
                     //'Prix Total: ${GlobalData.totalPrice}';

                 Navigator.push(
                   context,
                   MaterialPageRoute(
                     builder: (context) => QRCodePage(ticketInfo: ticketInfo),
                   ),
                 );
               },
             ),
           );
         },
       ),
     );
   }
 }
