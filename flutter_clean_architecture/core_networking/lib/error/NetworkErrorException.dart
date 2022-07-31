
import '../resources/string_resource.dart';

class FailureException {
  static final networkException = NetworkErrorException(
    code: "-1",
    exception: NetworkException(ResourceStrings.network_error),
  );
  static final malformedJsonException = NetworkErrorException(
    code: "-2",
    exception: NetworkException(ResourceStrings.generic_error),
  );
  static final genericException = NetworkErrorException(
    code: "-3",
    exception: NetworkException(ResourceStrings.generic_error),
  );
}

class NetworkException implements Exception {
  NetworkException(this.message);
  final String message;
}

class NetworkErrorException {
  String code;
  NetworkException exception;
  NetworkErrorException({required this.code, required this.exception});
}

