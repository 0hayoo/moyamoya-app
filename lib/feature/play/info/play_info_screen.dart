import 'package:flutter/material.dart';
import 'package:moyamoya/designsystem/component/clickable.dart';
import 'package:moyamoya/designsystem/component/dialog.dart';
import 'package:moyamoya/designsystem/component/top_app_bar.dart';
import 'package:moyamoya/designsystem/extension/padding_extension.dart';
import 'package:moyamoya/designsystem/foundation/app_theme.dart';
import 'package:moyamoya/designsystem/foundation/moya_moya_icons_icons.dart';
import 'package:smooth_corner/smooth_corner.dart';

class PlayInfoScreen extends StatefulWidget {
  const PlayInfoScreen({
    super.key,
    required this.popBackStack,
  });

  final VoidCallback popBackStack;

  @override
  State<PlayInfoScreen> createState() => _PlayInfoScreenState();
}

class _PlayInfoScreenState extends State<PlayInfoScreen> {
  final bool _isMine = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.backgroundNeutral,
      appBar: MoyaMoyaTopAppBar(
        title: "",
        appBarType: TopAppBarType.small,
        onBackPressed: widget.popBackStack,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 48,
          ),
          Text(
            "내 정보",
            style: context.typography.title2Bold,
          ),
          SizedBox(
            height: 12,
          ),
          Flexible(
            child: Container(
              decoration: ShapeDecoration(
                shape: SmoothRectangleBorder(
                  smoothness: 0.6,
                  borderRadius: BorderRadius.circular(18),
                ),
                color: context.colors.backgroundNormal,
                shadows: [context.shadow.black1],
              ),
              child: ListView(
                children: [
                  _buildInfoItemCard(
                    title: "연락텀",
                    content: "빠른",
                    isOpen: true,
                    isMine: _isMine,
                    isShowInfoDialog: false,
                  ),
                  _buildInfoItemCard(
                    title: "패션 스타일",
                    content: "캐주얼",
                    isOpen: false,
                    isMine: _isMine,
                    isShowInfoDialog: false,
                  ),
                  _buildInfoItemCard(
                    title: "안경",
                    content: "착용",
                    isOpen: true,
                    isMine: _isMine,
                    isShowInfoDialog: false,
                  ),
                  _buildInfoItemCard(
                    title: "키",
                    content: "175cm",
                    isOpen: true,
                    isMine: _isMine,
                    isShowInfoDialog: true,
                  ),
                  _buildInfoItemCard(
                    title: "학년",
                    content: "2학년",
                    isOpen: true,
                    isMine: _isMine,
                    isShowInfoDialog: true,
                  ),
                  _buildInfoItemCard(
                    title: "MBTI",
                    content: "ISFJ",
                    isOpen: true,
                    isMine: _isMine,
                    isShowInfoDialog: false,
                  ),
                  _buildInfoItemCard(
                    title: "얼굴상",
                    content: "토끼상",
                    isOpen: true,
                    isMine: _isMine,
                    isShowInfoDialog: false,
                  ),
                  _buildInfoItemCard(
                    title: "체형",
                    content: "마른",
                    isOpen: true,
                    isMine: _isMine,
                    isShowInfoDialog: false,
                  ),
                  _buildInfoItemCard(
                    title: "헤어 스타일",
                    content: "중단발/곱슬/펌 O/앞머리 O",
                    isOpen: true,
                    isMine: _isMine,
                    isShowInfoDialog: false,
                  ),
                  _buildInfoItemCard(
                    title: "피부톤",
                    content: "밝은",
                    isOpen: false,
                    isMine: false,
                    isShowInfoDialog: false,
                  ),
                ],
              ),
            ),
          ),
          SafeArea(child: SizedBox()),
        ],
      ).padding(
        EdgeInsets.symmetric(
          horizontal: 32,
        ),
      ),
    );
  }

  Widget _buildInfoItemCard({
    required String title,
    required String content,
    required bool isOpen,
    required bool isMine,
    required bool isShowInfoDialog,
  }) {
    return SizedBox(
      width: double.infinity,
      height: 58,
      child: Row(
        children: [
          Text(
            title,
            style: context.typography.heading2Bold.copyWith(
              color: isOpen
                  ? context.colors.labelNormal
                  : context.colors.labelAssistive.withValues(
                      alpha: 0.4,
                    ),
            ),
          ),
          Spacer(),
          if (isMine || (!isMine && isOpen))
            Text(
              content,
              style: context.typography.labelRegular.copyWith(
                color: isOpen
                    ? context.colors.labelNormal
                    : context.colors.labelAssistive.withValues(
                        alpha: 0.4,
                      ),
              ),
            ),
          if (isMine && isShowInfoDialog)
            Padding(
              padding: EdgeInsets.only(left: 4),
              child: MoyaMoyaClickable(
                onPressed: () {
                  showMoyaMoyaDialog(
                    context: context,
                    title: "안내사항",
                    content: "상대방에게는 해당 수치가 정확하게 보여지지 않아요!",
                    dialogType: OneButton(
                      onClosePressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  );
                },
                child: Container(
                  width: 16,
                  height: 16,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(99),
                    border: Border.all(
                      width: 1,
                      color: context.colors.labelDisable,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      "?",
                      style: context.typography.captionMedium.copyWith(
                        color: context.colors.labelAssistive,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          if (!isOpen && !isMine)
            Icon(
              MoyaMoyaIcons.lock,
              size: 20,
              color: context.colors.labelAssistive.withValues(
                alpha: 0.4,
              ),
            )
        ],
      ).padding(
        EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 16,
        ),
      ),
    );
  }
}
