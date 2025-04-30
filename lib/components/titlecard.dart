import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class Titlecard extends StatelessWidget {
  final String title;
  final String completed;
  const Titlecard({super.key, required this.title, required this.completed});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ShadCard(
      width: 350,
      child: Row(
        children: [
          Column(
            children: [
              Text(title, style: TextStyle(fontSize: 18, color: Colors.blue)),
              Text(
                "Completed all" + completed + "series",
                style: TextStyle(fontSize: 12),
              ),
            ],
          ),
          SizedBox(width: 30),
        ],
      ),
    );
  }
}
