import 'package:flutter/material.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0F0F11),
      body: Center(
        child: Image.asset("assets/images/logo3.png" , width: double.infinity, height: 260,),
      ),
    );
  }
}
