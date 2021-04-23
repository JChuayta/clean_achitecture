part of 'movie_bloc.dart';

abstract class MovieEvent {}

class GetMovie extends MovieEvent {
  final Movie movies;

  GetMovie(this.movies);
}
