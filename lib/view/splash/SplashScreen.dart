import 'package:flutter/material.dart';

// Import the firebase_core plugin
import 'package:firebase_core/firebase_core.dart';
import 'package:you_pick/main.dart';
import 'package:you_pick/utils/ColorUtil.dart';

class SplashWidget extends StatefulWidget {
  @override
  State createState() => _SplashState();
}

class _SplashState extends State<SplashWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.primaryDarkColor,
      body: Center(
        child: Image.asset("assets/images/you_pick_logo.png"),
      ),
    );
  }
}