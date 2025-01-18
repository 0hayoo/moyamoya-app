import 'package:moyamoya/designsystem/domain/model/user_verify.dart';
import 'package:moyamoya/designsystem/network/core/model/result.dart';

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
}
