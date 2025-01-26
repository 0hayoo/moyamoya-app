import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:moyamoya/designsystem/foundation/app_theme.dart';
import 'package:moyamoya/feature/input/myinfo/bodytype/navigation/input_my_info_body_type_navigation.dart';
import 'package:moyamoya/feature/input/myinfo/facetype/navigation/input_my_info_face_type_navigation.dart';
import 'package:moyamoya/feature/input/myinfo/fashionglasses/navigation/input_my_info_fashion_glasses_navigation.dart';
import 'package:moyamoya/feature/input/myinfo/fashionstyle/navigation/input_my_info_fashion_style_navigation.dart';
import 'package:moyamoya/feature/input/myinfo/hairtypeone/navigation/input_my_info_hair_type_one_navigation.dart';
import 'package:moyamoya/feature/input/myinfo/hairtypetwo/navigation/input_my_info_hair_type_two_navigation.dart';
import 'package:moyamoya/feature/input/myinfo/height/navigation/input_my_info_height_navigation.dart';
import 'package:moyamoya/feature/input/myinfo/mbti/navigation/input_my_info_mbti_navigation.dart';
import 'package:moyamoya/feature/input/myinfo/messageinterval/navigation/input_my_info_message_interval_navigation.dart';
import 'package:moyamoya/feature/input/myinfo/skincolor/navigation/input_my_info_skin_color_navigation.dart';
import 'package:moyamoya/feature/onboarding/navigation/onbaording_navigation.dart';
import 'package:moyamoya/feature/signup/authphone/navigation/sign_up_auth_phone_navigation.dart';
import 'package:moyamoya/feature/signup/finalcheck/navigation/sign_up_final_check_navigation.dart';
import 'package:moyamoya/feature/signup/inputgender/navigation/sign_up_input_gender_navigation.dart';
import 'package:moyamoya/feature/signup/inputphone/navigation/sign_up_input_phone_navigation.dart';
import 'package:moyamoya/feature/signup/inputprofile/navigation/sign_up_input_profile_navigation.dart';
import 'package:moyamoya/feature/signup/inputschoolinfo/navigation/sign_up_input_school_info_navigation.dart';
import 'package:moyamoya/feature/signup/retrieveschool/navigation/sign_up_retrieve_school_navigation.dart';
import 'package:moyamoya/injectable_config.dart';
import 'package:moyamoya/local/token/datasource/token_data_source_impl.dart';
import 'package:moyamoya/local/token/token_data_source.dart';
import 'package:moyamoya/network/school/datasource/school_data_source_impl.dart';
import 'package:moyamoya/network/school/school_data_source.dart';
import 'package:moyamoya/network/user/datasource/user_data_source_impl.dart';
import 'package:moyamoya/network/user/user_data_source.dart';
import 'package:provider/provider.dart';

void main() async {
  await dotenv.load(fileName: 'assets/config/.env');
  Get.put<UserDataSource>(UserDataSourceImpl());
  Get.put<SchoolDataSource>(SchoolDataSourceImpl());
  Get.put<TokenDataSource>(TokenDataSourceImpl());
  configureDependencies();

  runApp(const MoyaMoyaApp());
}

