import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moyamoya/designsystem/feature/onboarding/navigation/onbaording_navigation.dart';
import 'package:moyamoya/designsystem/feature/signup/inputtel/navigation/sign_up_input_tel_navigation.dart';
import 'package:moyamoya/designsystem/foundation/app_theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MoyaMoyaApp());
}

class MoyaMoyaApp extends StatelessWidget {
  const MoyaMoyaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AppTheme(),
      builder: (context, _) => GetMaterialApp(
        initialRoute: onboardingRoute,
        title: "Flutter Demo",
        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
        themeMode: context.watch<AppTheme>().themeMode,
        debugShowCheckedModeBanner: false,
        getPages: [
          onboardingScreen(
            navigateToSignUp: navigateToSignUpInputTelScreen,
          ),
          signUpInputTelScreen(
            popBackStack: Get.back,
            navigateToSignUpAuthTel: () {},
            navigateToSignIn: () {
              print("로그인 화면");
            },
          )
        ],
      ),
    );
  }
}
