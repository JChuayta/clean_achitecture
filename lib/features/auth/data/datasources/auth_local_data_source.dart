import 'dart:convert';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/token_auth_model.dart';
import '../../../../core/error/exceptions.dart';

abstract class TokenAuthLocalDataSource {
  Future<TokenAuthModel> getToken();
  Future<void> cacheToken(TokenAuthModel tokenToCache);
}

const CACHED_TOKEN = 'CACHED_TOKEN';

class TokenAuthLocalDataSourceImpl implements TokenAuthLocalDataSource {
  final SharedPreferences sharedPreferences;

  var user;

  TokenAuthLocalDataSourceImpl({@required this.sharedPreferences});

  @override
  Future<TokenAuthModel> getToken() {
    final jsonString = sharedPreferences.getString(CACHED_TOKEN);

    if (user != null) {}

    if (jsonString != null)
      return Future.value(TokenAuthModel.fromJson(json.decode(jsonString)));
    else
      throw CacheException();
  }

  @override
  Future<void> cacheToken(TokenAuthModel triviaToCache) {
    return sharedPreferences.setString(
      CACHED_TOKEN,
      json.encode(triviaToCache.toJson()),
    );
  }
}
