import 'package:flutter/cupertino.dart';
import 'package:moyamoya/designsystem/foundation/app_theme.dart';
import 'package:smooth_corner/smooth_corner.dart';

typedef OnCheckChanged = void Function(bool value);

class MoyaMoyaToggle extends StatefulWidget {
  const MoyaMoyaToggle({
    super.key,
    required this.isChecked,
    required this.onChanged,
  });

  final bool isChecked;
  final OnCheckChanged onChanged;
  @override
  MoyaMoyaToggleState createState() => MoyaMoyaToggleState();
}

class MoyaMoyaToggleState extends State<MoyaMoyaToggle> {
  final duration = Duration(milliseconds: 100);
  final width = 51.0, height = 31.0;
  final ballSize = 27.0, ballPadding = 2.0;

  // double switchLeft = (51.0 - 25.0) - 2;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: AnimatedContainer(
        duration: duration,
        width: width,
        height: height,
        decoration: ShapeDecoration(
          shape: SmoothRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(99)),
          ),
          color: widget.isChecked
              ? context.colors.primaryNormal
              : context.colors.fillAlternative,
        ),
        child: renderSwitchBall(),
      ),
      onTap: () {
        widget.onChanged(!widget.isChecked);
        setState(() {});
      },
    );
  }

  renderSwitchBall() {
    final ballRadius = ballSize / 2;

    return Stack(
      children: [
        AnimatedPositioned(
          duration: duration,
          top: 2,
          left:
              widget.isChecked ? (width - ballSize) - ballPadding : ballPadding,
          child: Container(
            width: ballSize,
            height: ballSize,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(ballRadius),
              ),
              color: context.colors.staticWhite,
              boxShadow: [context.shadow.black1],
            ),
          ),
        ),
      ],
    );
  }
}
