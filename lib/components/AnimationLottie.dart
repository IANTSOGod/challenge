import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AnimationLottie extends StatelessWidget {
  final String filePath;
  const AnimationLottie({super.key, required this.filePath});

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(filePath, width: 200, height: 200, fit: BoxFit.fill);
  }
}
