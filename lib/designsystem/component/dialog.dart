import 'package:flutter/material.dart';
import 'package:moyamoya/designsystem/component/button.dart';
import 'package:moyamoya/designsystem/component/text_button.dart';
import 'package:moyamoya/designsystem/foundation/app_theme.dart';
import 'package:smooth_corner/smooth_corner.dart';

enum DialogType {
  oneButton,
  twoButton,
}

Future<void> showMoyaMoyaDialog({
  required BuildContext context,
  required String title,
  required String content,
  required VoidCallback onClosePressed,
  DialogType dialogType = DialogType.oneButton,
  VoidCallback? onSuccessPressed,
}) =>
    showDialog<void>(
        context: context,
        builder: (context) {
          return Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                width: double.infinity,
                decoration: ShapeDecoration(
                  shape: SmoothRectangleBorder(
                    smoothness: 0.6,
                    borderRadius: BorderRadius.circular(28),
                  ),
                  color: context.colors.backgroundNormal,
                ),
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(4),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title,
                              style: context.typography.title3Bold.copyWith(
                                color: context.colors.labelStrong,
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              content,
                              style: context.typography.bodyMedium.copyWith(
                                color: context.colors.labelAlternative,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 18,
                      ),
                      if (dialogType == DialogType.oneButton)
                        _buildOneButton(
                          context,
                          onClosePressed,
                        ),
                      if (dialogType == DialogType.twoButton)
                        _buildTwoButton(
                          context,
                          onClosePressed,
                          onSuccessPressed ?? () {},
                        ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });

Widget _buildOneButton(
  BuildContext context,
  VoidCallback onClosePressed,
) {
  return Align(
    alignment: Alignment.centerRight,
    child: MoyaMoyaTextButton(
      text: "닫기",
      textColor: context.colors.primaryNormal,
      onPressed: onClosePressed,
      buttonSize: TextButtonSize.medium,
    ),
  );
}

Widget _buildTwoButton(
  BuildContext context,
  VoidCallback onClosePressed,
  VoidCallback onSuccessPressed,
) {
  return Row(
    children: [
      Expanded(
        child: MoyaMoyaButton(
          text: "닫기",
          buttonSize: ButtonSize.large,
          buttonType: ButtonType.alternative,
          onPressed: onClosePressed,
        ),
      ),
      SizedBox(
        width: 8,
      ),
      Expanded(
        child: MoyaMoyaButton(
          text: "확인",
          buttonSize: ButtonSize.large,
          buttonType: ButtonType.primary,
          onPressed: onSuccessPressed,
        ),
      ),
    ],
  );
}
