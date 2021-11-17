import 'package:tmdb_api/tmdb_api.dart';

class TMDbUtil {
  static TMDB initializeTMDb() {
    return TMDB(
        ApiKeys('39df174acce9f04fa07618cc434d32b9',
            'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIzOWRmMTc0YWNjZTlmMDRmYTA3NjE4Y2M0MzRkMzJiOSIsInN1YiI6IjYwYjZlMjZlYTA2NjQ1MDAyYTU2ZjM5YyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.3CtYzXrcZrf-acVddbJrZ6FcmbvA3YKmMHH3ur3-wNg'
        )
    );
  }
}