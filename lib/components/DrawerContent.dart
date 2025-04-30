import 'package:challenge/pages/HomePlayer.dart';
import 'package:challenge/pages/chatpage.dart';
import 'package:challenge/pages/profile.dart';
import 'package:challenge/pages/rank.dart';
import 'package:flutter/material.dart';

class Drawercontent extends StatelessWidget {
  const Drawercontent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const DrawerHeader(
          padding: EdgeInsets.only(top: 30),
          child: Text('Challenge Tracker', style: TextStyle(fontSize: 24)),
        ),
        Expanded(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text('Home'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Homeplayer()),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.star),
                title: const Text('Rank'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Rank()),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.person),
                title: const Text('Profile'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProfilePage()),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.message),
                title: const Text('Messages'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Chatpage()),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.group),
                title: const Text("All challenges"),
              ),
            ],
          ),
        ),
        const Divider(),
        ListTile(
          leading: const Icon(Icons.logout, color: Colors.red),
          title: const Text('Déconnexion', style: TextStyle(color: Colors.red)),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        const SizedBox(height: 16), // Petit espace en bas
      ],
    );
  }
}
