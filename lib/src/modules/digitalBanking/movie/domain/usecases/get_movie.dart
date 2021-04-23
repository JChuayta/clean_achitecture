import '../entities/movie.dart';
import '../repositories/movie_repository.dart';
import '../../../../../core/use_cases/use_case.dart';

class GetMovies implements UseCase<Movie> {
  final MovieRepository repository;

  GetMovies(this.repository);

  @override
  Future<Movie> call() async {
    return await repository.getMovie();
  }
}
