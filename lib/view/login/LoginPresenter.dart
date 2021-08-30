import 'package:shared_preferences/shared_preferences.dart';
import 'package:you_pick/view/login/ILogin.dart';

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
    final _preferences = await SharedPreferences.getInstance();
    if ((_preferences.get('api_token') ?? '-1') == '-1') {
      _preferences.setString('api_token', 'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIzOWRmMTc0YWNjZTlmMDRmYTA3NjE4Y2M0MzRkMzJiOSIsInN1YiI6IjYwYjZlMjZlYTA2NjQ1MDAyYTU2ZjM5YyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.3CtYzXrcZrf-acVddbJrZ6FcmbvA3YKmMHH3ur3-wNg');
    }

    var _accessToken = _preferences.get('accessToken') ?? '-1';
    _view?.setHasAccessToken(_accessToken != '-1');
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
}