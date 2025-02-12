import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:moyamoya/designsystem/component/top_app_bar.dart';
import 'package:moyamoya/designsystem/extension/padding_extension.dart';
import 'package:moyamoya/designsystem/foundation/app_theme.dart';
import 'package:moyamoya/designsystem/foundation/moya_moya_icons_icons.dart';
import 'package:moyamoya/ui/bottom_navigation_bar.dart';

class PointOriginScreen extends StatefulWidget {
  const PointOriginScreen({
    super.key,
    required this.navigateToHome,
  });

  final VoidCallback navigateToHome;

  @override
  State<PointOriginScreen> createState() => _PointOriginScreenState();
}

class _PointOriginScreenState extends State<PointOriginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.backgroundAlternative,
      appBar: MoyaMoyaTopAppBar(
        title: "포인트",
        appBarType: TopAppBarType.basic,
      ),
      bottomNavigationBar: MoyaMoyaBottomNavigationBar(
        selectedItem: BottomNavItem.point,
        onItemPressed: (item) {
          switch (item) {
            case BottomNavItem.box:
              "";
            case BottomNavItem.home:
              widget.navigateToHome();
            case BottomNavItem.point:
              "";
          }
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  MoyaMoyaIcons.flamefill,
                  size: 28,
                  color: context.colors.primaryNormal,
                ),
                Text(
                  NumberFormat("#,###").format(1250),
                  style: context.typography.title3Bold.copyWith(
                    color: context.colors.primaryNormal,
                  ),
                ),
              ],
            ).padding(
              EdgeInsets.only(
                top: 16,
                bottom: 16,
                left: 12,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "새로 생겼어요",
                style: context.typography.headlineBold.copyWith(
                  color: context.colors.labelAlternative,
                ),
              ).padding(
                EdgeInsets.only(
                  left: 4,
                ),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 30,
                itemBuilder: (context, index) {
                  return _buildPointCard(
                    icon: null,
                    title: "새로운 미션 $index",
                    point: index * 10,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPointCard({
    String? icon,
    required String title,
    required int point,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 12,
      children: [
        _buildIcon(icon),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 4,
          children: [
            Text(
              "MBTI 선택하기",
              style: context.typography.headlineBold.copyWith(
                color: context.colors.labelAlternative,
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  MoyaMoyaIcons.flamefill,
                  size: 18,
                  color: context.colors.labelAssistive.withValues(alpha: 0.5),
                ),
                Text(
                  NumberFormat("#,###").format(1250),
                  style: context.typography.bodyMedium.copyWith(
                    color: context.colors.labelAssistive.withValues(alpha: 0.5),
                  ),
                ),
              ],
            )
          ],
        )
      ],
    ).padding(const EdgeInsets.all(8));
  }

  Widget _buildIcon(String? icon) {
    if (icon == null) {
      return Container(
        width: 52,
        height: 52,
        decoration: BoxDecoration(
            color: context.colors.backgroundNormal,
            borderRadius: BorderRadius.circular(66)),
      );
    }
    return ClipRRect(
      borderRadius: BorderRadius.circular(66),
      child: Image.network(
        icon,
        width: 52,
        height: 52,
      ),
    );
  }
}
