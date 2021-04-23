import 'dart:convert';
import '../../../../../core/error/exceptions.dart';
import '../models/movie.model.dart';
// import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

import '../../domain/entities/movie.dart';

abstract class MovieRemoteDataSource {
  Future<Movie> getMovie();
}

class MovieRemoteDataSourceImpl implements MovieRemoteDataSource {
  // final Dio client;
  final http.Client client;

  MovieRemoteDataSourceImpl({@required this.client});

  @override
  Future<Movie> getMovie() => _getMovieFromUrl();

  Future<MovieModel> _getMovieFromUrl() async {
    var url = Uri.parse(
      'https://api.themoviedb.org/3/movie/popular?api_key=1865f43a0549ca50d341dd9ab8b29f49',
    );
    final response = await client.get(
      url,
      headers: {
        'content-type': 'application/json',
      },
    );
    if (response.statusCode == 200)
      return MovieModel.fromJson(json.decode(response.body));
    else
      throw ServerException();
  }
}
