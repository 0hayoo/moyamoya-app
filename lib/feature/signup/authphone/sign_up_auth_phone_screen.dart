import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:moyamoya/designsystem/component/button.dart';
import 'package:moyamoya/designsystem/component/centered_text_field.dart';
import 'package:moyamoya/designsystem/component/top_app_bar.dart';
import 'package:moyamoya/designsystem/foundation/app_theme.dart';
import 'package:moyamoya/feature/signup/authphone/viewmodel/sign_up_auth_phone_viewmodel.dart';

class SignUpAuthPhoneScreen extends StatefulWidget {
  SignUpAuthPhoneScreen({
    super.key,
    required this.popBackStack,
    required this.navigateToHomeScreen,
    required this.navigateToSignUpRetrieveSchoolScreen,
  });

  final VoidCallback popBackStack;
  final VoidCallback navigateToHomeScreen;
  final Function(String phone, String authCode)
      navigateToSignUpRetrieveSchoolScreen;
  final String phone = Get.parameters["phone"] ?? "";

  @override
  State<SignUpAuthPhoneScreen> createState() => _SignUpAuthPhoneScreenState();
}

class _SignUpAuthPhoneScreenState extends State<SignUpAuthPhoneScreen> {
  final SignUpAuthPhoneViewModel viewModel = Get.put(SignUpAuthPhoneViewModel(
    onVerifySuccess: () {
      debugPrint("onVerifySuccess");
    },
  ));
  final _verifyCodeTextController = TextEditingController();
  Ticker? _ticker;

  static const _initialTime = 299;
  int _timer = _initialTime;
  bool _isTestAnimation = false;

  @override
  void dispose() {
    setState(() {
      _ticker?.stop();
      _ticker = null;
    });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Stack(
        children: [
          Scaffold(
            backgroundColor: context.colors.backgroundNeutral,
            appBar: MoyaMoyaTopAppBar(
              title: "",
              appBarType: TopAppBarType.small,
              onBackPressed: widget.popBackStack,
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 48,
                  ),
                  Text(
                    "인증번호",
                    style: context.typography.title1Bold,
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: MoyaMoyaCenteredTextField(
                      controller: _verifyCodeTextController,
                      maxLength: 6,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  AnimatedSize(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeIn,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: _isTestAnimation
                          ? Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: GestureDetector(
                                onTap: () async {
                                  if (_timer != 0) {
                                    return;
                                  }
                                  startTicker();
                                  await viewModel.sendCode(widget.phone);
                                },
                                child: Text(
                                  _timer == 0
                                      ? "인증번호 재전송"
                                      : "${(_timer / 60).toInt()}:${_timer % 60}",
                                  style: context.typography.bodyMedium.copyWith(
                                    color: _timer == 0
                                        ? context.colors.primaryNormal
                                        : context.colors.labelAlternative,
                                  ),
                                ),
                              ),
                            )
                          : SizedBox(
                              height: 0,
                              child: Padding(
                                padding: const EdgeInsets.only(right: 8),
                                child: Text(
                                  "4:32",
                                  style: context.typography.bodyMedium.copyWith(
                                    color: context.colors.labelAlternative,
                                  ),
                                ),
                              ), //SizedBox.shrink(),
                            ),
                    ),
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: MoyaMoyaButton(
                      text: _ticker == null ? "인증번호 전송" : "확인",
                      buttonSize: ButtonSize.larger,
                      buttonType: ButtonType.primary,
                      isEnabled: !viewModel.isSending.value &&
                          (_ticker == null ||
                              _verifyCodeTextController.text.length == 6),
                      onPressed: () async {
                        if (_ticker == null) {
                          setState(() {
                            _isTestAnimation = true;
                          });
                          startTicker();
                          await viewModel.sendCode(widget.phone);
                        } else {
                          final result = await viewModel.verifyCode(
                            widget.phone,
                            _verifyCodeTextController.text,
                          );
                          if (result == true) {
                            widget.navigateToSignUpRetrieveSchoolScreen(
                              widget.phone,
                              _verifyCodeTextController.text,
                            );
                          } else if (result == false) {
                            widget.navigateToHomeScreen();
                          }
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (viewModel.isLoading.value)
            Container(
              width: double.infinity,
              height: double.infinity,
              color: context.colors.staticBlack.withValues(alpha: 0.3),
            ),
        ],
      ),
    );
  }

  void startTicker() {
    _timer = _initialTime;
    _ticker = Ticker((duration) {
      if (_timer <= 0) {
        _ticker?.stop();
      }
      if (_initialTime - duration.inSeconds != _timer) {
        setState(() {
          _timer = _initialTime - duration.inSeconds;
        });
      }
    });
    _ticker?.start();
  }
}
