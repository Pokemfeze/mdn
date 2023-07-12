import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PostAppBar extends StatefulWidget {
  const PostAppBar({super.key});

  @override
  State<PostAppBar> createState() => _PostAppBarState();
}

class _PostAppBarState extends State<PostAppBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow:[
                BoxShadow(
                  color: Colors.white,
                  blurRadius: 6,
                ),
              ]
            ),
            child: Icon(
              Icons.arrow_back,
              size: 28,
              color: Colors.red,
            ),
          ),
        ),
        InkWell(
          onTap: (){},
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(color: Colors.black26,
                  blurRadius: 6,
                )
              ]
            ),
            child: Icon(
              Icons.favorite_outline,
              size: 28,
              color: Colors.red,
            ),
          ),
        )
      ],
    ),);
  }
}
