import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:moyamoya/domain/mapper/school_mapper.dart';
import 'package:moyamoya/domain/model/school.dart';
import 'package:moyamoya/network/core/base_url.dart';
import 'package:moyamoya/network/core/get_result.dart';
import 'package:moyamoya/network/core/model/result.dart';
import 'package:moyamoya/network/core/safe_request.dart';
import 'package:moyamoya/network/school/response/school_response.dart';

import '../school_data_source.dart';

@LazySingleton(as: SchoolDataSource)
class SchoolDataSourceImpl implements SchoolDataSource {
  @override
  Future<Result<List<School>>> getSchools(String serverUrl) => getResult(
        () async {
          // await dotenv.load(fileName: 'assets/config/.env');
          final response = (await Dio(
            BaseOptions(
              contentType: Headers.jsonContentType,
              baseUrl: serverUrl,
              connectTimeout: const Duration(milliseconds: 5000),
              receiveTimeout: const Duration(milliseconds: 3000),
            ),
          ).get(BaseUrl.school))
              .safeRequest();

          return (response as List<dynamic>)
              .map(
                (res) => SchoolResponse.fromJson(res as Map<String, dynamic>),
              )
              .toList()
              .toModels();
        },
      );
}
