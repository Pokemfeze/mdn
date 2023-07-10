import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marcheedenoel/screen/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override

  void initState(){
    Timer(const Duration(seconds: 3), (){
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=>LoginPage()), (route) => false);
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red, // Mettre le fond de la page en rouge
      body: Center(
        child: Hero(
          tag: "logo",
            child: Image.asset('assets/images/logo.png'),

        ),
      ),
    );
  }
}
