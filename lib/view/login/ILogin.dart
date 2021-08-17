abstract class ILogin {
  void showProgress();
  void hideProgress();
  void showError();
  void openCreateAccountFlow();
  void setHasAccessToken(bool hasToken);
}