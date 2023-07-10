import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marcheedenoel/cliper/cliper.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();

    Widget _builEmail(){
      return Container(
        height: 50,
        decoration:  BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              offset: Offset(3,3),
              blurRadius: 6,
              color: Colors.grey.shade400,
            )
          ]
        ),
        child: TextFormField(
          validator: (value){
            if (value == null || value.isEmpty){
              return"Entre votre Email";
            }
          },
          controller: emailController,
          decoration: const InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(top: 14),
            prefixIcon: Icon(
              Icons.email_outlined
            ),
            hintText: 'Entrer votre Email'
          ),
        ),
      );
    }

    Widget _builPassword(){
      return Container(
        height: 50,
        decoration:  BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                offset: Offset(3,3),
                blurRadius: 6,
                color: Colors.grey.shade400,
              )
            ]
        ),
        child: TextFormField(
          validator: (value){
            if (value == null || value.isEmpty){
              return"Entre votre Mot de Passe";
            }
          },
          controller: emailController,
          decoration: const InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14),
              prefixIcon: Icon(
                  Icons.lock_outline_rounded
              ),
              hintText: 'Entrer votre Mot de Passe'
          ),
        ),
      );
    }

    return Scaffold(
      body: Column(
        children: [
            Stack(
              children: [
             CustomPaint(
              size: Size(MediaQuery.of(context).size.width,300),
              painter: RPSCustomPainter(),
                ),
                Positioned(
                  top: 16,
                  right : -5,
                  child:  CustomPaint(
                    size: Size(MediaQuery.of(context).size.width,300),
                    painter: RPSCustomPainter(),
                  ),
                ),
                Positioned(
                  top: 220,
                  left: 20,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text("Se Connecter",
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 26,
                      ),
                      ),
                      Text("S'il vous plait connectez vous pour continuer",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 17,
                        ),
                      ),
                      SizedBox(height: 10,),
                    ],
                  ),
                )
         ],
       ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children:  [
              const SizedBox(height: 25,),
              _builEmail(),
              const SizedBox(height: 20,),
              _builPassword(),
              const SizedBox(height: 50,),
              Container(
                height: 50,
                width: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xffea8080),
                      Color(0xfff53c3c),
                    ]
                  )
                ),
                child: Row(
                  children: const [
                    SizedBox(width: 20,),
                    Text("Se Connecter",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 17,
                      color: Colors.white
                    ),),
                    Icon(Icons.arrow_forward,
                    color: Colors.white,)
                  ],
                ),
              ),
              const SizedBox(height: 130,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text("Vous n'avez pas de compte ?",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.black
                  ),
                  ),
                  Text("S'incrire",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color(0xfff53c3c),
                    ),)
                ],
              )
            ],
          ),)
      ],
      ),
    );
  }
}
