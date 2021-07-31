import 'package:you_pick/data/ApiService.dart';
import 'package:you_pick/data/service/MovieListService.dart';

class Injector {
  static final Injector _singleton = Injector._internal();

  factory Injector() {
    return _singleton;
  }

  Injector._internal();

  MovieListService get movieListService {
    return LiveMovieListService();
  }

}