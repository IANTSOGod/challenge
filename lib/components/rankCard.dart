import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class Rankcard extends StatelessWidget {
  final int rank;
  final String username;
  final int level;
  final int xp;
  const Rankcard({
    super.key,
    required this.rank,
    required this.username,
    required this.level,
    required this.xp,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 30),
      child: ShadCard(
        backgroundColor: Color(0xFFCACACA),
        child: Row(
          children: [
            Text(
              rank.toString(),
              style: TextStyle(fontSize: 20, color: Colors.blue),
            ),
            SizedBox(width: 20),
            Column(
              children: [
                Text(username, style: TextStyle(color: Colors.blueAccent)),
                Text(
                  "Lv" + level.toString(),
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
            SizedBox(width: 100),
            Text(
              "${xp.toString()} XP",
              style: TextStyle(
                color: Colors.blueAccent,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
