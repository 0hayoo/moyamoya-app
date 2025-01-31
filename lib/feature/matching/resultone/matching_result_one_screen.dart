import 'package:flutter/material.dart';
import 'package:moyamoya/designsystem/foundation/app_theme.dart';

class MatchingResultOneScreen extends StatefulWidget {
  const MatchingResultOneScreen({super.key});

  @override
  State<MatchingResultOneScreen> createState() =>
      _MatchingResultOneScreenState();
}

class _MatchingResultOneScreenState extends State<MatchingResultOneScreen>
    with TickerProviderStateMixin {
  late AnimationController _oneController;
  late Animation<Offset> _slideOneAnimation;
  late Animation<double> _fadeOneAnimation;

  late AnimationController _twoController;
  late Animation<Offset> _slideTwoAnimation;
  late Animation<double> _fadeTwoAnimation;

  @override
  void initState() {
    super.initState();
    _oneController = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );
    _slideOneAnimation = Tween<Offset>(
      begin: Offset(0, 1), // 아래에서 시작
      end: Offset(0, 0), // 제자리로 이동
    ).animate(CurvedAnimation(
      parent: _oneController,
      curve: Curves.easeOut, // 부드러운 곡선 적용
    ));
    _fadeOneAnimation = Tween<double>(
      begin: 0, // 완전 투명
      end: 1, // 완전 불투명
    ).animate(CurvedAnimation(
      parent: _oneController,
      curve: Curves.easeOut,
    ));

    _twoController = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );
    _slideTwoAnimation = Tween<Offset>(
      begin: Offset(0, 1), // 아래에서 시작
      end: Offset(0, 0), // 제자리로 이동
    ).animate(CurvedAnimation(
      parent: _twoController,
      curve: Curves.easeOut, // 부드러운 곡선 적용
    ));
    _fadeTwoAnimation = Tween<double>(
      begin: 0, // 완전 투명
      end: 1, // 완전 불투명
    ).animate(CurvedAnimation(
      parent: _twoController,
      curve: Curves.easeOut,
    ));

    Future.delayed(Duration(milliseconds: 300), () {
      _oneController.forward(); // 애니메이션 실행
    });

    Future.delayed(Duration(milliseconds: 1300), () {
      _twoController.forward(); // 애니메이션 실행
    });
  }

  @override
  void dispose() {
    _oneController.dispose();
    _twoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.backgroundNeutral,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            FadeTransition(
              opacity: _fadeOneAnimation, // 투명도 애니메이션 적용
              child: SlideTransition(
                position: _slideOneAnimation,
                child: Text(
                  "대구소프트웨어마이스터고등학교\n남학생 168명 중에서",
                  style: context.typography.headlineBold,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            FadeTransition(
              opacity: _fadeTwoAnimation, // 투명도 애니메이션 적용
              child: SlideTransition(
                position: _slideTwoAnimation,
                child: Text(
                  "너와 매칭된 상대는...",
                  style: context.typography.title2Bold.copyWith(
                    color: context.colors.primaryNormal,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
