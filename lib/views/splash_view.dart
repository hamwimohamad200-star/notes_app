import 'package:flutter/material.dart';
import 'package:notes_app/views/widgets/splash_view_body.dart';

import 'notes_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {

  @override
  void initState() {
      super.initState();
      Future.delayed(Duration(seconds: 3), () {
        if (mounted) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => NotesView()),
          );
        }
      });
    }
  @override
  Widget build(BuildContext context) {
    return SplashViewBody();
  }
}

