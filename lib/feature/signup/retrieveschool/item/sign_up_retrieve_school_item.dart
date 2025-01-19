import 'package:flutter/material.dart';
import 'package:moyamoya/designsystem/component/clickable.dart';
import 'package:moyamoya/designsystem/foundation/app_theme.dart';

class SignUpRetrieveSchoolItem extends StatelessWidget {
  const SignUpRetrieveSchoolItem({
    super.key,
    required this.onPressed,
    required this.schoolName,
    required this.localName,
    required this.usingUser,
  });

  final VoidCallback onPressed;
  final String schoolName;
  final String localName;
  final String usingUser;

  @override
  Widget build(BuildContext context) {
    return MoyaMoyaClickable(
      onPressed: onPressed,
      borderRadius: BorderRadius.circular(12),
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      schoolName,
                      style: context.typography.bodyMedium,
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      localName,
                      style: context.typography.labelMedium.copyWith(
                        color: context.colors.labelAssistive,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 8,
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  usingUser,
                  style: context.typography.labelMedium.copyWith(
                    color: context.colors.labelNormal.withValues(alpha: 0.4),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
