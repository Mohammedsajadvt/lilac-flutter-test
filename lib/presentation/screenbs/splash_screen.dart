import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
     Navigator.of(context).pushReplacementNamed('/profile');
    });

    return Scaffold(
      body: Center(
        child: Lottie.asset('assets/images/netflix.json'),
      ),
    );
  }
}