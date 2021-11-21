abstract class IRegistration {
  Future<void> showError(String errorMsg);
  void showProgress();
  void hideProgress();
  void setRegisterButtonEnabled(bool enabled);
  void onRegistrationComplete();
}