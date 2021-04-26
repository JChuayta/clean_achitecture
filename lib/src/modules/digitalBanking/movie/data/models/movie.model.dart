// import 'dart:convert';

import 'package:digital_banking/src/modules/digitalBanking/movie/domain/entities/movie.dart';

// List<Movie> movieFromJson(String str) => List<Movie>.from(json.decode(str).map((x) => MovieModel.fromJson(x)));

class MovieModel extends Movie {
  MovieModel({
    bool adult,
    String backdropPath,
    int id,
    String originalLanguage,
    String originalTitle,
    String overview,
    double popularity,
    String posterPath,
    String title,
    bool video,
    double voteAverage,
    int voteCount,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
        adult: json["adult"],
        backdropPath: json["backdrop_path"],
        id: json["id"],
        originalLanguage: json["original_language"],
        originalTitle: json["original_title"],
        overview: json["overview"],
        popularity: json["popularity"].toDouble(),
        posterPath: json["poster_path"],
        title: json["title"],
        video: json["video"],
        voteAverage: json["vote_average"].toDouble(),
        voteCount: json["vote_count"],
      );

  Map<String, dynamic> toJson() => {
        "adult": adult,
        "backdrop_path": backdropPath,
        "id": id,
        "original_language": originalLanguage,
        "original_title": originalTitle,
        "overview": overview,
        "popularity": popularity,
        "poster_path": posterPath,
        "title": title,
        "video": video,
        "vote_average": voteAverage,
        "vote_count": voteCount,
      };
}
