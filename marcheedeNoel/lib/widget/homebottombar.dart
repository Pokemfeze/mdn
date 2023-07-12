import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeBottomBar extends StatefulWidget {
  const HomeBottomBar({super.key});

  @override
  State<HomeBottomBar> createState() => _HomeBottomBarState();
}

class _HomeBottomBarState extends State<HomeBottomBar> {
  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      backgroundColor: Colors.transparent,
      index: 2,
      items: const [
        Icon(Icons.person_outline, size: 30),
        Icon(Icons.sticky_note_2_outlined, size: 30),
        Icon(Icons.home, size: 30,color: Colors.red,),
        Icon(Icons.list, size: 30),
        Icon(Icons.location_on_outlined, size: 30),
      ],
    );
  }
}
