import 'package:challenge/bloc/Bloc/InputBloc.dart';
import 'package:challenge/bloc/Bloc/LoginBloc.dart';
import 'package:challenge/bloc/Bloc/OtpBloc.dart';
import 'package:challenge/bloc/Bloc/SignupBloc.dart';
import 'package:challenge/components/ChallengeTheme.dart';
import 'package:challenge/pages/login.dart';
import 'package:challenge/services/AuthService.dart';
import 'package:challenge/services/UtilsService.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider(create: (_) => AuthService()),
        Provider(create: (_) => Utilsservice()),
        BlocProvider<LoginBloc>(
          create:
              (context) => LoginBloc(authService: context.read<AuthService>()),
        ),
        BlocProvider<Signupbloc>(
          create:
              (context) => Signupbloc(authService: context.read<AuthService>()),
        ),
        BlocProvider<InputBloc>(create: (context) => InputBloc()),
        BlocProvider<Otpbloc>(
          create:
              (context) => Otpbloc(utilsservice: context.read<Utilsservice>()),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ShadApp(home: const Login(), theme: ThemeChallenge.theme);
  }
}
