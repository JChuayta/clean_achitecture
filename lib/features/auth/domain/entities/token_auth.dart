// To parse this JSON data, do
//
//     final tokenAuth = tokenAuthFromJson(jsonString);

// List<TokenAuth> tokenAuthFromJson(String str) =>
//     List<TokenAuth>.from(json.decode(str).map((x) => TokenAuth.fromJson(x)));

// String tokenAuthToJson(List<TokenAuth> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TokenAuth {
  TokenAuth({
    this.nbf,
    this.exp,
    this.iss,
    this.aud,
    this.iat,
    this.atHash,
    this.sHash,
    this.sid,
    this.sub,
    this.authTime,
    this.idp,
    this.amr,
  });

  final int nbf;
  final int exp;
  final String iss;
  final String aud;
  final int iat;
  final String atHash;
  final String sHash;
  final String sid;
  final int sub;
  final int authTime;
  final String idp;
  final String amr;
}
