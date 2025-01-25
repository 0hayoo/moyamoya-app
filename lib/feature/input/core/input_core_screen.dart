import 'package:flutter/material.dart';
import 'package:moyamoya/designsystem/component/button.dart';
import 'package:moyamoya/designsystem/component/top_app_bar.dart';
import 'package:moyamoya/designsystem/extension/padding_extension.dart';
import 'package:moyamoya/designsystem/foundation/app_theme.dart';

class InputCoreScreen extends StatelessWidget {
  const InputCoreScreen({
    super.key,
    required this.title,
    required this.isEnabled,
    required this.onBackPressed,
    required this.onButtonPressed,
    this.isExpanded = true,
    required this.child,
  });

  final String title;
  final bool isEnabled;
  final VoidCallback onBackPressed;
  final VoidCallback onButtonPressed;
  final bool isExpanded;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.backgroundNeutral,
      appBar: MoyaMoyaTopAppBar(
        title: "",
        appBarType: TopAppBarType.small,
        onBackPressed: onBackPressed,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 48,
          ),
          Text(
            title,
            style: context.typography.title1Bold,
          ),
          SizedBox(
            height: 16,
          ),
          if (isExpanded)
            Expanded(
              child: child,
            ),
          if (!isExpanded) child,
          if (!isExpanded) Spacer(),
          SizedBox(
            height: 16,
          ),
          MoyaMoyaButton(
            text: "선택",
            buttonSize: ButtonSize.larger,
            buttonType: ButtonType.primary,
            onPressed: onButtonPressed,
            isEnabled: isEnabled,
            rounded: true,
          ),
          SafeArea(
            child: SizedBox(
              height: 16,
            ),
          ),
        ],
      ).padding(
        EdgeInsets.symmetric(horizontal: 32),
      ),
    );
  }
}
