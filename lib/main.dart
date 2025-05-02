import 'package:challenge/bloc/Bloc/InputBloc.dart';
import 'package:challenge/bloc/Bloc/LoginBloc.dart';
import 'package:challenge/bloc/Bloc/SignupBloc.dart';
import 'package:challenge/pages/login.dart';
import 'package:challenge/services/AuthService.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider(create: (_) => AuthService()),
        BlocProvider<LoginBloc>(
          create:
              (context) => LoginBloc(authService: context.read<AuthService>()),
        ),
        BlocProvider<Signupbloc>(
          create:
              (context) => Signupbloc(authService: context.read<AuthService>()),
        ),
        BlocProvider<InputBloc>(create: (context) => InputBloc()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ShadApp(
      home: const Login(),
      theme: ShadThemeData(
        brightness: Brightness.light,
        colorScheme: ShadColorScheme(
          background: const Color(0xFF230266),
          foreground: Colors.white,

          card: const Color(0xFF2A2A3C),
          cardForeground: Colors.white,

          popover: const Color(0xFF2F2F44),
          popoverForeground: Colors.white,

          primary: Colors.lightBlue,
          primaryForeground: Colors.white,

          secondary: const Color(0xFF1A1A1A),
          secondaryForeground: Colors.white,

          muted: Colors.grey.shade700,
          mutedForeground: Colors.grey.shade300,

          accent: Colors.amber,
          accentForeground: Colors.black,

          destructive: Colors.red.shade700,
          destructiveForeground: Colors.white,

          border: Colors.grey.shade600,
          input: Colors.white,
          ring: Colors.blueAccent,
          selection: Colors.blue.withValues(),
        ),
        textTheme: ShadTextTheme(family: 'Montserrat'),
      ),
    );
  }
}
