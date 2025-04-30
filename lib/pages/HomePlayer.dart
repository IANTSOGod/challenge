import 'package:challenge/components/challengeCard.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:challenge/components/DrawerContent.dart';

// Définition d'une classe Homeplayer qui est un widget sans état (StatelessWidget)
class Homeplayer extends StatelessWidget {
  const Homeplayer({super.key}); // Constructeur avec clé optionnelle

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(child: Drawercontent()),
      body: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 350),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 30),
            Row(
              children: [
                SizedBox(width: 30),
                ShadIconButton(icon: Icon(Icons.star)),
                SizedBox(width: 30),
                const Text("New challenges", style: TextStyle(fontSize: 20)),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: 30, top: 10),
              child: ShadCard(
                padding: EdgeInsets.all(1.00),
                width: 350,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Challengecard(
                      title: "Titre",
                      description: "This is a description",
                      point: 100,
                    ),
                    Challengecard(
                      title: "Titre 2",
                      description: "This is a description",
                      point: 30,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 50),
            Row(
              children: [
                SizedBox(width: 30),
                ShadIconButton(icon: Icon(Icons.pending)),
                SizedBox(width: 30),
                const Text(
                  "Pending challenges",
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.only(left: 30, top: 10),
              child: ShadCard(
                padding: EdgeInsets.all(2.00),
                width: 350,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Challengecard(
                      title: "Titre",
                      description: "This is a description",
                      point: 100,
                    ),
                    Challengecard(
                      title: "Titre 2",
                      description: "This is a description",
                      point: 30,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
