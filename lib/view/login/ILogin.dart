abstract class ILogin {
  void showProgress();
  void hideProgress();
  void showError();
  void openHomeScreen();
  void openCreateAccountFlow();
  void setHasAccessToken(bool hasToken);
  void setSubmitButtonEnabled(bool enabled);
}