
import 'package:flutter/material.dart';
import 'package:marcheedenoel/screen/qrcode.dart';
import 'package:marcheedenoel/screen/qrcode1.dart';

import '../model/ListDataModel.dart';
import '../model/ListDataModel1.dart';
import '../services/data1.dart';
import 'home_screen.dart';

class ListQrCode1 extends StatefulWidget {
  const ListQrCode1({super.key});

  @override
  State<ListQrCode1> createState() => _ListQrCode1State();
}

class _ListQrCode1State extends State<ListQrCode1> {

  List<String> qrCodes = [];

  static List<String> Listqr = ['Fun City','Fun City','Fun City'];

  static List url = [
  'https://st2.depositphotos.com/27392032/48249/i/1600/depositphotos_482496714-stock-photo-code-icon-smartphone-scan-code.jpg',
  'https://st2.depositphotos.com/27392032/48249/i/1600/depositphotos_482496714-stock-photo-code-icon-smartphone-scan-code.jpg',
  'https://st2.depositphotos.com/27392032/48249/i/1600/depositphotos_482496714-stock-photo-code-icon-smartphone-scan-code.jpg' ];

  final List<ListDataModel1> ListData = List.generate(
  Listqr.length, (index) =>
  ListDataModel1("${Listqr[index]}", "${url[index]}", "${Listqr[index]}"));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Liste QR Code Fun City",
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
                String ticketInfo = 'Acces autorise a : ${GlobalData1.selectedValue1} personne(s)\n';
                //'Prix Total: ${GlobalData.totalPrice}';

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QRCodePage1(ticketInfo1: ticketInfo),
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
