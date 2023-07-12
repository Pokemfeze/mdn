import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marcheedenoel/screen/login_screen.dart';

class navbarScreen extends StatefulWidget {
  const navbarScreen({super.key});

  @override
  State<navbarScreen> createState() => _navbarScreenState();
}

class _navbarScreenState extends State<navbarScreen> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView (
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text ('Maxime Feze'),
            accountEmail: const Text ('maximefeze@gmail.com'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset('assets/images/user.jpg'),
              ),
            ),
            decoration: const BoxDecoration(
              color: Colors.indigo,),
          ),
          ListTile(
            leading: const Icon(Icons.account_circle),
            title: const Text('Profile'),
            onTap: () => print("ok"),
          ),
          ListTile(
            leading: const Icon(Icons.message),
            title: const Text('Conctat'),
            onTap: () => print("ok"),
          ),
          ListTile(
            leading: const Icon(Icons.wallet_travel_outlined),
            title: const Text('Visa Appliaction'),
            onTap: () => print("ok"),
          ),
          ListTile(
            leading: const Icon(Icons.card_travel_outlined),
            title: const Text('Application In Court'),
            onTap: () => print("ok"),
          ),
          ListTile(
            leading: const Icon(Icons.airplane_ticket_outlined),
            title: const Text('Validate request'),
            onTap: () => print("ok"),
          ),

          ListTile(
            leading: const Icon(Icons.book),
            title: const Text('About'),
            onTap: () => print("ok"),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () { },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Sign Out'),
            onTap: () {
              FirebaseAuth.instance.signOut().then((value) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const LoginPage()));
              });
            },
          ),
        ],
      ),
    );
  }
}
