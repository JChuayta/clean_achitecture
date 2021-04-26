part of 'movie_bloc.dart';

// class MovieState {
//   List<Movie> movie;

//   MovieState({List<Movie> movie}) : this.movie = movie ?? [];

//   MovieState getMovie() => MovieState();

//   MovieState initState() => new MovieState();

//   MovieState copyWith({Movie movies}) => MovieState(
//         movie: movies ?? this.movie,
//       );
// }

abstract class MovieState {
  MovieState([List props = const <dynamic>[]]);
}

class Empty extends MovieState {}

class Loading extends MovieState {}

class Loaded extends MovieState {
  final List<Movie> movie;

  Loaded({this.movie});
}

class Error extends MovieState {
  final String errorMessage;

  Error({this.errorMessage});
}
