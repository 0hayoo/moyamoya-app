import 'package:flutter/material.dart';
import 'package:moyamoya/designsystem/component/clickable.dart';
import 'package:moyamoya/designsystem/foundation/app_theme.dart';
import 'package:moyamoya/designsystem/foundation/moya_moya_icons_icons.dart';
import 'package:smooth_corner/smooth_corner.dart';

enum BottomNavItem {
  box,
  home,
  point,
}

typedef BottomNavItemClick = Function(BottomNavItem);

class MoyaMoyaBottomNavigationBar extends StatelessWidget {
  const MoyaMoyaBottomNavigationBar({
    super.key,
    required this.selectedItem,
    required this.onItemPressed,
  });

  final BottomNavItem selectedItem;
  final BottomNavItemClick onItemPressed;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Container(
        height: 60,
        decoration: ShapeDecoration(
          shape: SmoothRectangleBorder(
            smoothness: 0.6,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(18),
              topRight: Radius.circular(18),
            ),
          ),
          color: context.colors.backgroundAlternative,
          shadows: [
            context.shadow.black1.copyWith(
              offset: Offset(0, 0),
            ),
          ],
        ),
        margin: EdgeInsets.only(
          left: 24,
          right: 24,
          bottom: 4,
        ),
        child: Row(
          children: [
            _buildItem(
              context: context,
              icon: MoyaMoyaIcons.email,
              onPressed: () {},
              isSelected: BottomNavItem.box == selectedItem,
            ),
            _buildItem(
              context: context,
              icon: MoyaMoyaIcons.home,
              onPressed: () {},
              isSelected: BottomNavItem.home == selectedItem,
            ),
            _buildItem(
              context: context,
              icon: MoyaMoyaIcons.flame,
              onPressed: () {},
              isSelected: BottomNavItem.point == selectedItem,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildItem({
    required BuildContext context,
    required IconData icon,
    required VoidCallback onPressed,
    required bool isSelected,
  }) {
    return Expanded(
      child: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: MoyaMoyaClickable(
          onPressed: isSelected ? () {} : onPressed,
          borderRadius: BorderRadius.zero,
          child: Center(
            child: Icon(
              icon,
              size: 36,
              color: isSelected
                  ? context.colors.labelNormal
                  : context.colors.labelAssistive.withValues(
                      alpha: 0.4,
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
