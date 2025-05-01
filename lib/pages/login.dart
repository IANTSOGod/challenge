import 'package:challenge/bloc/Bloc/LoginBloc.dart';
import 'package:challenge/bloc/Event/LoginEvent.dart';
import 'package:challenge/bloc/State/LoginState.dart';
import 'package:challenge/components/AnimationLottie.dart';
import 'package:challenge/pages/HomePlayer.dart';
import 'package:challenge/pages/signup.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
        child: BlocListener<LoginBloc, LoginState>(
          listener:
              (listener, state) => {
                if (state.isSuccess == true && state.errorMessage == "")
                  {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Homeplayer()),
                    ),
                  },
              },
          child: BlocBuilder<LoginBloc, LoginState>(
            builder: (context, state) {
              if (state.isLoading == true) {
                return AnimationLottie(
                  filePath: "assets/animations/loading.json",
                );
              } else {
                return ShadForm(
                  key: formKey,
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 350),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          "Login",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 50),
                        ShadInputFormField(
                          id: "Email",
                          label: const Text("Email"),
                          placeholder: const Text(
                            "Enter your email here",
                            style: TextStyle(color: Colors.black),
                          ),
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          style: const TextStyle(color: Colors.black),
                          decoration: const ShadDecoration(
                            color: Colors.white, // Optionnel : bordure visible
                          ),
                        ),
                        const SizedBox(height: 16),
                        ShadInputFormField(
                          id: "Password",
                          label: const Text('Password'),
                          placeholder: const Text(
                            "Enter your password here",
                            style: TextStyle(color: Colors.black),
                          ),
                          controller: _passwordController,
                          obscureText: true,
                          decoration: const ShadDecoration(color: Colors.white),
                          style: const TextStyle(color: Colors.black),
                        ),
                        const SizedBox(height: 30),
                        ShadButton(
                          width: 350,
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              final email = _emailController.text;
                              final password = _passwordController.text;
                              context.read<LoginBloc>().add(
                                LoginSubmitted(
                                  email: email,
                                  password: password,
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
                              MaterialPageRoute(
                                builder: (context) => const Signup(),
                              ),
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
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
