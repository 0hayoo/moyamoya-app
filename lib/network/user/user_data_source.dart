import 'package:moyamoya/domain/model/user_ideal_type.dart';
import 'package:moyamoya/domain/model/user_my_info.dart';
import 'package:moyamoya/domain/model/user_profile_available_personality.dart';
import 'package:moyamoya/domain/model/user_token.dart';
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

  Future<Result<UserToken>> signUp({
    required String phone,
    required int schoolId,
    required int schoolGrade,
    required int schoolClass,
    required String name,
    required String gender,
    required String profileImageUrl,
    required String verifyCode,
  }) async {
    throw UnimplementedError('signUp is not implemented yet.');
  }

  Future<Result<List<UserProfileAvailablePersonality>>>
      availablePersonality() async {
    throw UnimplementedError('availableProfiles is not implemented yet.');
  }

  Future<Result<void>> postProfile({
    required UserMyInfo myInfo,
    required UserIdealType idealType,
  }) async {
    throw UnimplementedError('postProfile is not implemented yet.');
  }
}
