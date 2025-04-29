import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

// Définition d'une classe Homeplayer qui est un widget sans état (StatelessWidget)
class Homeplayer extends StatelessWidget {
  const Homeplayer({super.key}); // Constructeur avec clé optionnelle

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        child: Column(
          children: [
            const DrawerHeader(
              child: Text('Challenge Tracker', style: TextStyle(fontSize: 24)),
              padding: EdgeInsets.only(top: 30),
            ),
            // Partie scrollable avec les autres items
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  ListTile(
                    leading: const Icon(Icons.home),
                    title: const Text('Home'),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.star),
                    title: const Text('Rank'),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.person),
                    title: const Text('Profile'),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.message),
                    title: const Text('Messages'),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.group),
                    title: const Text("All challenges"),
                  ),
                ],
              ),
            ),

            // Déconnexion fixé en bas
            const Divider(), // Séparation visuelle
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text(
                'Déconnexion',
                style: TextStyle(color: Colors.red),
              ),
              onTap: () {
                Navigator.pop(context); // Action de déconnexion
              },
            ),
            const SizedBox(height: 16), // Petit espace en bas
          ],
        ),
      ),
      body: const Center(child: Text('Bienvenue dans Homeplayer')),
    );
  }
}
