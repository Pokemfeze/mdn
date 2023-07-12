import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PostBottombar extends StatefulWidget {
  const PostBottombar({super.key});

  @override
  State<PostBottombar> createState() => _PostBottombarState();
}

class _PostBottombarState extends State<PostBottombar> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      height: MediaQuery.of(context).size.height/2,
      padding: EdgeInsets.only(top: 20, left: 20,right: 20),
      decoration: const BoxDecoration(
        color: Color(0xFFE8E7E7),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: ListView(
        children: [
          Padding(
              padding: EdgeInsets.only(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text("Marché de Noël,Douala",
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w600,
                ),
                ),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 23,
                      )
                    ],
                  )
                ],
              ),
              SizedBox(height: 20),
               const Text(
                   "Un marché de Noël est un marché en plein air associé à la célébration de Noël et qui se tient "
                       "traditionnellement pendant l'Avent. On y trouve tout ce qui touche aux fêtes de Noël et de la"
                       " Saint-Nicolas.",
               style: TextStyle(color: Colors.black54,
               fontSize: 16),
               textAlign: TextAlign.justify,),
              SizedBox(height: 20),
              Row(
                children: [
                  Padding(
                      padding: EdgeInsets.only(right: 5),
                    child: Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset("assets/images/photo1.jpg", fit: BoxFit.cover,
                        width: 95,
                        height: 80,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 5),
                    child: Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset("assets/images/photo2.jpg", fit: BoxFit.cover,
                          width: 95,
                          height: 80,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        width: 95,
                        height: 80,
                        margin: EdgeInsets.only(right: 5),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                              image: AssetImage("assets/images/photo4.jpg"),
                          fit: BoxFit.cover,
                          opacity: 0.4,
                          ),
                        ),
                        child: Text(
                          "10+",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      )
                  )
                ],
              )
            ],
          ),
          ),
        ],
      ),
    );
  }
}
