import 'package:flutter/material.dart';
import 'package:moyamoya/designsystem/component/button.dart';
import 'package:moyamoya/designsystem/component/dialog.dart';
import 'package:moyamoya/designsystem/component/text_button.dart';
import 'package:moyamoya/designsystem/foundation/app_theme.dart';

class MatchingResultTwoScreen extends StatefulWidget {
  const MatchingResultTwoScreen({super.key});

  @override
  State<MatchingResultTwoScreen> createState() =>
      _MatchingResultTwoScreenState();
}

class _MatchingResultTwoScreenState extends State<MatchingResultTwoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.backgroundNeutral,
      body: Column(
        children: [
          SafeArea(
            child: SizedBox(
              height: 72,
            ),
          ),
          Text(
            "너와 매칭된 상대는...",
            style: context.typography.title2Bold.copyWith(
              color: context.colors.primaryNormal,
            ),
          ),
          SizedBox(
            height: 72,
          ),
          Container(
            width: 108,
            height: 108,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(99),
              color: context.colors.fillNormal,
            ),
            child: Center(
              child: Image.network(
                "https://moyamoya.s3.ap-northeast-2.amazonaws.com/profile-images/1.png",
                width: 92,
                height: 91,
              ),
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 81),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                border: Border.all(
                  color: context.colors.primaryNormal,
                  width: 2,
                  strokeAlign: BorderSide.strokeAlignOutside,
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _buildItem(
                        title: "나이",
                        content: "동갑",
                      ),
                      Container(
                        width: 1,
                        height: 56 + 18.2 + 26,
                        color: context.colors.lineNeutral,
                      ),
                      _buildItem(
                        title: "MBTI",
                        content: "ESTJ",
                      ),
                    ],
                  ),
                  Container(
                    width: double.infinity,
                    height: 1,
                    color: context.colors.lineNeutral,
                  ),
                  Row(
                    children: [
                      _buildItem(
                        title: "취미",
                        content: "운동",
                      ),
                      Container(
                        width: 1,
                        height: 56 + 18.2 + 26,
                        color: context.colors.lineNeutral,
                      ),
                      _buildItem(
                        title: "키",
                        content: "보통",
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(child: SizedBox()),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 32,
            ),
            child: MoyaMoyaButton(
              text: "계속 진행하기",
              buttonSize: ButtonSize.larger,
              buttonType: ButtonType.primary,
              onPressed: () {
                showMoyaMoyaDialog(
                  context: context,
                  title: "상대방이\n매칭을 취소했어요 😢",
                  content: "괜찮아요. 또 다른 인연을 찾아봅시다",
                  dialogType: TwoButton(
                    closeText: "닫기",
                    successText: "홈으로",
                    onClosePressed: () {
                      Navigator.pop(context);
                    },
                    onSuccessPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 4,
          ),
          MoyaMoyaTextButton(
            text: "매칭 취소",
            buttonSize: TextButtonSize.medium,
            onPressed: () {
              showMoyaMoyaDialog(
                context: context,
                title: "정말 매칭을\n취소하시겠습니까?",
                content: "매칭을 취소하면 패널티를 받아요",
                dialogType: TwoButton(
                  closeText: "닫기",
                  successText: "매칭 취소",
                  onClosePressed: () {
                    Navigator.pop(context);
                  },
                  onSuccessPressed: () {
                    Navigator.pop(context);
                  },
                ),
              );
            },
          ),
          SafeArea(
            top: false,
            child: SizedBox(
              height: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildItem({
    required String title,
    required String content,
  }) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 28,
        ),
        child: Center(
          child: Column(
            children: [
              Text(
                title,
                style: context.typography.labelRegular,
              ),
              Text(
                content,
                style: context.typography.heading2Bold,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
