import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:uuid/uuid.dart';
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

  Future<void> registerUser() async {
    _view?.showProgress();
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _email!,
          password: _password!
      ).then((userCredentials) => {
          FirebaseDatabase.instance.reference()
              .child('users')
              .child(userCredentials.user!.uid)
              .set(<String, Object?> {
                "username": _username,
                "email": _email
              })
              .then((onValue) {
                _view!.onRegistrationComplete();
              })
        }
      );
    } on FirebaseAuthException catch (e) {
      _view?.hideProgress();
      if (e.code == 'weak-password') {
        _view?.showError('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        _view?.showError('This email is already in use.');
      }
    } catch (e) {
      _view?.hideProgress();
      print(e);
    }
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