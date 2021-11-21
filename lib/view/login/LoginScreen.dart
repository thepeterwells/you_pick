
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:you_pick/utils/ColorUtil.dart';
import 'package:you_pick/view/home.dart';
import 'package:you_pick/view/login/LoginPresenter.dart';
import 'package:you_pick/view/navigation/BottomNavigationScreen.dart';
import 'package:you_pick/view/registration/RegistrationScreen.dart';

import 'ILogin.dart';

class LoginScreen extends StatelessWidget {

  var presenter = LoginPresenter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Theme.of(context).copyWith(
        disabledColor: AppTheme.secondaryTextColor
      ),
      home: Scaffold(
        backgroundColor: AppTheme.primaryDarkColor,
        body: LoginWidget(presenter: presenter),
      )
    );
  }


}

class LoginWidget extends StatefulWidget {

  final LoginPresenter presenter;

  const LoginWidget({ required this.presenter });

  @override
  State createState() => _LoginScreenState(presenter: presenter);
}

class _LoginScreenState extends State<LoginWidget> implements ILogin {

  final LoginPresenter presenter;
  bool _hasAccessToken = false;
  bool _showPassword = false;
  bool _loginButtonEnabled = false;

  _LoginScreenState({ required this.presenter });


  @override
  void initState() {
    setState(() {
      _hasAccessToken = false;
      _showPassword = false;
      _loginButtonEnabled = false;
    });
    WidgetsBinding.instance!.addPostFrameCallback((_) => presenter.start(this));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.primaryDarkColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: double.infinity,
              margin: const EdgeInsets.only(top: 48.0),
              child: (
                  Image(image: AssetImage('assets/images/you_pick_logo.png'),
                    width: 250,
                    height: 250,
                    alignment: Alignment.center,
                  )
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 24.0, left: 16.0, right: 16.0),
              child: TextFormField(
                onChanged: (email) { presenter.onEmailInputChanged(email); },
                cursorColor: AppTheme.primaryTextColor,
                style: TextStyle(
                  color: AppTheme.primaryTextColor
                ),
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppTheme.primaryLightColor)
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppTheme.primaryTextColor)
                  ),
                  labelText: 'Email',
                  labelStyle: TextStyle(color: AppTheme.primaryLightColor)
                ),
              )
            ),
            Container(
              margin: EdgeInsets.only(top: 24.0, left: 16.0, right: 16.0),
                child: TextFormField(
                  obscureText: !_showPassword,
                  onChanged: (password) { presenter.onPasswordInputChanged(password); },
                  cursorColor: AppTheme.primaryTextColor,
                  style: TextStyle(
                      color: AppTheme.primaryTextColor
                  ),
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppTheme.primaryLightColor)
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppTheme.primaryTextColor)
                      ),
                      labelText: 'Password',
                      labelStyle: TextStyle(color: AppTheme.primaryLightColor),
                    suffixIcon: IconButton(
                      icon: _showPassword ? Icon(Icons.visibility_off) : Icon(Icons.visibility),
                      onPressed: () { _togglePasswordVisibility(); },
                      color: AppTheme.primaryLightColor,
                    )
                  ),
                )
            ),
            Container(
              margin: EdgeInsets.only(top: 24.0, left: 32.0, right: 32.0),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
                    if (states.contains(MaterialState.disabled)) {
                      return AppTheme.primaryLightColor;
                    }
                    return AppTheme.secondaryDarkColor;
                  }),
                  minimumSize: MaterialStateProperty.resolveWith<Size>((states) {
                    return Size(double.infinity, 48.0);
                  }),
                  textStyle: MaterialStateProperty.resolveWith<TextStyle>((states) {
                    if (states.contains(MaterialState.disabled)) {
                      return TextStyle(
                          color: AppTheme.primaryDarkColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                      );
                    }
                    return TextStyle(
                      color: AppTheme.primaryTextColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                    );
                  })
                ),
                child: Text('LOGIN'),
                onPressed: _loginButtonEnabled ? () { presenter.login(); } : null,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 8.0, left: 32.0, right: 32.0),
              child: TextButton(
                child: Text(
                  'Create Account',
                  style: TextStyle(
                      color: AppTheme.primaryTextColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold
                  ),
                ),
                onPressed: () { openCreateAccountFlow(); },
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void setHasAccessToken(bool hasToken) {
    setState(() {
      _hasAccessToken = hasToken;
    });
  }

  @override
  void openHomeScreen() {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => BottomNavigationScreen()));
  }

  @override
  void openCreateAccountFlow() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => RegistrationScreen()), );
  }

  @override
  void showError() {

  }

  @override
  void hideProgress() {

  }

  @override
  void showProgress() {

  }

  @override
  void setSubmitButtonEnabled(bool enabled) {
    setState(() {
      _loginButtonEnabled = enabled;
    });
  }

  void _togglePasswordVisibility() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }
}