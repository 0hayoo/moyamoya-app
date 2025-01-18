class BadRequestException implements Exception {
  final String? message;

  BadRequestException([this.message]);

  @override
  String toString() => message ?? 'BadRequestException';
}

class LockedException implements Exception {
  final String? message;

  LockedException([this.message]);

  @override
  String toString() => message ?? 'LockedException';
}

class UnauthorizedException implements Exception {
  final String? message;

  UnauthorizedException([this.message]);

  @override
  String toString() => message ?? 'UnauthorizedException';
}

class ForbiddenException implements Exception {
  final String? message;

  ForbiddenException([this.message]);

  @override
  String toString() => message ?? 'ForbiddenException';
}

class NotFoundException implements Exception {
  final String? message;

  NotFoundException([this.message]);

  @override
  String toString() => message ?? 'NotFoundException';
}

class ConflictException implements Exception {
  final String? message;

  ConflictException([this.message]);

  @override
  String toString() => message ?? 'ConflictException';
}

class TooManyRequestsException implements Exception {
  final String? message;

  TooManyRequestsException([this.message]);

  @override
  String toString() => message ?? 'TooManyRequestsException';
}

class InternalServerException implements Exception {
  final String? message;
  final int status;

  InternalServerException(this.status, [this.message]);

  @override
  String toString() =>
      message ?? 'InternalServerException: Status code $status';
}

class DataNotFoundException implements Exception {
  final String? message;

  DataNotFoundException([this.message]);

  @override
  String toString() => message ?? 'DataNotFoundException';
}
