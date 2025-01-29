import 'package:flutter/material.dart';
import 'package:moyamoya/designsystem/foundation/app_theme.dart';

class MatchingLoadingScreen extends StatefulWidget {
  const MatchingLoadingScreen({super.key});

  @override
  State<MatchingLoadingScreen> createState() => _MatchingLoadingScreenState();
}

class _MatchingLoadingScreenState extends State<MatchingLoadingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.backgroundNeutral,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(99),
                color: context.colors.fillNormal,
              ),
              child: Center(
                child: Image.network(
                  "https://moyamoya.s3.ap-northeast-2.amazonaws.com/profile-images/1.png",
                  width: 145,
                  height: 143,
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              "매칭 중..",
              style: context.typography.title2Bold,
            ),
          ],
        ),
      ),
    );
  }
}
