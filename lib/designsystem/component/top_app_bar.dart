import 'package:flutter/material.dart';
import 'package:moyamoya/designsystem/component/clickable.dart';
import 'package:moyamoya/designsystem/foundation/app_theme.dart';

import '../foundation/moya_moya_icons_icons.dart';

enum TopAppBarType {
  basic,
  small,
}

class TopAppBarActionItem {
  const TopAppBarActionItem({
    required this.icon,
    required this.onPressed,
  });

  final IconData icon;
  final VoidCallback onPressed;
}

class MoyaMoyaTopAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MoyaMoyaTopAppBar({
    super.key,
    required this.title,
    required this.appBarType,
    this.actionItems,
    this.onBackPressed,
  });

  final String title;
  final TopAppBarType appBarType;
  final List<TopAppBarActionItem>? actionItems;
  final VoidCallback? onBackPressed;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        height: 54,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (appBarType == TopAppBarType.small) _getBackButton(context),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                    left: appBarType == TopAppBarType.basic ? 12 : 4,
                    right: 4,
                  ),
                  child: Text(
                    title,
                    style: (appBarType == TopAppBarType.basic
                            ? context.typography.title1Bold
                            : context.typography.heading2Bold)
                        .copyWith(color: context.colors.labelNormal),
                  ),
                ),
              ),
              ..._getActionItems(context)
            ],
          ),
        ),
      ),
    );
  }

  Widget _getBackButton(BuildContext context) {
    return MoyaMoyaClickable(
      onPressed: onBackPressed ?? () {},
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Icon(
          MoyaMoyaIcons.chevron_left,
          size: 24,
          color: context.colors.labelNormal,
        ),
      ),
    );
  }

  List<Widget> _getActionItems(BuildContext context) {
    if (actionItems != null) {
      return actionItems!.map((actionItem) {
        return MoyaMoyaClickable(
          onPressed: actionItem.onPressed,
          child: Padding(
            padding: EdgeInsets.all(12),
            child: Icon(
              actionItem.icon,
              size: 24,
              color: context.colors.labelAlternative,
            ),
          ),
        );
      }).toList();
    }
    return [];
  }

  @override
  Size get preferredSize => Size.fromHeight(54);
}
