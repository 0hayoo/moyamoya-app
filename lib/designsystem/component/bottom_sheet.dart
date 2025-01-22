import "package:flutter/material.dart";
import "package:moyamoya/designsystem/foundation/app_theme.dart";
import "package:smooth_corner/smooth_corner.dart";

Future<void> showMoyaMoyaBottomSheet({
  required BuildContext context,
  required StatefulWidgetBuilder builder,
  StatefulWidgetBuilder? scrollableBuilder,
}) =>
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
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
                    // child: SingleChildScrollView(
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
                      // ),
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );

Future<void> showMoyaMoyaScrollableBottomSheet({
  required BuildContext context,
  required StatefulWidgetBuilder builder,
  StatefulWidgetBuilder? scrollableBuilder,
  double initialChildSize = 0.5,
  double minChildSize = 0.25,
  double maxChildSize = 1.0,
}) =>
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return DraggableScrollableSheet(
          expand: false,
          snap: true,
          initialChildSize: initialChildSize,
          minChildSize: minChildSize,
          maxChildSize: maxChildSize,
          builder: (context, controller) {
            return StatefulBuilder(
              builder: (
                BuildContext context,
                void Function(void Function()) setState,
              ) =>
                  SingleChildScrollView(
                controller: controller,
                child: SafeArea(
                  child: Container(
                    margin: EdgeInsets.all(12),
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
                      // child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          // 24 + 8 + 4 + 4 + 16
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
                        // ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
