import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:moyamoya/designsystem/foundation/app_theme.dart';
import 'package:moyamoya/designsystem/foundation/moya_moya_icons_icons.dart';
import 'package:moyamoya/utiles/utile.dart';

class PointGetScreen extends StatefulWidget {
  const PointGetScreen({super.key});

  @override
  State<PointGetScreen> createState() => _PointGetScreenState();
}

class _PointGetScreenState extends State<PointGetScreen>
    with TickerProviderStateMixin {
  late AnimationController _textAnimationController;
  late Animation<double> _opacityAnimation;
  late Animation<Offset> _slideAnimation;

  late AnimationController _plusTextAnimationController;
  late Animation<double> _plusTextOpacityAnimation;
  late Animation<Offset> _plusTextSlideAnimation;

  late AnimationController _emojiController;
  late Animation<double> _emojiAnimation;

  static final int _beforeCounter = 1150;
  int _counter = _beforeCounter;

  @override
  void initState() {
    super.initState();

    // "100 포인트를 얻었어요!" 텍스트 애니메이션 (fade in, 유지, fade out + slide)
    _textAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 3500),
    );
    _opacityAnimation = TweenSequence<double>([
      // Fade in (30%)
      TweenSequenceItem(
        tween:
            Tween(begin: 0.0, end: 1.0).chain(CurveTween(curve: Curves.easeIn)),
        weight: 30,
      ),
      // 유지 (40%)
      TweenSequenceItem(
        tween: ConstantTween<double>(1.0),
        weight: 40,
      ),
    ]).animate(_textAnimationController);
    _slideAnimation = TweenSequence<Offset>([
      // 아래에서 중앙으로
      TweenSequenceItem(
        tween: Tween(begin: Offset(0, 0.2), end: Offset(0, 0))
            .chain(CurveTween(curve: Curves.easeOut)),
        weight: 30,
      ),
      // 잠깐 유지
      TweenSequenceItem(
        tween: ConstantTween<Offset>(Offset(0, 0)),
        weight: 40,
      ),
    ]).animate(_textAnimationController);

    // "+100" 텍스트 애니메이션 (동일한 효과)
    _plusTextAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 3500),
    );
    _plusTextOpacityAnimation = TweenSequence<double>([
      TweenSequenceItem(
        tween:
            Tween(begin: 0.0, end: 1.0).chain(CurveTween(curve: Curves.easeIn)),
        weight: 30,
      ),
      TweenSequenceItem(
        tween: ConstantTween<double>(1.0),
        weight: 40,
      ),
    ]).animate(_plusTextAnimationController);
    _plusTextSlideAnimation = TweenSequence<Offset>([
      TweenSequenceItem(
        tween: Tween(begin: Offset(0, 0.2), end: Offset(0, 0))
            .chain(CurveTween(curve: Curves.easeOut)),
        weight: 30,
      ),
      TweenSequenceItem(
        tween: ConstantTween<Offset>(Offset(0, 0)),
        weight: 40,
      ),
    ]).animate(_plusTextAnimationController);

    // 🥳 이모지 애니메이션 (지속적으로 위아래로 움직임)
    _emojiController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 800),
    );
    _emojiAnimation = Tween<double>(begin: -5, end: 5).animate(
      CurvedAnimation(
        parent: _emojiController,
        curve: Curves.easeInOut,
      ),
    );
    _emojiController.repeat(reverse: true);

    // 애니메이션 순서 제어:
    // 1. 1초 후 "100 포인트를 얻었어요!" 애니메이션 시작
    Future.delayed(Duration(seconds: 1), () {
      _textAnimationController.forward();
    });
    // 2. 2초 후 "+100" 텍스트 애니메이션 시작
    Future.delayed(Duration(seconds: 2), () {
      _plusTextAnimationController.forward();
    });
    // 3. 2.5초 후 숫자 증가 애니메이션 시작 (기존 숫자 애니메이션)
    Future.delayed(Duration(milliseconds: 2500), () {
      _incrementCounter();
    });
  }

  void _incrementCounter() {
    setState(() {
      _counter += 100;
    });
  }

  @override
  void dispose() {
    _textAnimationController.dispose();
    _plusTextAnimationController.dispose();
    _emojiController.dispose();
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
            // 🥳 이모지: 지속적으로 위아래 애니메이션 적용
            AnimatedBuilder(
              animation: _emojiAnimation,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(0, _emojiAnimation.value),
                  child: child,
                );
              },
              child: Text(
                "🥳",
                style: context.typography.title2Bold.copyWith(
                  fontSize: 84,
                ),
              ),
            ),
            SizedBox(height: 16),
            // "100 포인트를 얻었어요!" 텍스트 애니메이션
            FadeTransition(
              opacity: _opacityAnimation,
              child: SlideTransition(
                position: _slideAnimation,
                child: Text(
                  "100 포인트를 얻었어요!",
                  style: context.typography.title2Bold,
                ),
              ),
            ),
            SizedBox(height: 8),
            IntrinsicWidth(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // 숫자 애니메이션 (플레임 아이콘 + 숫자 카운트)
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        MoyaMoyaIcons.flamefill,
                        size: 20,
                        color: context.colors.primaryNormal,
                      ),
                      TweenAnimationBuilder<int>(
                        tween: IntTween(begin: _beforeCounter, end: _counter),
                        duration: Duration(milliseconds: 2000),
                        curve: Curves.easeInOut,
                        builder: (context, value, child) {
                          return Text(
                            NumberFormat("#,###").format(value),
                            style: context.typography.headlineBold.copyWith(
                              color: context.colors.primaryNormal,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  // "+100" 텍스트 애니메이션
                  if (_counter != _beforeCounter)
                    FadeTransition(
                      opacity: _plusTextOpacityAnimation,
                      child: SlideTransition(
                        position: _plusTextSlideAnimation,
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Transform.translate(
                            offset: Offset(
                              calculateTextWidth(
                                    context,
                                    "+100",
                                    context.typography.headlineBold,
                                  ) -
                                  5,
                              0,
                            ),
                            child: Text(
                              "+100",
                              style: context.typography.labelRegular.copyWith(
                                color: context.colors.labelAssistive,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
