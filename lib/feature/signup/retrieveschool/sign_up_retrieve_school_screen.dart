import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moyamoya/designsystem/component/bottom_sheet.dart';
import 'package:moyamoya/designsystem/component/button.dart';
import 'package:moyamoya/designsystem/component/text_field.dart';
import 'package:moyamoya/designsystem/component/top_app_bar.dart';
import 'package:moyamoya/designsystem/foundation/app_theme.dart';
import 'package:moyamoya/domain/model/school.dart';
import 'package:moyamoya/feature/signup/retrieveschool/item/sign_up_retrieve_school_item.dart';
import 'package:moyamoya/feature/signup/retrieveschool/viewmodel/sign_up_retrieve_school_viewmodel.dart';

class SignUpRetrieveSchoolScreen extends StatefulWidget {
  SignUpRetrieveSchoolScreen({
    super.key,
    required this.popBackStack,
    required this.navigateToSignUpInputSchoolInfoScreen,
  });

  final Function(
    String phone,
    String verifyCode,
    int schoolId,
    String schoolName,
    String schoolType,
  ) navigateToSignUpInputSchoolInfoScreen;
  final VoidCallback popBackStack;

  final String phone = Get.parameters["phone"] ?? "";
  final String verifyCode = Get.parameters["verifyCode"] ?? "";

  @override
  State<SignUpRetrieveSchoolScreen> createState() =>
      _SignUpRetrieveSchoolScreenState();
}

class _SignUpRetrieveSchoolScreenState
    extends State<SignUpRetrieveSchoolScreen> {
  final SignUpRetrieveSchoolViewModel _viewModel =
      Get.put(SignUpRetrieveSchoolViewModel());

  final _schoolSearchTextController = TextEditingController();

  @override
  void initState() {
    _viewModel.getSchools();

    _schoolSearchTextController.addListener(() {
      _viewModel.changeText(_schoolSearchTextController.text);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: context.colors.backgroundNeutral,
        appBar: MoyaMoyaTopAppBar(
          title: "학교 선택 🏫",
          appBarType: TopAppBarType.small,
          onBackPressed: widget.popBackStack,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 16,
              ),
              MoyaMoyaTextField(
                controller: _schoolSearchTextController,
                hintText: "대구소프트웨어마이스터고등학교",
                onPrefixClick: () {},
              ),
              SizedBox(
                height: 8,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4),
                  child: Text(
                    "2025년 기준 재학 중인 학교 이름을 입력해 주세요",
                    style: context.typography.labelMedium
                        .copyWith(color: context.colors.statusNegative),
                  ),
                ),
              ),
              SizedBox(
                height: 32,
              ),
              Text(
                "‘${_schoolSearchTextController.text}’ 검색 결과",
                style: context.typography.heading2Bold,
              ),
              SizedBox(
                height: 8,
              ),
              // if (_viewModel.schools.isNotEmpty)
              Expanded(
                child: ListView.builder(
                  itemCount: _viewModel.filterSchools.length,
                  itemBuilder: (BuildContext context, int index) {
                    return _itemView(
                      _viewModel.filterSchools[index],
                      () {
                        showMoyaMoyaBottomSheet(
                          context: this.context,
                          builder: (
                            BuildContext context,
                            Function setState,
                          ) {
                            final item = _viewModel.filterSchools[index];
                            return _buildBottomSheet(context, item, () {
                              widget.navigateToSignUpInputSchoolInfoScreen(
                                widget.phone,
                                widget.verifyCode,
                                item.id,
                                item.name,
                                item.type!.name,
                              );
                            });
                          },
                        );
                      },
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _itemView(School school, VoidCallback onPressed) {
    final address = (school.address ?? "").split(" ");
    return SignUpRetrieveSchoolItem(
      onPressed: onPressed,
      schoolName: school.name,
      localName: (address.elementAtOrNull(0) ?? "") +
          (address.elementAtOrNull(1) ?? ""),
      usingUser: "",
    );
  }

  Widget _buildBottomSheet(
    BuildContext context,
    School school,
    VoidCallback onPressed,
  ) {
    final address = (school.address ?? "").split(" ");
    final localName =
        (address.elementAtOrNull(0) ?? "") + (address.elementAtOrNull(1) ?? "");
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 16,
        ),
        Text(
          "선택된 학교가 맞나요?",
          style: context.typography.heading1Bold,
        ),
        SizedBox(
          height: 4,
        ),
        Text(
          "가입 이후 학교 수정이 불가능 해요",
          style: context.typography.captionMedium
              .copyWith(color: context.colors.statusNegative, wordSpacing: 0),
        ),
        SizedBox(
          height: 28,
        ),
        Text(
          school.name,
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
        SizedBox(
          height: 44,
        ),
        Row(
          children: [
            Flexible(
              flex: 120,
              child: MoyaMoyaButton(
                text: "취소",
                buttonSize: ButtonSize.larger,
                buttonType: ButtonType.secondary,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            SizedBox(
              width: 12,
            ),
            Flexible(
              flex: 208,
              child: MoyaMoyaButton(
                text: "네, 저희 학교에요",
                buttonSize: ButtonSize.larger,
                buttonType: ButtonType.primary,
                onPressed: onPressed,
              ),
            ),
          ],
        )
      ],
    );
  }
}
