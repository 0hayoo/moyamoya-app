import 'package:dio/dio.dart';
import 'package:moyamoya/designsystem/domain/common/moya_moya_exception.dart';

extension SafeRequest on Response<Map<String, dynamic>> {
  Map<String, dynamic> safeRequest() {
    switch (statusCode) {
      case 200:
      case 201:
      case 204:
        if (data == null) {
          throw DataNotFoundException(statusMessage);
        }
        try {
          return data!;
        } catch (exception) {
          // throw DataNotFoundException(statusMessage);
          rethrow;
        }
      case 400:
        throw BadRequestException(statusMessage);
      case 401:
        throw UnauthorizedException(statusMessage);
      case 403:
        throw ForbiddenException(statusMessage);
      case 404:
        throw NotFoundException(statusMessage);
      case 409:
        throw ConflictException(statusMessage);
      case 423:
        throw LockedException(statusMessage);
      case 429:
        throw TooManyRequestsException(statusMessage);
      case 500:
        throw InternalServerException(statusCode ?? 500, statusMessage);
      default:
        throw Exception(statusMessage);
    }
  }
}
