import 'package:you_pick/data/models/Movie.dart';
import 'package:you_pick/injection/DependencyInjection.dart';
import 'package:you_pick/view/movies/list/IMovieList.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MovieListPresenter {
  IMovieList? _view;

  static final MovieListPresenter _singleton = MovieListPresenter._internal();
  MovieListPresenter._internal();

  factory MovieListPresenter() {
    return _singleton;
  }

  void start(IMovieList view) async {
    _view = view;
    final _service = new Injector().movieListService;
    final _preferences = await SharedPreferences.getInstance();
    if ((_preferences.get('api_token') ?? '-1') == '-1') {
      _preferences.setString('api_token', 'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIzOWRmMTc0YWNjZTlmMDRmYTA3NjE4Y2M0MzRkMzJiOSIsInN1YiI6IjYwYjZlMjZlYTA2NjQ1MDAyYTU2ZjM5YyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.3CtYzXrcZrf-acVddbJrZ6FcmbvA3YKmMHH3ur3-wNg');
    }
    _view?.showProgress();
    _service.getMovies()
        .then((data) => _onSuccess(data))
        .catchError((e) => _view?.showError());
  }

  void _onSuccess(List<Movie> data) async {
    _view?.hideProgress();
    _view?.setDataItems(data);
  }
}