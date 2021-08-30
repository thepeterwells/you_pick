import 'package:you_pick/utils/ColorUtil.dart';
import 'package:you_pick/view/home.dart';
import 'package:flutter/material.dart';
import 'package:you_pick/view/login/LoginScreen.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'You Pick',
      theme: ThemeData(
        primarySwatch: HexColor("#494747"),
        primaryColor: AppTheme.primaryColor,
        primaryColorLight: AppTheme.primaryLightColor,
        primaryColorDark: AppTheme.primaryDarkColor,
        accentColor: AppTheme.secondaryColor,

      ),
      home: LoginScreen(),
    );
  }
}