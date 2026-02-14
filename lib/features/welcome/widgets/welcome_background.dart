import 'package:flutter/material.dart';

class WelcomeBackground extends StatelessWidget {
  const WelcomeBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      bottom: MediaQuery.of(context).size.height * 0.46,
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF2249D4), Color(0xFFE9EEFA)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0, 100],
          ),
        ),
        child: Image.asset("assets/images/welcome-bg.png", fit: BoxFit.cover),
      ),
    );
  }
}
