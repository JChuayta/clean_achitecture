import 'package:digital_banking/src/modules/digitalBanking/movie/data/repositories/movie_repository_impl.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'movie/data/datasources/movie_local_data_sources.dart';
import 'movie/data/datasources/movie_remote_data_sources.dart';
import 'movie/domain/repositories/movie_repository.dart';
import 'movie/domain/usecases/get_movie.dart';
import 'movie/presentation/bloc/movie_bloc.dart';

final inject = GetIt.instance;

Future<void> init() async {
  // features
  inject.registerFactory(
    () => MovieBloc(
      getmovies: inject(),
    ),
  );

  inject.registerLazySingleton(() => GetMovies(inject()));

  inject.registerLazySingleton<MovieRepository>(
    () => MovieRepositoryImpl(
      localDataSource: inject(),
      remoteDataSource: inject(),
    ),
  );

  inject.registerLazySingleton<MovieRemoteDataSource>(
    () => MovieRemoteDataSourceImpl(client: inject()),
  );

  inject.registerLazySingleton<MovieLocalDataSource>(
    () => MovieLocalDataSourceImpl(sharedPreferences: inject()),
  );

  // external
  final sharedPreferences = await SharedPreferences.getInstance();
  inject.registerLazySingleton(() => sharedPreferences);
  inject.registerLazySingleton(() => http.Client());
}
