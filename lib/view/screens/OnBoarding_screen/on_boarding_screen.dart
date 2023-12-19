import 'dart:io';

import 'package:base_code/provider/on_boarding_provider.dart';
import 'package:base_code/view/screens/OnBoarding_screen/Components/onboarding_view.dart';
import 'package:base_code/view/screens/OnBoarding_screen/Components/slider_indication.dart';
import 'package:base_code/view/widgets/extention/int_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../../../utils/colors.dart';
import '../../../utils/images.dart';
import '../../../utils/constant.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: whiteStatusBar(),
      child: SafeArea(
        bottom: Platform.isAndroid ? true : false,
        top: Platform.isAndroid ? true : false,
        child: Scaffold(
          backgroundColor: whitePrimary,
          body: Consumer<OnBoardingProvider>(
              builder: (context, controller, child) {
            return Column(
              children: [
                SizedBox(
                  height: 720.h,
                  child: PageView(
                    controller: controller.pageController,
                    onPageChanged: (int page) {
                      controller.nextPageBySlide(page);
                    },
                    children: const [
                      OnBoardingView(
                        image: Images.imgOnBoarding1,
                        heading: Constant.trackDifferentProducts,
                        description: Constant.trackDifferentProductsDescription,
                      ),
                      OnBoardingView(
                        image: Images.imgOnBoarding2,
                        heading: Constant.trackAnyDeal,
                        description: Constant.trackAnyDealDescription,
                      ),
                      OnBoardingView(
                        image: Images.imgOnBoarding3,
                        heading: Constant.trackPriceHistory,
                        description: Constant.trackPriceHistoryDescription,
                      ),
                    ],
                  ),
                ),
                20.height,
                SliderIndication(controller: controller)
              ],
            );
          }),
        ),
      ),
    );
  }
}
