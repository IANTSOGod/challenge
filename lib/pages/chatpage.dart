import 'package:challenge/components/userCard.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class Chatpage extends StatelessWidget {
  const Chatpage({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<ShadFormState>();
    final TextEditingController _searchController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 350),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10, bottom: 30),
                child: ShadForm(
                  key: _formKey,
                  child: Stack(
                    alignment: Alignment.centerRight,
                    children: [
                      ShadInputFormField(
                        placeholder: const Text(
                          "Enter a username here",
                          style: TextStyle(color: Colors.black),
                        ),
                        controller: _searchController,
                        style: const TextStyle(color: Colors.black),
                        decoration: const ShadDecoration(
                          color: Colors.white, // Optionnel : bordure visible
                        ),
                      ),
                      Positioned(
                        right: 0,
                        child: IconButton(
                          onPressed: () {
                            // Logique de recherche à implémenter ici
                          },
                          icon: Icon(Icons.search, color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Usercard(username: "iantso"),
              Usercard(username: "test"),
            ],
          ),
        ),
      ),
    );
  }
}
