class ServerException implements Exception{
  final String? message;
  const ServerException([this.message]);
  @override
  String toString() {
    return "$message";
  }
}
class FetchDataException extends ServerException{
  const FetchDataException([message]): super("error During Communications");
}
class BadRequestException extends ServerException{
  const BadRequestException([message]): super("Bad Request");
}
class UnauthorizedException extends ServerException{
  const UnauthorizedException([message]): super("Unauthorized");
}
class NotFoundException extends ServerException{
  const NotFoundException([message]): super("Request Not Found");
}
class ConflictException extends ServerException{
  const ConflictException([message]): super("Conflict Occurred");
}
class InternetServerErrorException extends ServerException{
  const InternetServerErrorException([message]): super("Internet Server Error");
}
class NoInternetConnectionException extends ServerException{
  const NoInternetConnectionException([message]): super("No Internet Connection");
}