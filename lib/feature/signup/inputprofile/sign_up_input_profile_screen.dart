import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moyamoya/designsystem/component/avatar.dart';
import 'package:moyamoya/designsystem/component/bottom_sheet.dart';
import 'package:moyamoya/designsystem/component/button.dart';
import 'package:moyamoya/designsystem/component/clickable.dart';
import 'package:moyamoya/designsystem/component/text_field.dart';
import 'package:moyamoya/designsystem/component/top_app_bar.dart';
import 'package:moyamoya/designsystem/foundation/app_theme.dart';
import 'package:moyamoya/feature/signup/inputprofile/viewmodel/sign_up_input_profile_viewmodel.dart';

class SignUpInputProfileScreen extends StatefulWidget {
  const SignUpInputProfileScreen({
    super.key,
    required this.popBackStack,
  });

  final VoidCallback popBackStack;

  @override
  State<SignUpInputProfileScreen> createState() =>
      _SignUpInputProfileScreenState();
}

class _SignUpInputProfileScreenState extends State<SignUpInputProfileScreen> {
  final _nameTextController = TextEditingController();

  final _viewModel = Get.put(SignUpInputProfileViewModel());
  String? _selectingImage;
  String? _selectedImage;

  @override
  void initState() {
    _viewModel.getProfileImageList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: MoyaMoyaTopAppBar(
          title: "",
          appBarType: TopAppBarType.small,
          onBackPressed: widget.popBackStack,
        ),
        backgroundColor: context.colors.backgroundNeutral,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            children: [
              SizedBox(
                height: 48,
              ),
              Text(
                "프로필",
                style: context.typography.title1Bold,
              ),
              SizedBox(
                height: 32,
              ),
              MoyaMoyaClickable(
                onPressed: () {
                  showMoyaMoyaScrollableBottomSheet(
                    context: context,
                    builder: _buildBottomSheet,
                    initialChildSize: 1,
                  );
                },
                child: SizedBox(
                  width: 172,
                  height: 172,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      MoyaMoyaAvatar(
                        avatarSize: AvatarSize.xxl,
                      ),
                      Container(
                        width: double.infinity,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 4,
                            color: context.colors.lineNormal,
                          ),
                          borderRadius: BorderRadius.circular(99),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 32,
              ),
              SizedBox(
                width: double.infinity,
                child: MoyaMoyaTextField(
                  controller: _nameTextController,
                  hintText: "이름",
                  onSuffixClick: () {
                    _nameTextController.clear();
                  },
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.only(
                    right: 8,
                  ),
                  child: Text(
                    "실명을 입력해 주세요",
                    style: context.typography.labelMedium.copyWith(
                      color: context.colors.statusNegative,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: SizedBox(),
              ),
              SizedBox(
                width: double.infinity,
                child: MoyaMoyaButton(
                  text: "완료",
                  buttonSize: ButtonSize.larger,
                  buttonType: ButtonType.primary,
                  onPressed: () {},
                  rounded: true,
                ),
              ),
              SafeArea(
                child: SizedBox(
                  height: 16,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBottomSheet(
    BuildContext context,
    StateSetter setBottomSheetState,
  ) {
    final viewPadding = MediaQuery.of(context).viewPadding;
    final viewInsets = MediaQuery.of(context).viewInsets;
    final topSize = 16.0 + 8.0 + 28.6;
    final bottomSize = 32.0 + 56.0;
    return Obx(
      () => Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 16,
          ),
          Text(
            //
            "프로필 사진 선택",
            style: context.typography.heading1Bold,
          ),
          SizedBox(
            height: 8,
          ),
          ConstrainedBox(
            // fit: FlexFit.loose,
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height -
                  topSize -
                  bottomSize -
                  viewPadding.bottom -
                  viewInsets.bottom -
                  viewPadding.top -
                  120,
              // 120,
            ),
            child: GridView.builder(
              physics: const ClampingScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemCount: _viewModel.profileImages.length,
              itemBuilder: (context, index) {
                final item = _viewModel.profileImages[index];
                return AspectRatio(
                  aspectRatio: 1,
                  child: MoyaMoyaClickable(
                    onPressed: () {
                      setBottomSheetState(() {
                        _selectingImage = item;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(99),
                        color: context.colors.fillNormal,
                        border: Border.all(
                          width: 3,
                          color: _selectingImage != item
                              ? Colors.transparent
                              : context.colors.primaryNormal,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: Image.network(
                          item,
                          width: double.infinity,
                          height: double.infinity,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 32,
          ),
          MoyaMoyaButton(
            text: "선택",
            buttonSize: ButtonSize.larger,
            buttonType: ButtonType.primary,
            isEnabled: _selectingImage != null,
            onPressed: () {
              setBottomSheetState(() {
                _selectedImage = _selectingImage;
              });
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
