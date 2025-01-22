import 'package:flutter/material.dart';
import 'package:moyamoya/designsystem/component/bottom_sheet.dart';
import 'package:moyamoya/designsystem/component/button.dart';
import 'package:moyamoya/designsystem/component/centered_text_field.dart';
import 'package:moyamoya/designsystem/component/clickable.dart';
import 'package:moyamoya/designsystem/component/top_app_bar.dart';
import 'package:moyamoya/designsystem/foundation/app_theme.dart';
import 'package:moyamoya/designsystem/foundation/moya_moya_icons_icons.dart';
import 'package:moyamoya/feature/signup/inputphone/navigation/sign_up_input_phone_navigation.dart';
import 'package:smooth_corner/smooth_corner.dart';
import 'package:url_launcher/url_launcher.dart';

class SignUpInputPhoneScreen extends StatefulWidget {
  const SignUpInputPhoneScreen({
    super.key,
    required this.popBackStack,
    required this.navigateToSignUpAuthTel,
    required this.navigateToSignIn,
  });

  final VoidCallback popBackStack;
  final NavigateToSignUpAuthTel navigateToSignUpAuthTel;
  final VoidCallback navigateToSignIn;

  @override
  State<SignUpInputPhoneScreen> createState() => _SignUpInputPhoneScreenState();
}

class _SignUpInputPhoneScreenState extends State<SignUpInputPhoneScreen> {
  final _telTextEditingController = TextEditingController();

  bool _isPrivacyPolicyAccepted = false;
  bool _isAgreeToTerms = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: context.colors.backgroundNeutral,
        appBar: MoyaMoyaTopAppBar(
          title: "",
          appBarType: TopAppBarType.small,
          onBackPressed: widget.popBackStack,
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 32,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 48,
                ),
                Text(
                  "전화번호",
                  style: context.typography.title1Bold,
                ),
                SizedBox(
                  height: 32,
                ),
                SizedBox(
                  width: double.infinity,
                  child: CenteredTextField(
                    controller: _telTextEditingController,
                    hintText: "010-1234-5678",
                  ),
                ),
                SizedBox(
                  height: 32,
                ),
                SizedBox(
                  width: double.infinity,
                  child: MoyaMoyaButton(
                    text: "다음",
                    buttonSize: ButtonSize.larger,
                    buttonType: ButtonType.primary,
                    onPressed: () {
                      showMoyaMoyaBottomSheet(
                        context: context,
                        builder: _buildBottomSheet,
                      );
                    },
                  ),
                ),
                Expanded(
                  child: SizedBox(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "이미 계정이 있어요",
                      style: context.typography.labelRegular,
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    GestureDetector(
                      onTap: widget.navigateToSignIn,
                      child: Text(
                        "로그인",
                        style: context.typography.labelBold.copyWith(
                          color: context.colors.primaryNormal,
                          decoration: TextDecoration.underline,
                          decorationColor: context.colors.primaryNormal,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBottomSheet(
    BuildContext context,
    StateSetter setState,
  ) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "회원가입을 하기 위해 동의가 필요해요",
          style: context.typography.heading2Bold.copyWith(
            color: context.colors.labelNormal,
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          "모야모야에 가입하기 위해 서비스 이용약관과 개인정보처리방침 동의가 필요해요",
          style: context.typography.bodyMedium.copyWith(
            color: context.colors.labelAlternative,
          ),
        ),
        SizedBox(
          height: 24,
        ),
        MoyaMoyaClickable(
          onPressed: () {
            bool value = !(_isAgreeToTerms && _isPrivacyPolicyAccepted);
            setState(() {
              _isAgreeToTerms = value;
              _isPrivacyPolicyAccepted = value;
            });
          },
          borderRadius: BorderRadius.circular(16),
          child: Container(
            width: double.infinity,
            height: 48,
            decoration: ShapeDecoration(
                shape: SmoothRectangleBorder(
                  smoothness: 0.6,
                  borderRadius: BorderRadius.circular(16),
                ),
                color: context.colors.fillNormal),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 24,
                ),
                Icon(
                  MoyaMoyaIcons.checkmark,
                  size: 22,
                  color: (_isAgreeToTerms && _isPrivacyPolicyAccepted)
                      ? context.colors.primaryNormal
                      : context.colors.labelAlternative,
                ),
                SizedBox(
                  width: 6,
                ),
                Text(
                  "필수 항목 모두 체크하기",
                  style: context.typography.headlineBold.copyWith(
                    color: context.colors.labelNeutral,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 12,
        ),
        _privateCard(
          text: "[필수] 개인정보 수집 및 이용에 대한 안내",
          url: "https://dodam.b1nd.com",
          isSelected: _isPrivacyPolicyAccepted,
          onPressed: () {
            _updateIsPrivacyPolicyAccepted(!_isPrivacyPolicyAccepted);
            setState(() {});
          },
        ),
        _privateCard(
          text: "[필수] 서비스 이용약관",
          url: "https://dodam.b1nd.com",
          isSelected: _isAgreeToTerms,
          onPressed: () {
            _updateIsAgreeToTerms(!_isAgreeToTerms);
            setState(() {});
          },
        ),
        SizedBox(
          height: 24,
        ),
        MoyaMoyaButton(
          text: "다음",
          buttonSize: ButtonSize.larger,
          buttonType: ButtonType.primary,
          onPressed: () {
            widget.navigateToSignUpAuthTel(_telTextEditingController.text);
          },
        )
      ],
    );
  }

  Widget _privateCard({
    required String text,
    required String url,
    required bool isSelected,
    required VoidCallback onPressed,
  }) {
    return MoyaMoyaClickable(
      onPressed: onPressed,
      child: SizedBox(
        height: 36,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 4,
            ),
            Icon(
              MoyaMoyaIcons.checkmark,
              size: 16,
              color: isSelected
                  ? context.colors.primaryNormal
                  : context.colors.labelAlternative,
            ),
            SizedBox(
              width: 12,
            ),
            Expanded(
              child: Text(
                text,
                style: context.typography.labelRegular.copyWith(
                  color: context.colors.labelAssistive,
                ),
              ),
            ),
            SizedBox(
              width: 12,
            ),
            GestureDetector(
              onTap: () {
                launchUrl(Uri.parse(url));
              },
              child: Container(
                height: double.infinity,
                alignment: Alignment.center,
                child: Text(
                  "보기",
                  style: context.typography.labelBold.copyWith(
                    color: context.colors.labelAssistive,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _updateIsAgreeToTerms(bool value) {
    setState(() {
      _isAgreeToTerms = value;
    });
  }

  void _updateIsPrivacyPolicyAccepted(bool value) {
    setState(() {
      _isPrivacyPolicyAccepted = value;
    });
  }
}
