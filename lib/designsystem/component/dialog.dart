import 'package:flutter/material.dart';
import 'package:moyamoya/designsystem/component/button.dart';
import 'package:moyamoya/designsystem/component/text_button.dart';
import 'package:moyamoya/designsystem/foundation/app_theme.dart';
import 'package:smooth_corner/smooth_corner.dart';

sealed class DialogType {}

class OneButton implements DialogType {
  const OneButton({
    this.text = "닫기",
    required this.onClosePressed,
  });
  final String text;
  final VoidCallback onClosePressed;
}

class TwoButton implements DialogType {
  const TwoButton({
    this.closeText = "닫기",
    this.successText = "확인",
    required this.onClosePressed,
    required this.onSuccessPressed,
  });

  final String closeText;
  final String successText;
  final VoidCallback onClosePressed;
  final VoidCallback onSuccessPressed;
}

Future<void> showMoyaMoyaDialog({
  required BuildContext context,
  required String title,
  required String content,
  required DialogType dialogType,
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
                      if (dialogType is OneButton)
                        _buildOneButton(
                          context,
                          dialogType.text,
                          dialogType.onClosePressed,
                        ),
                      if (dialogType is TwoButton)
                        _buildTwoButton(
                          context,
                          dialogType.closeText,
                          dialogType.successText,
                          dialogType.onClosePressed,
                          dialogType.onSuccessPressed,
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
  String text,
  VoidCallback onClosePressed,
) {
  return Align(
    alignment: Alignment.centerRight,
    child: MoyaMoyaTextButton(
      text: text,
      textColor: context.colors.primaryNormal,
      onPressed: onClosePressed,
      buttonSize: TextButtonSize.medium,
    ),
  );
}

Widget _buildTwoButton(
  BuildContext context,
  String closeText,
  String successText,
  VoidCallback onClosePressed,
  VoidCallback onSuccessPressed,
) {
  return Row(
    children: [
      Expanded(
        child: MoyaMoyaButton(
          text: closeText,
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
          text: successText,
          buttonSize: ButtonSize.large,
          buttonType: ButtonType.primary,
          onPressed: onSuccessPressed,
        ),
      ),
    ],
  );
}
