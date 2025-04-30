import 'package:challenge/components/titlecard.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

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
            SizedBox(height: 30),
            Center(
              child: const ShadAvatar(
                'https://app.requestly.io/delay/2000/avatars.githubusercontent.com/u/124599?v=4',
                placeholder: Text('CN'),
                size: Size(130, 130),
              ),
            ),
            SizedBox(height: 10),
            Center(
              child: const Text(
                "Username",
                style: TextStyle(fontSize: 25, color: Colors.blue),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "LV2",
                    style: TextStyle(fontSize: 20, color: Colors.orange),
                  ),
                  SizedBox(width: 20),
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.sizeOf(context).width * 0.6,
                    ),
                    child: const ShadProgress(
                      value: 0.5,
                      color: Colors.orange,
                      backgroundColor: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50),
            const Text("My titles", style: TextStyle(fontSize: 20)),
            Padding(
              padding: EdgeInsets.only(left: 30, top: 10),
              child: ShadCard(
                padding: EdgeInsets.all(1.00),
                width: 350,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Titlecard(title: "Pro eater", completed: "Pro eater"),
                    Titlecard(title: "Pro eater", completed: "Pro eater"),
                    Titlecard(title: "Pro eater", completed: "Pro eater"),
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
