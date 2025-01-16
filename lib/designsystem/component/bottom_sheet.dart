import "package:flutter/material.dart";
import "package:moyamoya/designsystem/foundation/app_theme.dart";
import "package:smooth_corner/smooth_corner.dart";

Future<void> showMoyaMoyaBottomSheet({
  required BuildContext context,
  required StatefulWidgetBuilder builder,
}) =>
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return StatefulBuilder(
          builder:
              (BuildContext context, void Function(void Function()) setState) {
            return SafeArea(
              child: Padding(
                padding: EdgeInsets.all(12),
                child: Container(
                  width: double.infinity,
                  decoration: ShapeDecoration(
                    shape: SmoothRectangleBorder(
                      smoothness: 0.6,
                      borderRadius: BorderRadius.circular(28),
                    ),
                    color: context.colors.backgroundNormal,
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: 8,
                      right: 24,
                      left: 24,
                      bottom: 24,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            width: 48,
                            height: 4,
                            decoration: BoxDecoration(
                              color: context.colors.lineNormal,
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        builder(context, setState),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
