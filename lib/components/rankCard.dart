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
    // TODO: implement build
    return ShadCard(
      child: Row(
        children: [
          Text(rank.toString()),
          SizedBox(width: 10),
          Column(children: [Text(username), Text("Lv" + level.toString())]),
          SizedBox(width: 30),
          Text(xp.toString() + "XP"),
        ],
      ),
    );
  }
}
