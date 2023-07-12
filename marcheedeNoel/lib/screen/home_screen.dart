
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marcheedenoel/screen/post_screen.dart';
import 'package:marcheedenoel/widget/home_app_bar.dart';
import 'package:marcheedenoel/widget/homebottombar.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  List<String> imageTexts = [
    "Toupie Geante",
    "Voiturette",
    "Tamponeuse",
    "Baby-Foot",
    "Arcane",
    "jeux-video",
    "Realite-Virtuel",
    "Lazer-Game",
    // Ajoutez les autres textes ici
  ];

  var category = [
    "Restaurant",
    "Tombola",
    "Concours",
    "Concert",
    "Manege",
    "Pimenterie",
    "emplacement",
  ];

  List<String> texts = [
    "Concert",
    "Spectacle",
    "Fun City",
    "Stand VIP",
    "Stand Classique",
    "Gastro",
    "Façade",
  ];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(90.0),
        child: HomeAppBar(),
      ),
      body: SafeArea(
          child: Padding(
              padding: EdgeInsets.symmetric(vertical: 30),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                        child: Container(
                          height: 200,
                          child: ListView.builder(
                            itemCount: 8,
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context, int index) {
                              return InkWell(
                                onTap: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) => PostPage()));
                                },
                                child: Container(
                                  width: 160,
                                  padding: EdgeInsets.all(20),
                                  margin: EdgeInsets.only(left: 15),
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(15),
                                    image: DecorationImage(
                                      image: AssetImage("assets/images/image${index + 1}.jpg"),
                                      fit: BoxFit.cover,
                                      opacity: 0.7,
                                    ),
                                  ),
                                  child: Column(
                                    children: [
                                      Container(
                                        alignment: Alignment.topRight,
                                        child: const Icon(
                                          Icons.bookmark_border_outlined,
                                          color: Colors.white,
                                          size: 30,
                                        ),
                                      ),
                                      const Spacer(),
                                      Container(
                                        alignment: Alignment.bottomLeft,
                                        child: Text(
                                          imageTexts[index], // Utilisez le texte correspondant à l'index
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        )
                    ),
                  ],
                ),
                SizedBox(height: 20),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Row(
                      children: [
                        for(int i = 0; i<7; i++)
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 4,
                              )
                            ]
                          ),
                          child: Text (
                            category[i],
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),

                  ),
                ),
                const SizedBox(height: 10,),
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: texts.length, // Utilisez la longueur de la liste "texts"
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index ){
                    return Padding(
                      padding: EdgeInsets.all(15),
                      child: Column(
                        children: [
                          InkWell (
                            onTap: (){
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => PostPage()));
                            },
                            child: Container(
                              height: 200,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(15),
                                image: DecorationImage(
                                  image: AssetImage("assets/images/photo${index+1}.jpg"),
                                  fit: BoxFit.cover,
                                  opacity: 0.8,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  texts[index], // Utilisez le texte correspondant à l'index actuel
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.red,
                                  ),
                                ),
                                const Icon(
                                  Icons.more_vert,
                                  size: 30,
                                  color: Colors.red,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          ),
      ),
      bottomNavigationBar: HomeBottomBar(),
    );
  }
}
