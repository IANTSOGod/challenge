import 'package:challenge/bloc/Bloc/InputBloc.dart';
import 'package:challenge/bloc/Bloc/LoginBloc.dart';
import 'package:challenge/bloc/Event/InputEvent.dart';
import 'package:challenge/bloc/Event/LoginEvent.dart';
import 'package:challenge/bloc/State/InputState.dart';
import 'package:challenge/bloc/State/LoginState.dart';
import 'package:challenge/components/AnimationLottie.dart';
import 'package:challenge/pages/HomePlayer.dart';
import 'package:challenge/pages/signup.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<ShadFormState>();
    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();

    return Scaffold(
      body: Center(
        child: BlocListener<LoginBloc, Loginstate>(
          listener:
              (listener, state) => {
                if (state is LoginStateDone)
                  {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Homeplayer()),
                    ),
                    context.read<LoginBloc>().add(LoginReset()),
                    _emailController.clear(),
                    _passwordController.clear(),
                  }
                else if (state is LoginStateError)
                  Fluttertoast.showToast(msg: state.error),
              },
          child: BlocBuilder<LoginBloc, Loginstate>(
            builder: (context, state) {
              if (state is LoginStateLoading) {
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
                          decoration: const ShadDecoration(color: Colors.white),
                          description: BlocBuilder<LoginBloc, Loginstate>(
                            builder: (context, state) {
                              if (state is LoginStateError &&
                                  state.error == "User non trouvé") {
                                return Text(
                                  state.error,
                                  style: TextStyle(color: Colors.red),
                                );
                              } else {
                                return SizedBox();
                              }
                            },
                          ),
                        ),
                        const SizedBox(height: 30),
                        BlocBuilder<InputBloc, InputState>(
                          builder: (context, state) {
                            return ShadInputFormField(
                              id: "Password",
                              label: const Text('Password'),
                              placeholder: const Text(
                                "Enter your password here",
                                style: TextStyle(color: Colors.black),
                              ),
                              controller: _passwordController,
                              obscureText:
                                  (state is InputShowing) ? false : true,
                              decoration: const ShadDecoration(
                                color: Colors.white,
                              ),
                              description: BlocBuilder<LoginBloc, Loginstate>(
                                builder: (context, state) {
                                  if (state is LoginStateError &&
                                      state.error == "Mot de passe invalide") {
                                    return Text(
                                      state.error,
                                      style: TextStyle(color: Colors.red),
                                    );
                                  } else {
                                    return SizedBox();
                                  }
                                },
                              ),
                              style: const TextStyle(color: Colors.black),
                              trailing: Padding(
                                padding: const EdgeInsets.only(right: 12),
                                child: ShadIconButton(
                                  width: 20,
                                  height: 20,
                                  backgroundColor: Colors.white,
                                  foregroundColor: Colors.black,
                                  icon: Icon(
                                    (state is InputShowing)
                                        ? LucideIcons.eyeOff
                                        : LucideIcons.eye,
                                    size: 20, // Taille raisonnable
                                  ),
                                  onPressed: () {
                                    context.read<InputBloc>().add(
                                      ChangeObscure(
                                        isObscure:
                                            (state is InputShowing)
                                                ? false
                                                : true,
                                      ),
                                    );
                                  },
                                ),
                              ),
                            );
                          },
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
                            context.read<LoginBloc>().add(LoginReset());
                            _emailController.clear();
                            _passwordController.clear();
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
