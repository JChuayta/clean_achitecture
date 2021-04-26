import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:digital_banking/src/modules/digitalBanking/movie/domain/usecases/get_movie.dart';

import '../../domain/entities/movie.dart';
part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final GetMovies getMovies;
  MovieBloc({
    GetMovies getmovies,
  })  : getMovies = getmovies,
        super(Empty());

  @override
  Stream<MovieState> mapEventToState(MovieEvent event) async* {
    if (event is GetMovie) {
      yield Loading();
      final List<Movie> movie = await getMovies();
      yield* _LoadedState(movie);
    }
  }

  Stream<MovieState> _LoadedState(List<Movie> movie) async* {
    yield Loaded(movie: movie);
  }
}
