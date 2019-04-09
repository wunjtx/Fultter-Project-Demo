import 'package:project_demo/models/movie.dart';

class FetchResult {
  int count;
  List<Movie> movies;

  FetchResult({
    this.count,
    this.movies,
  });

  FetchResult.fromJSON(Map<String, dynamic>  data) {
    count = data['count'];
    if (data['movies'] != null) {
      movies = List<Movie>();
      data['movies'].forEach((v) {
        movies.add(Movie.fromJSON(v));
      });
    }
  }
}