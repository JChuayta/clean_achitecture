abstract class UseCase<Type> {
  Future<Type> call();
}

class NoParams {}
