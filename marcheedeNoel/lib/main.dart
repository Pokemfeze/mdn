import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:marcheedenoel/screen/choixticket_screen.dart';
import 'package:marcheedenoel/screen/googleMap.dart';
import 'package:marcheedenoel/screen/home_screen.dart';
import 'package:marcheedenoel/screen/listqrcode.dart';
import 'package:marcheedenoel/screen/payscreen.dart';
import 'package:marcheedenoel/screen/qrscanner_screen.dart';
import 'package:marcheedenoel/screen/signup_screen.dart';
import 'package:marcheedenoel/screen/splash_screen.dart';
import 'package:marcheedenoel/screen/ticket_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  get ticketInfo => ticketInfo;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.red,
      ),
      home: SplashScreen()
    );
  }
}



