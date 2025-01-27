import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:moyamoya/local/token/token_data_source.dart';
import 'package:moyamoya/network/core/base_url.dart';

final Dio coreDio = Dio(
  BaseOptions(
    contentType: Headers.jsonContentType,
    baseUrl: dotenv.env['BASE_URL']!,
    connectTimeout: const Duration(milliseconds: 5000),
    receiveTimeout: const Duration(milliseconds: 3000),
  ),
)..interceptors.addAll([
    _AuthInterceptor(),
    LogInterceptor(responseBody: true),
  ]);

class _AuthInterceptor extends Interceptor {
  final List<String> _excludedPaths = ['/auth/login', '/auth/refresh'];
  final tokenDataSource = Get.find<TokenDataSource>();

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    // 특정 경로 제외 로직
    if (!_excludedPaths.any((path) => options.path.startsWith(path))) {
      print("토큰 주입");
      final localToken = await tokenDataSource.getToken();
      if (localToken != null) {
        options.headers['Authorization'] = 'Bearer ${localToken.accessToken}';
      }
    }
    print(options.headers);
    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      final localToken = await tokenDataSource.getToken();
      if (localToken != null) {
        try {
          // Refresh Token으로 Access Token 갱신
          final newAccessToken =
              await _refreshAccessToken(localToken.refreshToken);

          // 새로운 Access Token 저장
          await tokenDataSource.saveAccessToken(accessToken: newAccessToken);

          // 원래 요청 복사 후 Access Token 갱신
          final originalRequest = err.requestOptions;
          originalRequest.headers['Authorization'] = 'Bearer $newAccessToken';

          // 원래 요청 재시도
          final response = await Dio().fetch(originalRequest);
          return handler.resolve(response);
        } catch (e) {
          // Refresh Token 만료 또는 기타 오류 처리
          return handler.reject(err);
        }
      }
    }
    super.onError(err, handler);
  }

  Future<String> _refreshAccessToken(String refreshToken) async {
    final dio = Dio(BaseOptions(baseUrl: dotenv.env['BASE_URL']!));
    final response = await dio
        .post("${BaseUrl.user}/refresh", data: {'refreshToken': refreshToken});

    if (response.statusCode == 200) {
      return response.data['accessToken'];
    } else {
      throw Exception('Failed to refresh token');
    }
  }
}
