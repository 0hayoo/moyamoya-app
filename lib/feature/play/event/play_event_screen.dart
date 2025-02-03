import 'package:flutter/material.dart';
import 'package:moyamoya/designsystem/component/top_app_bar.dart';
import 'package:moyamoya/designsystem/extension/padding_extension.dart';
import 'package:moyamoya/designsystem/foundation/app_theme.dart';
import 'package:smooth_corner/smooth_corner.dart';

class PlayEventScreen extends StatefulWidget {
  const PlayEventScreen({super.key});

  @override
  State<PlayEventScreen> createState() => _PlayEventScreenState();
}

class _PlayEventScreenState extends State<PlayEventScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.backgroundNeutral,
      appBar: MoyaMoyaTopAppBar(
        title: "",
        appBarType: TopAppBarType.small,
        onBackPressed: () {},
      ),
      body: Column(
        children: [
          SizedBox(
            height: 48,
          ),
          Text(
            "이벤트",
            style: context.typography.title2Bold,
          ),
          SizedBox(
            height: 16,
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: ShapeDecoration(
                shape: SmoothRectangleBorder(
                  smoothness: 0.6,
                  borderRadius: BorderRadius.circular(18),
                ),
                color: context.colors.backgroundNormal,
                shadows: [context.shadow.black1],
              ),
              child: Padding(
                padding: EdgeInsets.all(12),
                child: ListView(
                  children: [
                    SizedBox(
                      height: 16,
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ).padding(
        EdgeInsets.symmetric(
          horizontal: 32,
        ),
      ),
    );
  }

  Widget _buildRowEventItemCard({
    required IconData icon,
    required String title,
    required Widget child,
  }) {
    return Container(
      width: double.infinity,
      decoration: ShapeDecoration(
        shape: SmoothRectangleBorder(
          smoothness: 0.6,
          borderRadius: BorderRadius.circular(12),
        ),
        color: context.colors.fillNormal,
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: context.colors.fillNeutral,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(4),
                      child: Icon(
                        icon,
                        size: 18,
                        color: context.colors.labelAlternative,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    title,
                    style: context.typography.headlineBold,
                  ),
                ],
              ),
            ),
            child,
          ],
        ),
      ),
    );
  }

  Widget _buildColumnEventItemCard({
    required IconData icon,
    required String title,
    required Widget child,
  }) {
    return Container(
      width: double.infinity,
      decoration: ShapeDecoration(
        shape: SmoothRectangleBorder(
          smoothness: 0.6,
          borderRadius: BorderRadius.circular(12),
        ),
        color: context.colors.fillNormal,
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: context.colors.fillNeutral,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Padding(
                padding: EdgeInsets.all(4),
                child: Icon(
                  icon,
                  size: 18,
                  color: context.colors.labelAlternative,
                ),
              ),
            ),
            SizedBox(
              height: 6,
            ),
            Text(
              title,
              style: context.typography.headlineBold,
            ),
            SizedBox(
              height: 12,
            ),
            child,
          ],
        ),
      ),
    );
  }
}
