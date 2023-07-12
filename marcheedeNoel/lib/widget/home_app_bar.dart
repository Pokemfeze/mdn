import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../screen/navbar.dart';

class HomeAppBar extends StatefulWidget {
  const HomeAppBar({super.key});

  @override
  State<HomeAppBar> createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () {
            drawer: const navbarScreen();
          },
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 6,
                )
              ],
              borderRadius: BorderRadius.circular(15),
            ),
            child: const Icon(
              Icons.sort_rounded,
              size: 28,
              color: Colors.red,
            ),
          ),
        ),
        Row(
          children: const [
            Icon(
              Icons.place_sharp,
              color: Colors.red,
            ),
            Text("Marchée De Noël",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),)
          ],
        ),
        InkWell(
          onTap: () {},
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 6,
                )
              ],
              borderRadius: BorderRadius.circular(15),
            ),
            child: const Icon(
              Icons.search,
              size: 28,
              color: Colors.red,
            ),
          ),
        ),
      ],
    ),);
  }
}
