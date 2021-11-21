import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:you_pick/utils/TMDbUtil.dart';
import 'package:you_pick/view/login/ILogin.dart';
import 'package:tmdb_api/tmdb_api.dart';

class LoginPresenter {
  ILogin? _view;
  String? _email;
  String? _password;

  static final LoginPresenter _singleton = LoginPresenter._internal();
  LoginPresenter._internal();

  factory LoginPresenter() {
    return _singleton;
  }

  void start(ILogin view) async {
    _view = view;
    FirebaseAuth.instance
        .authStateChanges()
        .listen((User? user) {
          if (user != null) {
            _view?.openHomeScreen();
          }
        });
  }

  void onEmailInputChanged(String email) {
    _email = email;
    _validateUserInputs();
  }

  void onPasswordInputChanged(String password) {
    _password = password;
    _validateUserInputs();
  }

  void _validateUserInputs() {
    if (_email == null || _password == null) {
      _view?.setSubmitButtonEnabled(false);
    }
    bool isEmailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(_email!);
    bool isPasswordValid = _password!.isNotEmpty;

    _view?.setSubmitButtonEnabled(isEmailValid && isPasswordValid);
  }

  void _login() {

  }
}