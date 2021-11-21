import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:you_pick/utils/ColorUtil.dart';
import 'package:you_pick/view/home.dart';
import 'package:flutter/material.dart';
import 'package:you_pick/view/login/LoginScreen.dart';
import 'package:you_pick/view/movies/list/MovieListScreen.dart';
import 'package:you_pick/view/navigation/BottomNavigationScreen.dart';
import 'package:you_pick/view/registration/RegistrationScreen.dart';
import 'package:you_pick/view/splash/SplashScreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(App());
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {

  final Future<FirebaseApp> _firebaseInitialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _firebaseInitialization,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return MaterialApp(
            title: 'You Pick',
            theme: ThemeData(
              primarySwatch: HexColor("#494747"),
              primaryColor: AppTheme.primaryColor,
              primaryColorLight: AppTheme.primaryLightColor,
              primaryColorDark: AppTheme.primaryDarkColor,
              accentColor: AppTheme.secondaryColor,

            ),
            home: SplashWidget(),
          );
        }
        if (snapshot.connectionState == ConnectionState.done) {
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

        return MaterialApp(
          title: 'You Pick',
          theme: ThemeData(
            primarySwatch: HexColor("#494747"),
            primaryColor: AppTheme.primaryColor,
            primaryColorLight: AppTheme.primaryLightColor,
            primaryColorDark: AppTheme.primaryDarkColor,
            accentColor: AppTheme.secondaryColor,

          ),
          home: SplashWidget(),
        );
      },
    );
  }
}