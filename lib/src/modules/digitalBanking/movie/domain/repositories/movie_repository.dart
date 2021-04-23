import '../entities/movie.dart';

abstract class MovieRepository {
  Future<Movie> getMovie();
}
