abstract class Failure {
  Failure([List properties = const []]);
}

class ServerFailure implements Failure {}

class LocalCacheFailure implements Failure {}
