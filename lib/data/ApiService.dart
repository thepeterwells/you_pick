import 'models/Movie.dart';

abstract class MovieListService {
  static const movieListUrl = 'https://api.themoviedb.org/3/movie/popular?language=en-US&page=1';
  Future<List<Movie>> getMovies();
}