import 'package:flutter/material.dart';

// Import the firebase_core plugin
import 'package:firebase_core/firebase_core.dart';
import 'package:you_pick/main.dart';
import 'package:you_pick/utils/ColorUtil.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(SplashWidget());
}

class SplashWidget extends StatefulWidget {
  SplashState createState() => SplashState();
}

class SplashState extends State<SplashWidget> {
  // Set default `_initialized` and `_error` state to false
  bool _initialized = false;
  bool _error = false;

  // Define an async function to initialize FlutterFire
  void initializeFlutterFire() async {
    try {
      // Wait for Firebase to initialize and set `_initialized` state to true
      await Firebase.initializeApp();
      setState(() {
        _initialized = true;
      });
    } catch(e) {
      // Set `_error` state to true if Firebase initialization fails
      setState(() {
        _error = true;
      });
    }
  }

  @override
  void initState() {
    initializeFlutterFire();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Show error message if initialization failed
    // if(_error) {
    //   return SomethingWentWrong();
    // }

    // Show a loader until FlutterFire is initialized
    if (!_initialized) {
      return  Center(
          child: Image.asset('assets/images/you_pick_logo.png')
        );
    }

    return App();
  }
}