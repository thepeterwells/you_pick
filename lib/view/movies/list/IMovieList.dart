import 'package:you_pick/data/models/Movie.dart';

abstract class IMovieList {
  void showProgress();
  void hideProgress();
  void showError();
  void setDataItems(List<Movie> movies);
  void openMovieDetails(int movieId, String title);
}