import 'package:get/get.dart';
import 'package:injectable/injectable.dart';
import 'package:moyamoya/domain/mapper/user_profile_available_personality_mapper.dart';
import 'package:moyamoya/domain/mapper/user_token_mapper.dart';
import 'package:moyamoya/domain/mapper/user_verify_mapper.dart';
import 'package:moyamoya/domain/model/user_ideal_type.dart';
import 'package:moyamoya/domain/model/user_my_info.dart';
import 'package:moyamoya/domain/model/user_profile_available_personality.dart';
import 'package:moyamoya/domain/model/user_token.dart';
import 'package:moyamoya/domain/model/user_verify.dart';
import 'package:moyamoya/local/token/token_data_source.dart';
import 'package:moyamoya/network/core/base_url.dart';
import 'package:moyamoya/network/core/core_network.dart';
import 'package:moyamoya/network/core/get_result.dart';
import 'package:moyamoya/network/core/model/result.dart';
import 'package:moyamoya/network/core/safe_request.dart';
import 'package:moyamoya/network/user/request/user_hair_style_request.dart';
import 'package:moyamoya/network/user/request/user_ideal_type_request.dart';
import 'package:moyamoya/network/user/request/user_my_info_request.dart';
import 'package:moyamoya/network/user/request/user_profile_request.dart';
import 'package:moyamoya/network/user/request/user_send_code_request.dart';
import 'package:moyamoya/network/user/request/user_sign_up_request.dart';
import 'package:moyamoya/network/user/request/user_verify_request.dart';
import 'package:moyamoya/network/user/response/user_profile_available_personality_response.dart';
import 'package:moyamoya/network/user/response/user_token_response.dart';
import 'package:moyamoya/network/user/response/user_verify_response.dart';
import 'package:moyamoya/network/user/user_data_source.dart';

@LazySingleton(as: UserDataSource)
class UserDataSourceImpl implements UserDataSource {
  @override
  Future<Result<void>> sendCode(String phone) async {
    return await getResult(() async {
      final response = (await coreDio.post<Map<String, dynamic>>(
        "${BaseUrl.user}/send-codewww",
        data: UserSendCodeRequest(phone),
      ))
          .safeRequest();
      return;
    });
  }

  @override
  Future<Result<UserVerify>> verifyCode(
    String phone,
    String code,
  ) async {
    return await getResult(
      () async {
        final tokenDataSource = Get.find<TokenDataSource>();
        final response = (await coreDio.post<Map<String, dynamic>>(
          "${BaseUrl.user}/verify-code",
          data: UserVerifyRequest(phone, code),
        ))
            .safeRequest();

        final userVerify = UserVerifyResponse.fromJson(response).toModel();
        if (!userVerify.isNewUser) {
          tokenDataSource.saveToken(
            accessToken: userVerify.token!.accessToken,
            refreshToken: userVerify.token!.refreshToken,
          );
        }
        return userVerify;
      },
    );
  }

  @override
  Future<Result<List<String>>> availableProfiles() async {
    return await getResult(() async {
      final List<dynamic> response = (await coreDio
              .get<List<dynamic>>("${BaseUrl.user}/available-profile-images"))
          .safeRequest();

      return response.map((item) => item as String).toList();
    });
  }

  @override
  Future<Result<List<UserProfileAvailablePersonality>>>
      availablePersonality() async {
    return await getResult(() async {
      final List<dynamic> response = (await coreDio.get<List<dynamic>>(
              "${BaseUrl.user}/profile/available-personalities"))
          .safeRequest();
      return response
          .map((item) => UserProfileAvailablePersonalityResponse.fromJson(item))
          .map((item) => item.toModel())
          .toList();
    });
  }

  @override
  Future<Result<void>> postProfile({
    required UserMyInfo myInfo,
    required UserIdealType idealType,
  }) async {
    return await getResult(() async {
      final response = (await coreDio.post<Map<String, dynamic>>(
        "${BaseUrl.user}/profile",
        data: UserProfileRequest(
          myInfo: UserMyInfoRequest(
            messageInterval: myInfo.messageInterval,
            fashionStyle: myInfo.fashionStyle,
            hasGlasses: myInfo.hasGlasses,
            height: myInfo.height,
            mbti: myInfo.mbti,
            faceType: myInfo.faceType,
            bodyType: myInfo.bodyType,
            hairStyle: UserHairStyleRequest(
              myInfo.hairStyle.length,
              myInfo.hairStyle.isCurly,
              myInfo.hairStyle.hasPerm,
              myInfo.hairStyle.hasBang,
            ),
            skinColor: myInfo.skinColor,
          ),
          idealType: UserIdealTypeRequest(
            messageInterval: idealType.messageInterval,
            fashionStyle: idealType.fashionStyle,
            hasGlasses: idealType.hasGlasses,
            heightLevel: idealType.heightLevel,
            ageType: idealType.ageType,
            personality: idealType.personality.map((item) => item.id).toList(),
            faceType: idealType.faceType,
            bodyType: idealType.bodyType,
            hairStyle: UserHairStyleRequest(
              idealType.hairStyle.length,
              idealType.hairStyle.isCurly,
              idealType.hairStyle.hasPerm,
              idealType.hairStyle.hasBang,
            ),
            skinColor: idealType.skinColor,
          ),
        ).toJson(),
      ))
          .safeRequest();
      return;
    });
  }

  @override
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
    // throw Exception();
    final tokenDataSource = Get.find<TokenDataSource>();
    return await getResult(() async {
      print(UserSignUpRequest(
        phone: phone,
        schoolId: schoolId,
        schoolGrade: schoolGrade,
        schoolClass: schoolClass,
        name: name,
        gender: gender,
        profileImageUrl: profileImageUrl,
        code: verifyCode,
      ).toJson());
      final response = (await coreDio.post<Map<String, dynamic>>(
        "${BaseUrl.user}/sign-up",
        data: UserSignUpRequest(
          phone: phone,
          schoolId: schoolId,
          schoolGrade: schoolGrade,
          schoolClass: schoolClass,
          name: name,
          gender: gender,
          profileImageUrl: profileImageUrl,
          code: verifyCode,
        ).toJson(),
      ))
          .safeRequest();

      final tokenResponse = UserTokenResponse.fromJson(response).toModel();
      tokenDataSource.saveToken(
        accessToken: tokenResponse.accessToken,
        refreshToken: tokenResponse.refreshToken,
      );
      return tokenResponse;
    });
  }
}
