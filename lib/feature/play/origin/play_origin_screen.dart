import 'package:flutter/material.dart';
import 'package:moyamoya/designsystem/component/button.dart';
import 'package:moyamoya/designsystem/component/icon_button.dart';
import 'package:moyamoya/designsystem/component/top_app_bar.dart';
import 'package:moyamoya/designsystem/foundation/app_theme.dart';
import 'package:moyamoya/designsystem/foundation/moya_moya_icons_icons.dart';
import 'package:smooth_corner/smooth_corner.dart';

class PlayOriginScreen extends StatefulWidget {
  const PlayOriginScreen({
    super.key,
    required this.popBackStack,
  });

  final VoidCallback popBackStack;

  @override
  State<PlayOriginScreen> createState() => _PlayOriginScreenState();
}

class _PlayOriginScreenState extends State<PlayOriginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.backgroundNeutral,
      appBar: MoyaMoyaTopAppBar(
        title: "",
        appBarType: TopAppBarType.small,
        onBackPressed: () {},
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 48,
          ),
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              width: 180,
              height: 180,
              child: Stack(
                children: [
                  SizedBox(
                    width: 180,
                    height: 180,
                    child: CircularProgressIndicator(
                      value: 0.74,
                      backgroundColor: context.colors.fillAlternative,
                      color: context.colors.primaryNormal,
                      strokeWidth: 18,
                      strokeAlign: BorderSide.strokeAlignCenter,
                      strokeCap: StrokeCap.round,
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "호감도",
                          style: context.typography.labelMedium.copyWith(
                            color: context.colors.labelAssistive,
                          ),
                        ),
                        Text(
                          "74",
                          style: context.typography.display1Bold.copyWith(
                            color: context.colors.primaryNormal,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 24,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 57,
            ),
            child: Container(
              width: double.infinity,
              decoration: ShapeDecoration(
                shape: SmoothRectangleBorder(
                  smoothness: 0.6,
                  borderRadius: BorderRadius.circular(18),
                ),
                color: context.colors.backgroundNormal,
                shadows: [context.shadow.black1],
              ),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  spacing: 6,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Row(
                        children: [
                          Text(
                            "이벤트",
                            style: context.typography.bodyBold,
                          ),
                          Spacer(),
                          MoyaMoyaIconButton(
                            MoyaMoyaIcons.expandarrow,
                            iconSize: 12,
                            color: context.colors.labelAssistive,
                            innerPadding: EdgeInsets.all(4),
                            onPressed: () {},
                          )
                        ],
                      ),
                    ),
                    _buildEventItemCard(
                      icon: MoyaMoyaIcons.gamepad,
                      title: "밸런스 게임 5가지",
                      action: MoyaMoyaButton(
                        text: "시작하기",
                        buttonSize: ButtonSize.small,
                        buttonType: ButtonType.primary,
                        onPressed: () {},
                      ),
                    ),
                    _buildEventItemCard(
                      icon: MoyaMoyaIcons.question,
                      title: "만약 둘이\n무인도에 떨어진다면?",
                      action: Text(
                        "7분 남음",
                        style: context.typography.labelRegular.copyWith(
                          color: context.colors.labelAssistive,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Spacer(),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(
              horizontal: 57,
            ),
            decoration: ShapeDecoration(
              shape: SmoothRectangleBorder(
                smoothness: 0.6,
                borderRadius: BorderRadius.circular(18),
              ),
              color: context.colors.backgroundNeutral,
              shadows: [context.shadow.black1],
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: 18,
              ),
              child: Row(
                children: [
                  _buildUserCard(
                    icon:
                        "https://moyamoya.s3.ap-northeast-2.amazonaws.com/profile-images/1.png",
                    userName: "나",
                  ),
                  SizedBox(
                    width: 1,
                    height: 16 + 72 + 8 + 20.8,
                    child: ColoredBox(
                      color: context.colors.lineNeutral,
                    ),
                  ),
                  _buildUserCard(
                    icon:
                        "https://moyamoya.s3.ap-northeast-2.amazonaws.com/profile-images/1.png",
                    userName: "상대방",
                  ),
                ],
              ),
            ),
          ),
          SafeArea(
            top: false,
            child: SizedBox(
              height: 32,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildEventItemCard({
    required IconData icon,
    required String title,
    required Widget action,
  }) {
    return Container(
      width: double.infinity,
      decoration: ShapeDecoration(
        shape: SmoothRectangleBorder(
          smoothness: 0.6,
          borderRadius: BorderRadius.circular(12),
        ),
        color: context.colors.fillNormal,
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: context.colors.fillNeutral,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(4),
                      child: Icon(
                        icon,
                        size: 18,
                        color: context.colors.labelAlternative,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    title,
                    style: context.typography.headlineBold,
                  ),
                ],
              ),
            ),
            action,
          ],
        ),
      ),
    );
  }

  Widget _buildUserCard({
    required String icon,
    required String userName,
  }) {
    // 16 + 72 + 8 + 20.8
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 72,
              height: 72,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(99),
                color: context.colors.fillNormal,
              ),
              child: Center(
                child: Image.network(
                  icon,
                  width: 61,
                  height: 60,
                ),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              userName,
              style: context.typography.bodyBold,
            ),
          ],
        ),
      ),
    );
  }
}