class MoyaMoyaApp extends StatelessWidget {
  const MoyaMoyaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AppTheme(),
      builder: (context, _) => GetMaterialApp(
        initialRoute: inputMyInfoMessageIntervalRoute,
        title: "Flutter Demo",
        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
        themeMode: context.watch<AppTheme>().themeMode,
        debugShowCheckedModeBanner: false,
        getPages: [
          onboardingScreen(
            navigateToSignUp: navigateToSignUpInputPhoneScreen,
          ),
          signUpInputPhoneScreen(
            popBackStack: Get.back,
            navigateToSignUpAuthTel: (tel) {
              navigateToSignUpAuthPhoneScreen(phone: tel);
            },
            navigateToSignIn: () {
              print("로그인 화면");
            },
          ),
          signUpAuthPhoneScreen(
              popBackStack: Get.back,
              navigateToSignUpRetrieveSchoolScreen: (phone, verifyCode) {
                navigateToSignUpRetrieveSchoolScreen(
                  phone: phone,
                  verifyCode: verifyCode,
                );
              }),
          signUpRetrieveSchoolScreen(
            popBackStack: Get.back,
            navigateToSignUpInputSchoolInfoScreen: (
              phone,
              verifyCode,
              schoolId,
              schoolName,
              schoolType,
            ) {
              navigateToSignUpInputSchoolInfoScreen(
                phone: phone,
                verifyCode: verifyCode,
                schoolId: schoolId,
                schoolName: schoolName,
                schoolType: schoolType,
              );
            },
          ),
          signUpInputSchoolInfoScreen(
            popBackStack: Get.back,
            navigateToSignUpInputProfileScreen: (
              phone,
              verifyCode,
              schoolId,
              schoolName,
              schoolType,
              schoolGrade,
              schoolClass,
            ) {
              navigateToSignUpInputProfileScreen(
                phone: phone,
                verifyCode: verifyCode,
                schoolId: schoolId,
                schoolName: schoolName,
                schoolType: schoolType,
                schoolGrade: schoolGrade,
                schoolClass: schoolClass,
              );
            },
          ),
          signUpInputProfileScreen(
            popBackStack: Get.back,
            navigateToSignUpInputGenderScreen: (
              phone,
              verifyCode,
              schoolId,
              schoolName,
              schoolType,
              schoolGrade,
              schoolClass,
              name,
              profileImageUrl,
            ) {
              navigateToSignUpInputGenderScreen(
                phone: phone,
                verifyCode: verifyCode,
                schoolId: schoolId,
                schoolName: schoolName,
                schoolType: schoolType,
                schoolGrade: schoolGrade,
                schoolClass: schoolClass,
                name: name,
                profileImageUrl: profileImageUrl,
              );
            },
          ),
          signUpInputGenderScreen(
            popBackStack: Get.back,
            navigateToSignUpFinalCheckScreen: (
              phone,
              verifyCode,
              schoolId,
              schoolName,
              schoolType,
              schoolGrade,
              schoolClass,
              name,
              profileImageUrl,
              gender,
            ) {
              navigateToSignUpFinalCheck(
                phone: phone,
                verifyCode: verifyCode,
                schoolId: schoolId,
                schoolName: schoolName,
                schoolType: schoolType,
                schoolGrade: schoolGrade,
                schoolClass: schoolClass,
                name: name,
                profileImageUrl: profileImageUrl,
                gender: gender,
              );
            },
          ),
          signUpFinalCheckScreen(
            popBackStack: Get.back,
          ),
          inputMyInfoMessageIntervalScreen(
            popBackStack: Get.back,
            navigateToInputMyInfoFashionStyle: (messageInterval) {
              navigateToInputMyInfoFashionStyleScreen(
                messageInterval: messageInterval,
              );
            },
          ),
          inputMyInfoFashionStyleScreen(
            popBackStack: Get.back,
            navigationToInputMyInfoFashionGlasses: (
              messageInterval,
              fashionStyle,
            ) {
              navigateToInputMyInfoFashionGlassesScreen(
                messageInterval: messageInterval,
                fashionStyle: fashionStyle,
              );
            },
          ),
          inputMyInfoFashionGlassesScreen(
            popBackStack: Get.back,
            navigationToInputMyInfoHeight: (
              messageInterval,
              fashionStyle,
              isGlasses,
            ) {
              navigateToInputMyInfoHeightScreen(
                messageInterval: messageInterval,
                fashionStyle: fashionStyle,
                isGlasses: isGlasses,
              );
            },
          ),
          inputMyInfoHeightScreen(
            popBackStack: Get.back,
            navigateToInputMyInfoMBTIScreen: (
              messageInterval,
              fashionStyle,
              isGlasses,
              height,
            ) {
              navigateToInputMyInfoMBTIScreen(
                messageInterval: messageInterval,
                fashionStyle: fashionStyle,
                isGlasses: isGlasses,
                height: height,
              );
            },
          ),
          inputMyInfoMBTIScreen(
            popBackStack: Get.back,
            navigateToInputMyInfoFaceTypeScreen: (
              messageInterval,
              fashionStyle,
              isGlasses,
              height,
              mbti,
            ) {
              navigateToInputMyInfoFaceTypeScreen(
                messageInterval: messageInterval,
                fashionStyle: fashionStyle,
                isGlasses: isGlasses,
                height: height,
                mbti: mbti,
              );
            },
          ),
          inputMyInfoFaceTypeScreen(
            popBackStack: Get.back,
            navigationToInputMyInfoBodyType: (
              messageInterval,
              fashionStyle,
              isGlasses,
              height,
              mbti,
              faceType,
            ) {
              navigateToInputMyInfoBodyTypeScreen(
                messageInterval: messageInterval,
                fashionStyle: fashionStyle,
                isGlasses: isGlasses,
                height: height,
                mbti: mbti,
                faceType: faceType,
              );
            },
          ),
          inputMyInfoBodyTypeScreen(
            popBackStack: Get.back,
            navigateToInputMyInfoHairTypeOne: (
              messageInterval,
              fashionStyle,
              isGlasses,
              height,
              mbti,
              faceType,
              bodyType,
            ) {
              navigateToInputMyInfoHairTypeOneScreen(
                messageInterval: messageInterval,
                fashionStyle: fashionStyle,
                isGlasses: isGlasses,
                height: height,
                mbti: mbti,
                faceType: faceType,
                bodyType: bodyType,
              );
            },
          ),
          inputMyInfoHairTypeOneScreen(
            popBackStack: Get.back,
            navigateToInputMyInfoHairTypeTwo: (
              messageInterval,
              fashionStyle,
              isGlasses,
              height,
              mbti,
              faceType,
              bodyType,
              hairLength,
            ) {
              navigateToInputMyInfoHairTypeTwoScreen(
                messageInterval: messageInterval,
                fashionStyle: fashionStyle,
                isGlasses: isGlasses,
                height: height,
                mbti: mbti,
                faceType: faceType,
                bodyType: bodyType,
                hairLength: hairLength,
              );
            },
          ),
          inputMyInfoHairTypeTwoScreen(
            popBackStack: Get.back,
            navigationToInputMyInfoSkinColor: (
              messageInterval,
              fashionStyle,
              isGlasses,
              height,
              mbti,
              faceType,
              bodyType,
              hairLength,
              isCurly,
              hasPerm,
              hasBang,
            ) {
              navigateToInputMyInfoSkinColorScreen(
                messageInterval: messageInterval,
                fashionStyle: fashionStyle,
                isGlasses: isGlasses,
                height: height,
                mbti: mbti,
                faceType: faceType,
                bodyType: bodyType,
                hairLength: hairLength,
                isCurly: isCurly,
                hasPerm: hasPerm,
                hasBang: hasBang,
              );
            },
          ),
          inputMyInfoSkinColorScreen(
            popBackStack: Get.back,
            navigationToInputIdealType: (
              messageInterval,
              fashionStyle,
              isGlasses,
              height,
              mbti,
              faceType,
              bodyType,
              hairLength,
              isCurly,
              hasPerm,
              hasBang,
              skinColor,
            ) {},
          ),
        ],
      ),
    );
  }
}
