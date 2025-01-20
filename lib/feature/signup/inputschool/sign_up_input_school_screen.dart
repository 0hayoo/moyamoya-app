import 'package:flutter/material.dart';
import 'package:moyamoya/designsystem/component/bottom_sheet.dart';
import 'package:moyamoya/designsystem/component/button.dart';
import 'package:moyamoya/designsystem/component/clickable.dart';
import 'package:moyamoya/designsystem/component/top_app_bar.dart';
import 'package:moyamoya/designsystem/foundation/app_theme.dart';
import 'package:smooth_corner/smooth_corner.dart';

class SignUpInputSchoolScreen extends StatefulWidget {
  const SignUpInputSchoolScreen({
    super.key,
    required this.popBackStack,
  });

  final VoidCallback popBackStack;

  @override
  State<SignUpInputSchoolScreen> createState() =>
      _SignUpInputSchoolScreenState();
}

class _SignUpInputSchoolScreenState extends State<SignUpInputSchoolScreen> {
  int? grade;
  int? room;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                "학번 정보",
                style: context.typography.title1Bold,
              ),
              SizedBox(
                height: 32,
              ),
              _cardText(
                text: "${grade?.toString() ?? ""}학년",
                onPressed: () {
                  showMoyaMoyaBottomSheet(
                    context: context,
                    builder: (context, _) {
                      return _buildBottomSheet(
                        items: [1, 2, 3, 4, 5, 6],
                        suffix: "학년",
                        onItemPressed: (item) {
                          setState(() {
                            grade = item;
                          });
                          Navigator.pop(context);
                        },
                      );
                    },
                  );
                },
              ),
              SizedBox(
                height: 12,
              ),
              _cardText(
                text: "${room?.toString() ?? ""}반",
                onPressed: () {
                  showMoyaMoyaBottomSheet(
                    context: context,
                    builder: (context, _) {
                      return _buildBottomSheet(
                        items: [1, 2, 3, 4, 5, 6, 7, 8, 9],
                        suffix: "반",
                        onItemPressed: (item) {
                          setState(() {
                            room = item;
                          });
                          Navigator.pop(context);
                        },
                      );
                    },
                  );
                },
              ),
              Expanded(
                child: SizedBox(),
              ),
              SizedBox(
                width: double.infinity,
                child: MoyaMoyaButton(
                  text: "다음",
                  buttonSize: ButtonSize.larger,
                  buttonType: ButtonType.primary,
                  onPressed: () {},
                  rounded: true,
                ),
              ),
              SafeArea(
                child: SizedBox(
                  height: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBottomSheet<T>({
    required List<T> items,
    required String suffix,
    required Function(T) onItemPressed,
  }) {
    return SizedBox(
      width: double.infinity,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: 300, // maxHeight 적용
        ),
        child: ListView(
          shrinkWrap: true,
          children: items
              .map(
                (item) => MoyaMoyaClickable(
                  onPressed: () {
                    onItemPressed(item);
                  },
                  child: SizedBox(
                    height: 40,
                    width: double.infinity,
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(item.toString() + suffix),
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }

  Widget _cardText({
    required String text,
    required VoidCallback onPressed,
  }) {
    return MoyaMoyaClickable(
      onPressed: onPressed,
      borderRadius: BorderRadius.circular(99),
      child: Container(
        width: double.infinity,
        height: 56,
        decoration: ShapeDecoration(
          color: context.colors.backgroundNormal,
          shape: SmoothRectangleBorder(
            borderRadius: BorderRadius.circular(99),
            smoothness: 0.6,
          ),
          shadows: [context.shadow.black1],
        ),
        child: Center(
          child: Text(
            text,
            style: context.typography.headlineMedium.copyWith(
              color: context.colors.labelStrong.withValues(alpha: 0.65),
            ),
          ),
        ),
      ),
    );
  }
}
