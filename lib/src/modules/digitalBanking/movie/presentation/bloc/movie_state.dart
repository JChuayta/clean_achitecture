part of 'movie_bloc.dart';

class MovieState {
  Movie movie;

  MovieState({Movie movie}) : this.movie = movie ?? new Movie();

  MovieState getMovie() => MovieState();

  MovieState initState() => new MovieState();

  MovieState copyWith({Movie movies}) => MovieState(
        movie: movies ?? this.movie,
      );
}

// abstract class MovieState {
//   MovieState([List props = const <dynamic>[]]);
// }

// class Empty extends MovieState {}

// class Loading extends MovieState {}

// class Loaded extends MovieState {
//   final Movie movie;

//   Loaded({this.movie});
// }

// class Error extends MovieState {
//   final String errorMessage;

//   Error({this.errorMessage});
// }
