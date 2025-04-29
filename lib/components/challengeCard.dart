import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class Challengecard extends StatelessWidget {
  final String title;
  final String description;
  final int point;
  Challengecard({super.key,required this.title,required this.description,required this.point});

  @override
  Widget build(BuildContext context) {
    return ShadCard(
      width: 300,
      child: Row(
        children: [
          Column(
            children: [
              Text(title),
              Text(
                description,
                style: TextStyle(fontSize: 12),
              ),
            ],
          ),
          SizedBox(width: 30),
          Text(
            point.toString()+"XP",
            style: TextStyle(
              color: Colors.blue,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
