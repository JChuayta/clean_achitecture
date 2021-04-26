import '../entities/movie.dart';
import '../repositories/movie_repository.dart';
import '../../../../../core/use_cases/use_case.dart';

class GetMovies implements UseCase<List<Movie>> {
  final MovieRepository repository;

  GetMovies(this.repository);

  @override
  Future<List<Movie>> call() async {
    return await repository.getMovie();
  }
}
