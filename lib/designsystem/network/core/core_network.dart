import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

final Dio coreDio = Dio(
  BaseOptions(
    contentType: Headers.jsonContentType,
    baseUrl: dotenv.env['BASE_URL']!,
    connectTimeout: const Duration(milliseconds: 5000),
    receiveTimeout: const Duration(milliseconds: 3000),
  ),
)..interceptors.add(LogInterceptor(responseBody: true));
