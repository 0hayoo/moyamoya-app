import 'package:flutter/material.dart';
import 'package:moyamoya/designsystem/component/avatar.dart';
import 'package:moyamoya/designsystem/component/button.dart';
import 'package:moyamoya/designsystem/component/top_app_bar.dart';
import 'package:moyamoya/designsystem/foundation/app_theme.dart';

class SignUpFinalCheckScreen extends StatefulWidget {
  const SignUpFinalCheckScreen({
    super.key,
    required this.popBackStack,
  });

  final VoidCallback popBackStack;

  @override
  State<SignUpFinalCheckScreen> createState() => _SignUpFinalCheckScreenState();
}

class _SignUpFinalCheckScreenState extends State<SignUpFinalCheckScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.backgroundNeutral,
      appBar: MoyaMoyaTopAppBar(
        title: "마지막 정보 확인",
        appBarType: TopAppBarType.small,
        onBackPressed: widget.popBackStack,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 32,
        ),
        child: Column(
          children: [
            SizedBox(
              height: 48,
            ),
            Container(
              width: 172,
              height: 172,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 4,
                  color: context.colors.lineNormal,
                ),
                borderRadius: BorderRadius.circular(99),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  MoyaMoyaAvatar(
                    avatarSize: AvatarSize.xxl,
                    image: null,
                  ),
                  Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      color: context.colors.fillNormal,
                      borderRadius: BorderRadius.circular(106),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 32,
            ),
            Text(
              "노영재",
              style: context.typography.display2Bold,
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              "노영노영고등학교",
              style: context.typography.headlineMedium.copyWith(
                color: context.colors.labelAlternative,
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              "2학년 2반 · 여",
              style: context.typography.headlineMedium.copyWith(
                color: context.colors.labelAlternative,
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              "2005년생",
              style: context.typography.headlineMedium.copyWith(
                color: context.colors.labelAlternative,
              ),
            ),
            Expanded(
              child: SizedBox(),
            ),
            MoyaMoyaButton(
              text: "회원가입",
              buttonSize: ButtonSize.larger,
              buttonType: ButtonType.primary,
              rounded: true,
              onPressed: () {},
            ),
            SafeArea(
              child: SizedBox(
                height: 16,
              ),
            )
          ],
        ),
      ),
    );
  }
}
