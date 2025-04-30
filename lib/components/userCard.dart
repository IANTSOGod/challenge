import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class Usercard extends StatelessWidget {
  final String username;
  const Usercard({super.key,required this.username});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10),
      child: ShadCard(
        child: Row(
          children: [
            const ShadAvatar(
              'https://app.requestly.io/delay/2000/avatars.githubusercontent.com/u/124599?v=4',
              placeholder: Text('CN'),
              size: Size(50, 50),
            ),
            const SizedBox(width: 20),
            const Text("Username", style: TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}
