import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:flutter/material.dart';

class ThemeChallenge {
  static final  theme = ShadThemeData(
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
  );
}
