import 'package:flutter/material.dart';
import 'package:moyamoya/designsystem/foundation/app_theme.dart';
import 'package:moyamoya/designsystem/foundation/moya_moya_icons_icons.dart';

enum AvatarSize {
  larger,
  large,
  medium,
  small,
  smaller,
}

class MoyaMoyaAvatar extends StatelessWidget {
  const MoyaMoyaAvatar({
    super.key,
    required this.avatarSize,
    this.image,
  });

  final String? image;
  final AvatarSize avatarSize;

  @override
  Widget build(BuildContext context) {
    final containerSize = _getContainerSize();
    return image != null
        ? ClipRRect(
            borderRadius: BorderRadius.circular(99),
            child: Image.network(
              image!,
              width: containerSize,
              height: containerSize,
              fit: BoxFit.cover,
            ),
          )
        : ClipRRect(
            borderRadius: BorderRadius.circular(99),
            child: Container(
              width: containerSize,
              height: containerSize,
              color: context.colors.fillAlternative,
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(top: containerSize / 5),
                child: Icon(
                  MoyaMoyaIcons.person,
                  size: containerSize,
                  color: context.colors.fillAssistive,
                ),
              ),
            ),
          );
  }

  double _getContainerSize() => switch (avatarSize) {
        AvatarSize.larger => 64,
        AvatarSize.large => 42,
        AvatarSize.medium => 32,
        AvatarSize.small => 28,
        AvatarSize.smaller => 20,
      };
}
