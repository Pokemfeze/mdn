
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:marcheedenoel/model/ticketmodel.dart';

class DatabaseService {
  final CollectionReference _tickets = FirebaseFirestore.instance.collection('Tickets');

  void addTicket(Tickets tickets){
     _tickets.add({
       "nbrpersonne": tickets.nbrperssonne,
       "prixtotal":tickets.prixTotal,
     });
  }

}