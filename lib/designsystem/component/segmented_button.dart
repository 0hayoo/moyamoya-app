import 'package:flutter/material.dart';
import 'package:moyamoya/designsystem/foundation/app_theme.dart';
import 'package:smooth_corner/smooth_corner.dart';

class MoyaMoyaSegmentedButton extends StatefulWidget {
  final List<MoyaMoyaSegment> segments;

  const MoyaMoyaSegmentedButton({
    super.key,
    required this.segments,
  });

  @override
  _MoyaMoyaSegmentedButtonState createState() =>
      _MoyaMoyaSegmentedButtonState();
}

class _MoyaMoyaSegmentedButtonState extends State<MoyaMoyaSegmentedButton> {
  @override
  Widget build(BuildContext context) {
    int selectedIndex =
        widget.segments.indexWhere((segment) => segment.selected);

    return LayoutBuilder(
      builder: (context, constraints) {
        // 부모의 최대 너비를 기준으로 segmentWidth 계산
        final double segmentWidth =
            constraints.maxWidth / widget.segments.length;
        print(constraints.maxWidth);
        return Container(
          height: SegmentedButtonDefaults.defaultContainerHeight,
          decoration: ShapeDecoration(
            color: context.colors.fillNeutral,
            shape: SmoothRectangleBorder(
              borderRadius: SegmentedButtonDefaults.containerShape,
              smoothness: 0.6,
            ),
          ),
          child: Stack(
            children: [
              // Indicator
              AnimatedPositioned(
                duration: const Duration(milliseconds: 150),
                curve: Curves.easeIn,
                top: 4,
                left: selectedIndex * segmentWidth + 4,
                child: Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Container(
                    alignment: Alignment.center,
                    width: segmentWidth - 8,
                    height: SegmentedButtonDefaults.defaultContainerHeight - 8,
                    decoration: ShapeDecoration(
                      color: context.colors.fillAssistive,
                      shape: SmoothRectangleBorder(
                        borderRadius: SegmentedButtonDefaults.segmentShape,
                        smoothness: 0.6,
                      ),
                    ),
                  ),
                ),
              ),
              // Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: widget.segments.map((segment) {
                  return Flexible(
                    child: GestureDetector(
                      onTap: segment.enabled ? segment.onClick : null,
                      behavior: HitTestBehavior.translucent,
                      child: Container(
                        alignment: Alignment.center,
                        height: SegmentedButtonDefaults.defaultContainerHeight,
                        child: Text(
                          segment.text,
                          style: context.typography.headlineMedium.copyWith(
                            color: segment.selected
                                ? context.colors.labelNormal
                                : context.colors.labelNormal
                                    .withValues(alpha: 0.5),
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        );
      },
    );
  }
}

class MoyaMoyaSegment {
  final bool selected;
  final VoidCallback onClick;
  final String text;
  final bool enabled;

  MoyaMoyaSegment({
    required this.selected,
    required this.onClick,
    required this.text,
    this.enabled = true,
  });
}

class SegmentedButtonDefaults {
  static const double defaultContainerHeight = 48.0;
  static const BorderRadius containerShape =
      BorderRadius.all(Radius.circular(12.0));
  static const BorderRadius segmentShape =
      BorderRadius.all(Radius.circular(8.0));
}
