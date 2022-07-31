import 'NetworkErrorException.dart';

extension FutureMapperError<T> on Future<T> {
  Future<T> catchFailure(Function(NetworkErrorException, StackTrace) onError,
      {bool test(Object error)?}) {
    this.catchError((error, stacktrace) {
      final failure = error.error;
      if (failure is NetworkErrorException) {
        onError(failure, stacktrace);
      } else {
        onError(FailureException.genericException, stacktrace);
      }
    });
    return this;
  }
}
