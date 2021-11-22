abstract class ILogin {
  void showProgress();
  void hideProgress();
  Future<void> showError(String errorMsg);
  void openHomeScreen();
  void openCreateAccountFlow();
  void setSubmitButtonEnabled(bool enabled);
}