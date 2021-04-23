abstract class Failure {
  Failure([List properties = const <dynamic>[]]);
}

class ServerFailure extends Failure {}

class CacheFailure extends Failure {}
