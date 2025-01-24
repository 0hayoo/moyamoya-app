import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moyamoya/designsystem/component/bottom_sheet.dart';
import 'package:moyamoya/designsystem/component/button.dart';
import 'package:moyamoya/designsystem/component/clickable.dart';
import 'package:moyamoya/designsystem/component/top_app_bar.dart';
import 'package:moyamoya/designsystem/foundation/app_theme.dart';
import 'package:smooth_corner/smooth_corner.dart';

class SignUpInputSchoolInfoScreen extends StatefulWidget {
  SignUpInputSchoolInfoScreen({
    super.key,
    required this.popBackStack,
    required this.navigateToSignUpInputProfileScreen,
  });

  final Function(
    String phone,
    String verifyCode,
    int schoolId,
    String schoolName,
    String schoolType,
    int schoolGrade,
    int schoolClass,
  ) navigateToSignUpInputProfileScreen;
  final VoidCallback popBackStack;

  final String phone = Get.parameters["phone"] ?? "";
  final String verifyCode = Get.parameters["verifyCode"] ?? "";
  final int schoolId = int.parse(Get.parameters["schoolId"] ?? "0");
  final String schoolName = Get.parameters["schoolName"] ?? "";
  final String schoolType = Get.parameters["schoolType"] ?? "";

  @override
  State<SignUpInputSchoolInfoScreen> createState() =>
      _SignUpInputSchoolInfoScreenState();
}

class _SignUpInputSchoolInfoScreenState
    extends State<SignUpInputSchoolInfoScreen> {
  int? _grade;
  int? _room;

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
                text: "${_grade?.toString() ?? ""}학년",
                onPressed: () {
                  showMoyaMoyaBottomSheet(
                    context: context,
                    builder: (context, _) {
                      return _buildBottomSheet(
                        items: _getGradeList(),
                        suffix: "학년",
                        onItemPressed: (item) {
                          setState(() {
                            _grade = item;
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
                text: "${_room?.toString() ?? ""}반",
                onPressed: () {
                  showMoyaMoyaBottomSheet(
                    context: context,
                    builder: (context, _) {
                      return _buildBottomSheet(
                        items: [
                          1,
                          2,
                          3,
                          4,
                          5,
                          6,
                          7,
                          8,
                          9,
                          10,
                          11,
                          12,
                          13,
                          14,
                          15,
                          16,
                          17,
                          18,
                          19,
                          20
                        ],
                        suffix: "반",
                        onItemPressed: (item) {
                          setState(() {
                            _room = item;
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
                  isEnabled: _grade != null && _room != null,
                  onPressed: () {
                    widget.navigateToSignUpInputProfileScreen(
                      widget.phone,
                      widget.verifyCode,
                      widget.schoolId,
                      widget.schoolName,
                      widget.schoolType,
                      _grade!,
                      _room!,
                    );
                  },
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

  List<int> _getGradeList() => switch (widget.schoolType) {
        "high" => [1, 2, 3],
        "middle" => [1, 2, 3],
        _ => [1, 2, 3, 4, 5, 6],
      };
}
