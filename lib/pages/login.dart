import 'package:challenge/pages/HomePlayer.dart';
import 'package:challenge/pages/signup.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<ShadFormState>();
    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();

    return Scaffold(
      body: Center(
        child: ShadForm(
          key: formKey,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 350),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Login",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 50),
                ShadInputFormField(
                  id: "Email",
                  label: const Text("Email"),
                  placeholder: const Text("Enter your email here"),
                  controller: _emailController,
                ),
                const SizedBox(height: 16),
                ShadInputFormField(
                  id: "Password",
                  label: const Text('Password'),
                  placeholder: const Text("Enter your password here"),
                  controller: _passwordController,
                  obscureText: true,
                ),
                const SizedBox(height: 30),
                ShadButton(
                  width: 350,
                  onPressed: () {
                    if (_emailController.text == "client@gmail.com") {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Homeplayer(),
                        ),
                      );
                    }
                  },
                  child: Text(
                    "Login",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 10),
                ShadButton.secondary(
                  width: 350,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Signup()),
                    );
                  },
                  child: Text(
                    "Sign up",
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
