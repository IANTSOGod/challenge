import 'package:challenge/components/DrawerContent.dart';
import 'package:flutter/material.dart';

class Rank extends StatelessWidget {
  Rank({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(child: Drawercontent()),
      body: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 350),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            
          ],
        ),
      ),
    );
  }
}
