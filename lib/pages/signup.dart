import 'package:challenge/bloc/Bloc/SignupBloc.dart';
import 'package:challenge/bloc/Event/SignupEvent.dart';
import 'package:challenge/bloc/State/SignupState.dart';
import 'package:challenge/components/AnimationLottie.dart';
import 'package:challenge/pages/otpverification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<ShadFormState>();
    final TextEditingController _emailcontroller = TextEditingController();
    final TextEditingController _passwordcontroller = TextEditingController();
    final TextEditingController _firstnamecontroller = TextEditingController();
    final TextEditingController _lastnamecontroller = TextEditingController();

    return Scaffold(
      body: Center(
        child: BlocListener<Signupbloc, Signupstate>(
          listener:
              (listener, state) => {
                if (state is SignupDone)
                  {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Otpverification(),
                      ),
                    ),
                    Fluttertoast.showToast(msg: state.message),
                    _emailcontroller.clear(),
                    _passwordcontroller.clear(),
                    _firstnamecontroller.clear(),
                    _lastnamecontroller.clear(),
                  }
                else
                  {
                    if (state is SignupError)
                      {Fluttertoast.showToast(msg: state.error)},
                  },
              },
          child: BlocBuilder<Signupbloc, Signupstate>(
            builder: (context, state) {
              if (state is SignupLoading) {
                return AnimationLottie(
                  filePath: "assets/animations/loading.json",
                );
              } else {
                return ShadForm(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 350),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          "Sign up",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        ShadInputFormField(
                          id: "first_name",
                          label: const Text("First name"),
                          placeholder: const Text("Enter your first name here"),
                          controller: _firstnamecontroller,
                        ),
                        const SizedBox(height: 10),
                        ShadInputFormField(
                          id: "last_name",
                          label: const Text('Last name'),
                          placeholder: const Text("Enter your last name here"),
                          controller: _lastnamecontroller,
                        ),
                        const SizedBox(height: 10),
                        ShadInputFormField(
                          id: 'email',
                          label: const Text("Email"),
                          placeholder: const Text("Enter your email here"),
                          keyboardType: TextInputType.emailAddress,
                          controller: _emailcontroller,
                        ),
                        const SizedBox(height: 10),
                        ShadInputFormField(
                          id: "password",
                          label: const Text("Password"),
                          placeholder: const Text("Enter your password here"),
                          controller: _passwordcontroller,
                        ),
                        const SizedBox(height: 50),
                        ShadButton(
                          width: 350,
                          onPressed: () {
                            final email = _emailcontroller.text;
                            final password = _passwordcontroller.text;
                            final firstname = _firstnamecontroller.text;
                            final lastname = _lastnamecontroller.text;
                            context.read<Signupbloc>().add(
                              SignupSubmitted(
                                email: email,
                                password: password,
                                firstname: firstname,
                                lastname: lastname,
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
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
