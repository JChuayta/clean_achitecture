import 'dart:convert';
import '../../../../../core/error/exceptions.dart';
import '../models/movie.model.dart';
// import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

import '../../domain/entities/movie.dart';

abstract class MovieRemoteDataSource {
  Future<List<Movie>> getMovie();
}

class MovieRemoteDataSourceImpl implements MovieRemoteDataSource {
  final http.Client client;

  MovieRemoteDataSourceImpl({@required this.client});

  @override
  Future<List<Movie>> getMovie() => _getMovieFromUrl();

  Future<List<MovieModel>> _getMovieFromUrl() async {
    var url = Uri.parse(
      'https://api.themoviedb.org/3/movie/popular?api_key=1865f43a0549ca50d341dd9ab8b29f49',
    );
    // final response = await http.get(
    //   url,
    //   headers: {
    //     'content-type': 'application/json',
    //   },
    // );
    // if (response.statusCode == 200) {
    //   print(response.body);

    //   final result = json.decode(response.body);

    //   return List<Movie>.from(result).map((x) => MovieModel.fromJson(x));
    // } else
    //   throw ServerException();

    return getJson(url).then(
      (data) => data["results"]
          .map<MovieModel>((item) => MovieModel.fromJson(item))
          .toList(),
    );
  }

  Future<dynamic> getJson(Uri url) async {
    final response = await http.get(
      url,
      headers: {
        'content-type': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      print(response.body);
      return json.decode(response.body);
    } else
      throw ServerException();
  }
}
