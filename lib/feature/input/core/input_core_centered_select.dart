import 'package:flutter/material.dart';
import 'package:moyamoya/designsystem/component/bottom_sheet.dart';
import 'package:moyamoya/designsystem/component/clickable.dart';
import 'package:moyamoya/designsystem/extension/padding_extension.dart';
import 'package:moyamoya/designsystem/foundation/app_theme.dart';
import 'package:moyamoya/designsystem/foundation/moya_moya_icons_icons.dart';
import 'package:smooth_corner/smooth_corner.dart';

class InputCoreCenteredSelect extends StatelessWidget {
  const InputCoreCenteredSelect({
    super.key,
    required this.text,
    required this.items,
    required this.onItemPressed,
  });

  final String text;
  final List<String> items;
  final Function(String) onItemPressed;

  @override
  Widget build(BuildContext context) {
    return MoyaMoyaClickable(
      onPressed: () {
        showMoyaMoyaBottomSheet(
          context: context,
          builder: _buildBottomSheet,
        );
      },
      borderRadius: BorderRadius.circular(99),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: 56,
        ),
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
          child: Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: Text(
                  text,
                  style: context.typography.headlineMedium.copyWith(
                    color: context.colors.labelStrong,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Icon(
                  MoyaMoyaIcons.arrow_down,
                  size: 24,
                  color: context.colors.labelNormal.withValues(alpha: 0.5),
                ).padding(
                  EdgeInsets.only(
                    right: 16,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBottomSheet(
    BuildContext context,
    StateSetter setBottomSheetState,
  ) {
    return SizedBox(
      width: double.infinity,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.4, // maxHeight 적용
        ),
        child: ListView(
          shrinkWrap: true,
          children: items
              .map(
                (item) => MoyaMoyaClickable(
                  onPressed: () {
                    onItemPressed(item);
                    Navigator.pop(context);
                  },
                  child: SizedBox(
                    height: 40,
                    width: double.infinity,
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        item,
                        style: context.typography.headlineMedium,
                      ),
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
