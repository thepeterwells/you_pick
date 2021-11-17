abstract class IRegistration {
  void showInvalidEmail(String errorMsg);
  void showInvalidPassword(String errorMsg);
  void setRegisterButtonEnabled(bool enabled);
  void onRegistrationComplete();
}