
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:you_pick/utils/ColorUtil.dart';
import 'package:you_pick/view/home.dart';
import 'package:you_pick/view/login/LoginPresenter.dart';

import 'ILogin.dart';

class LoginScreen extends StatelessWidget {

  var presenter = LoginPresenter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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

  _LoginScreenState({ required this.presenter });


  @override
  void initState() {
    setState(() {
      _hasAccessToken = false;
    });
    WidgetsBinding.instance!.addPostFrameCallback((_) => presenter.start(this));
  }

  @override
  Widget build(BuildContext context) {
    if (_hasAccessToken) {
      return HomeScreen();
    }
    return Scaffold();
  }

  @override
  void setHasAccessToken(bool hasToken) {
    setState(() {
      _hasAccessToken = hasToken;
    });
  }

  @override
  void openCreateAccountFlow() {

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


}