import 'dart:convert';

import 'package:digital_banking/src/modules/digitalBanking/movie/data/models/movie.model.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class MovieLocalDataSource {
  Future<MovieModel> getLastMovie();
  Future<void> cacheMovie(MovieModel movieToCache);
}

const CACHED_MOVIE = 'CACHED_MOVIE';

class MovieLocalDataSourceImpl implements MovieLocalDataSource {
  final SharedPreferences sharedPreferences;

  MovieLocalDataSourceImpl({@required this.sharedPreferences});

  @override
  Future<MovieModel> getLastMovie() {
    final jsonString = sharedPreferences.getString(CACHED_MOVIE);
    if (jsonString != null)
      return Future.value(MovieModel.fromJson(json.decode(jsonString)));
    // else
    // throw CacheException();
  }

  @override
  Future<void> cacheMovie(MovieModel triviaToCache) {
    return sharedPreferences.setString(
      CACHED_MOVIE,
      json.encode(triviaToCache.toJson()),
    );
  }
}
