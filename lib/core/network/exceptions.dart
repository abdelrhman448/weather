class InternetException implements Exception {
  final String message;
  InternetException(this.message);
}

class TimeoutException implements Exception {
  final String message;
  TimeoutException(this.message);
}

class BadRequestException implements Exception {
  final String message;
  BadRequestException(this.message);
}

class UnauthorizedException implements Exception {
  final String message;
  UnauthorizedException(this.message);
}

class ForbiddenException implements Exception {
  final String message;
  ForbiddenException(this.message);
}

class NotFoundException implements Exception {
  final String message;
  NotFoundException(this.message);
}

class ConflictException implements Exception {
  final String message;
  ConflictException(this.message);
}

class GeneralException implements Exception {
  final String message;
  GeneralException(this.message);
}
