import 'dart:convert';

import 'package:digital_banking/src/modules/digitalBanking/movie/data/models/movie.model.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class MovieLocalDataSource {
  Future<List<MovieModel>> getLastMovie();
  Future<void> cacheMovie(List<MovieModel> movieToCache);
}

const CACHED_MOVIE = 'CACHED_MOVIE';

class MovieLocalDataSourceImpl implements MovieLocalDataSource {
  final SharedPreferences sharedPreferences;

  MovieLocalDataSourceImpl({@required this.sharedPreferences});

  @override
  Future<List<MovieModel>> getLastMovie() {
    final jsonString = sharedPreferences.getString(CACHED_MOVIE);
    if (jsonString != null)
      return Future.value(json.decode(jsonString).then((data) => data['results']
          .map<MovieModel>((item) => MovieModel.fromJson(item))
          .toList()));
  }

  @override
  Future<void> cacheMovie(List<MovieModel> movieToCache) {
    return sharedPreferences.setString(
      CACHED_MOVIE,
      json.encode(movieToCache.first.toJson()),
    );
  }
}
