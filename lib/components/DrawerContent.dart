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
          child: Text(
            'Challenge Tracker',
            style: TextStyle(fontSize: 24, color: Colors.black),
          ),
        ),
        Expanded(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              ListTile(
                leading: const Icon(Icons.home, color: Colors.black),
                title: const Text(
                  'Home',
                  style: TextStyle(color: Colors.black),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Homeplayer()),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.star, color: Colors.black),
                title: const Text(
                  'Rank',
                  style: TextStyle(color: Colors.black),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Rank()),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.person, color: Colors.black),
                title: const Text(
                  'Profile',
                  style: TextStyle(color: Colors.black),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProfilePage()),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.message, color: Colors.black),
                title: const Text(
                  'Chat',
                  style: TextStyle(color: Colors.black),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Chatpage()),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.group, color: Colors.black),
                title: const Text(
                  "All challenges",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        ),
        const Divider(),
        ListTile(
          leading: const Icon(Icons.logout, color: Colors.red),
          title: const Text('Deconnect', style: TextStyle(color: Colors.red)),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        const SizedBox(height: 16), 
      ],
    );
  }
}
