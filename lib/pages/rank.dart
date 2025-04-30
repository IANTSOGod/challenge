import 'package:flutter/material.dart';
import 'package:challenge/components/rankCard.dart';

class Rank extends StatelessWidget {
  const Rank({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 350),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Rankcard(rank: 1, username: "username", level: 2, xp: 100),
            Rankcard(rank: 2, username: "username", level: 2, xp: 100),
            Rankcard(rank: 3, username: "username", level: 2, xp: 100),
            Rankcard(rank: 4, username: "username", level: 2, xp: 100),
            Rankcard(rank: 5, username: "username", level: 2, xp: 100),
            Rankcard(rank: 6, username: "username", level: 2, xp: 100),
            Rankcard(rank: 7, username: "username", level: 2, xp: 100),
          ],
        ),
      ),
    );
  }
}
