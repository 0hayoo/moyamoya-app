import 'package:flutter/material.dart';
import 'package:moyamoya/designsystem/component/button.dart';
import 'package:moyamoya/designsystem/component/clickable.dart';
import 'package:moyamoya/designsystem/component/top_app_bar.dart';
import 'package:moyamoya/designsystem/foundation/app_theme.dart';
import 'package:moyamoya/designsystem/foundation/moya_moya_icons_icons.dart';

class SignUpInputGenderScreen extends StatefulWidget {
  const SignUpInputGenderScreen({
    super.key,
    required this.popBackStack,
  });

  final VoidCallback popBackStack;

  @override
  State<SignUpInputGenderScreen> createState() =>
      _SignUpInputGenderScreenState();
}

class _SignUpInputGenderScreenState extends State<SignUpInputGenderScreen> {
  bool? _isMale;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.backgroundNeutral,
      appBar: MoyaMoyaTopAppBar(
        title: "",
        appBarType: TopAppBarType.small,
        onBackPressed: widget.popBackStack,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 32,
        ),
        child: Column(
          children: [
            SizedBox(
              height: 48,
            ),
            Text(
              "성별",
              style: context.typography.title1Bold,
            ),
            SizedBox(
              height: 32,
            ),
            Row(
              children: [
                Expanded(
                  child: _buildGenderCard(
                      label: "남학생",
                      text: "🧑‍🎓",
                      isSelected: _isMale == true,
                      onPressed: () {
                        setState(() {
                          _isMale = _isMale == true ? null : true;
                        });
                      }),
                ),
                SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: _buildGenderCard(
                    label: "여학생",
                    text: "👩‍🎓‍",
                    isSelected: _isMale == false,
                    onPressed: () {
                      setState(() {
                        _isMale = _isMale == false ? null : false;
                      });
                    },
                  ),
                ),
              ],
            ),
            Expanded(
              child: SizedBox(),
            ),
            MoyaMoyaButton(
              text: "다음",
              buttonSize: ButtonSize.larger,
              buttonType: ButtonType.primary,
              isEnabled: _isMale != null,
              rounded: true,
              onPressed: () {},
            ),
            SafeArea(
              child: SizedBox(
                height: 16,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildGenderCard({
    required String label,
    required String text,
    required bool isSelected,
    required VoidCallback onPressed,
  }) {
    return MoyaMoyaClickable(
      onPressed: onPressed,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected
                ? context.colors.primaryNormal
                : context.colors.lineNormal,
            width: isSelected ? 3 : 1,
            strokeAlign: BorderSide.strokeAlignOutside,
          ),
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 48,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  label,
                  style: context.typography.headlineMedium.copyWith(
                    color: isSelected
                        ? context.colors.labelStrong
                        : context.colors.labelAssistive,
                  ),
                ),
                if (isSelected)
                  SizedBox(
                    width: 6,
                  ),
                if (isSelected)
                  Icon(
                    MoyaMoyaIcons.checkmark,
                    size: 16,
                    color: context.colors.primaryNormal,
                  )
              ],
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              text,
              style: context.typography.headlineMedium.copyWith(
                fontSize: 100,
                fontWeight: FontWeight.w600,
                height: 1,
              ),
            ),
            SizedBox(
              height: 24,
            ),
          ],
        ),
      ),
    );
  }
}
