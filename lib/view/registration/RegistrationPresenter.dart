import 'package:you_pick/view/registration/IRegistration.dart';

class RegistrationPresenter {
  IRegistration? _view;
  String? _username;
  String? _email;
  String? _password;
  String? _confirmPassword;

  static final RegistrationPresenter _singleton = RegistrationPresenter._internal();
  RegistrationPresenter._internal();

  factory RegistrationPresenter() {
    return _singleton;
  }

  void start(IRegistration view) {
    _view = view;
  }

  void onUsernameChanged(String username) {
    _username = username;
    _validateUserInputs();
  }

  void onEmailInputChanged(String email) {
    _email = email;
    _validateUserInputs();
  }

  void onPasswordInputChanged(String password) {
    _password = password;
    _validateUserInputs();
  }

  void onConfirmPasswordInputChanged(String confirmPassword) {
    _confirmPassword = confirmPassword;
    _validateUserInputs();
  }

  void _validateUserInputs() {
    if (_email == null || _password == null) {
      _view?.setRegisterButtonEnabled(false);
    }
    bool isEmailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(_email!);
    bool isPasswordValid = _password!.isNotEmpty && _password == _confirmPassword;

    _view?.setRegisterButtonEnabled(isEmailValid && isPasswordValid);
  }
}