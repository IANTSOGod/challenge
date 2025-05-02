import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class Challengecard extends StatelessWidget {
  final String title;
  final String description;
  final int point;
  const Challengecard({
    super.key,
    required this.title,
    required this.description,
    required this.point,
  });

  @override
  Widget build(BuildContext context) {
    return ShadCard(
      width: 350,
      backgroundColor: Color(0xFFCACACA),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(title, style: TextStyle(color: Colors.black)),
              Expanded(
                flex: 0,
                child: Text(
                 overflow: TextOverflow.fade,
                  description,
                  style: TextStyle(fontSize: 12, color: Colors.black),
                ),
              ),
            ],
          ),
          // SizedBox(width: 30),
          Text(
            point.toString() + "XP",
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
