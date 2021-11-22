import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:you_pick/utils/ColorUtil.dart';
import 'package:you_pick/view/home.dart';
import 'package:you_pick/view/registration/IRegistration.dart';
import 'package:you_pick/view/registration/RegistrationPresenter.dart';

class RegistrationScreen extends StatelessWidget {

  var presenter = RegistrationPresenter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: Theme.of(context).copyWith(
            disabledColor: AppTheme.secondaryTextColor
        ),
        home: Scaffold(
          backgroundColor: AppTheme.primaryDarkColor,
          body: RegistrationWidget(presenter: presenter),
        )
    );
  }
}

class RegistrationWidget extends StatefulWidget {

  final RegistrationPresenter presenter;

  const RegistrationWidget({ required this.presenter });

  @override
  State createState() => _RegistrationScreenState(presenter: presenter);
}

class _RegistrationScreenState extends State<RegistrationWidget> implements IRegistration {

  final RegistrationPresenter presenter;
  bool _showPassword = false;
  bool _registerButtonEnabled = false;
  bool _isLoading = false;

  _RegistrationScreenState({ required this.presenter });

  @override
  void initState() {
    setState(() {
      _showPassword = false;
      _registerButtonEnabled = false;
      _isLoading = false;
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
                  onChanged: (username) { presenter.onUsernameChanged(username); },
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
                      labelText: 'Username',
                      labelStyle: TextStyle(color: AppTheme.primaryLightColor)
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
                      labelText: 'Email*',
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
                      labelText: 'Password*',
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
                margin: EdgeInsets.only(top: 24.0, left: 16.0, right: 16.0),
                child: TextFormField(
                  obscureText: !_showPassword,
                  onChanged: (password) { presenter.onConfirmPasswordInputChanged(password); },
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
                      labelText: 'Confirm Password*',
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
                child: _isLoading ? CircularProgressIndicator(color: AppTheme.primaryTextColor) : Text('REGISTER'),
                onPressed: _registerButtonEnabled ? () {
                  if (!_isLoading) {
                    presenter.registerUser();
                  }
                } : null,
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void onRegistrationComplete() {
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context) => HomeScreen()), (Route<dynamic> route) => false);
  }

  @override
  Future<void> showError(String errorMsg) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(errorMsg),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  void setRegisterButtonEnabled(bool enabled) {
    setState(() {
      _registerButtonEnabled = enabled;
    });
  }

  void _togglePasswordVisibility() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }

  @override
  void showProgress() {
    setState(() {
      _isLoading = true;
    });
  }

  @override
  void hideProgress() {
    setState(() {
      _isLoading = false;
    });
  }
}