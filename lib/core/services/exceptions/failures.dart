class Failure {}

class DioFailure extends Failure {
  final String message;

  DioFailure(this.message);
}
