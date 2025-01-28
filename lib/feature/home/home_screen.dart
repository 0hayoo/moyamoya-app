import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:moyamoya/designsystem/component/button.dart';
import 'package:moyamoya/designsystem/component/top_app_bar.dart';
import 'package:moyamoya/designsystem/extension/padding_extension.dart';
import 'package:moyamoya/designsystem/foundation/app_theme.dart';
import 'package:moyamoya/designsystem/foundation/moya_moya_icons_icons.dart';
import 'package:smooth_corner/smooth_corner.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController(initialPage: 0);

  @override
  void initState() {
    _pageController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.backgroundNeutral,
      appBar: MoyaMoyaTopAppBar(
        title: "홈",
        appBarType: TopAppBarType.basic,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 32,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(99),
                      child: Image.asset(
                        "assets/images/AppIcon.png",
                        width: 128,
                        height: 128,
                      ),
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Align(
                          child: Image.asset(
                            "assets/images/oblong.png",
                            width: 15.44,
                            height: 14,
                          ).padding(
                            EdgeInsets.only(
                              left: 56,
                            ),
                          ),
                        ),
                        Container(
                          decoration: ShapeDecoration(
                            shape: SmoothRectangleBorder(
                              smoothness: 0.6,
                              borderRadius: BorderRadius.circular(18),
                            ),
                            color: context.colors.primaryAssistive,
                            shadows: [context.shadow.black2],
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 16,
                            ),
                            child: Text(
                              "우리 학교에서 나랑 가장\n잘 맞는 사람이 누구일까?",
                              style: context.typography.bodyBold.copyWith(
                                color: context.colors.primaryNormal,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    MoyaMoyaButton(
                      text: "매칭 시작",
                      buttonSize: ButtonSize.larger,
                      buttonType: ButtonType.primary,
                      rounded: true,
                      onPressed: () {},
                    )
                  ],
                ),
              ),
            ),
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Icon(
                  MoyaMoyaIcons.calendar,
                  size: 16,
                  color: context.colors.labelAssistive,
                ),
                SizedBox(
                  width: 4,
                ),
                Text(
                  "이벤트",
                  style: context.typography.bodyBold.copyWith(
                    color: context.colors.labelAssistive,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 6,
            ),
            ExpandablePageView.builder(
              controller: _pageController,
              itemCount: 3,
              itemBuilder: (context, index) {
                return _buildEventCard(
                  title: "title $index}",
                  date: "date $index",
                );
              },
            ),
            SizedBox(
              height: 8,
            ),
            _buildPageIndicator(
              nowPageIndex: _pageController.hasClients
                  ? _pageController.page?.toInt() ?? 0
                  : 0,
              pageCnt: 3,
            ),
            SafeArea(
              child: SizedBox(
                height: 32,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEventCard({
    required String title,
    required String date,
  }) {
    return Container(
      width: double.infinity,
      decoration: ShapeDecoration(
        shape: SmoothRectangleBorder(
          smoothness: 0.6,
          borderRadius: BorderRadius.circular(18),
        ),
        color: context.colors.backgroundNormal,
        shadows: [context.shadow.black1],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  MoyaMoyaIcons.clock,
                  size: 16,
                  color: context.colors.labelAssistive,
                ),
                SizedBox(
                  width: 4,
                ),
                Text(
                  date,
                  style: context.typography.labelRegular.copyWith(
                    color: context.colors.labelAssistive,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              title,
              style: context.typography.headlineMedium,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPageIndicator({
    required int nowPageIndex,
    required int pageCnt,
  }) {
    return Row(
      spacing: 6,
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(pageCnt, (index) {
        return Container(
          width: 6,
          height: 6,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(99),
            color: index == nowPageIndex
                ? context.colors.labelAssistive
                : context.colors.labelAssistive.withValues(alpha: 0.4),
          ),
        );
      }),
    );
  }
}
