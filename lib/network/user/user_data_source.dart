import 'package:moyamoya/domain/model/user_verify.dart';
import 'package:moyamoya/network/core/model/result.dart';

interface class UserDataSource {
  Future<Result<void>> sendCode(String phone) async {
    // TODO: implement verifyCode
    throw UnimplementedError('verifyCode is not implemented yet.');
  }

  Future<Result<UserVerify>> verifyCode(
    String phone,
    String code,
  ) async {
    // TODO: implement verifyCode
    throw UnimplementedError('verifyCode is not implemented yet.');
  }

  Future<Result<List<String>>> availableProfiles() async {
    // TODO: implement verifyCode
    throw UnimplementedError('verifyCode is not implemented yet.');
  }
}
