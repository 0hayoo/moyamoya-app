import 'package:moyamoya/domain/model/school.dart';
import 'package:moyamoya/network/core/model/result.dart';

interface class SchoolDataSource {
  Future<Result<List<School>>> getSchools(String serverUrl) async {
    throw UnimplementedError('getSchools is not implemented yet.');
  }
}
