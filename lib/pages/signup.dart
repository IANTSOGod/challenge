import 'package:challenge/pages/otpverification.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<ShadFormState>();

    return Scaffold(
      body: Center(
        child: ShadForm(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 350),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Sign up",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                ShadInputFormField(
                  id: "first_name",
                  label: const Text("First name"),
                  placeholder: const Text("Enter your first name here"),
                ),
                const SizedBox(height: 10),
                ShadInputFormField(
                  id: "last_name",
                  label: const Text('Last name'),
                  placeholder: const Text("Enter your last name here"),
                ),
                const SizedBox(height: 10),
                ShadInputFormField(
                  id: 'email',
                  label: const Text("Email"),
                  placeholder: const Text("Enter your email here"),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 10),
                ShadInputFormField(
                  id: "password",
                  label: const Text("Password"),
                  placeholder: const Text("Enter your password here"),
                ),
                const SizedBox(height: 50),
                ShadButton(
                  width: 350,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Otpverification(),
                      ),
                    );
                  },
                  child: Text(
                    "Create account",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 10),
                ShadButton.secondary(
                  width: 350,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Go back",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
