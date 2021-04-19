import 'package:meta/meta.dart';
import 'package:clean_architecture_example/features/auth/domain/entities/token_auth.dart';

class TokenAuthModel extends TokenAuth {
  TokenAuthModel({
    @required String nbf,
    @required int exp,
    @required int iss,
    @required int aud,
    @required int iat,
    @required int atHash,
    @required int sHash,
    @required int sid,
    @required int sub,
    @required int authTime,
    @required int idp,
    @required int amr,
  });

  factory TokenAuthModel.fromJson(Map<String, dynamic> json) {
    return TokenAuthModel(
      nbf: json["nbf"],
      exp: json["exp"],
      iss: json["iss"],
      aud: json["aud"],
      iat: json["iat"],
      atHash: json["at_hash"],
      sHash: json["s_hash"],
      sid: json["sid"],
      sub: json["sub"],
      authTime: json["auth_time"],
      idp: json["idp"],
      amr: json["amr"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "nbf": nbf,
      "exp": exp,
      "iss": iss,
      "aud": aud,
      "iat": iat,
      "at_hash": atHash,
      "s_hash": sHash,
      "sid": sid,
      "sub": sub,
      "auth_time": authTime,
      "idp": idp,
      "amr": amr,
    };
  }
}
