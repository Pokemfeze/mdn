import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marcheedenoel/screen/ticket_screen.dart';

class ChoixTicketPage extends StatefulWidget {
  const ChoixTicketPage({super.key});

  @override
  State<ChoixTicketPage> createState() => _ChoixTicketPageState();
}

class _ChoixTicketPageState extends State<ChoixTicketPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'CHOIX TICKET',
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TicketPage(),
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
                          image: AssetImage('assets/images/photo10.jpg'),
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
                          image: AssetImage('assets/images/photo3.jpg'),
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
