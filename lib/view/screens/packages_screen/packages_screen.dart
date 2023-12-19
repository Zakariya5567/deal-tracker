import 'package:base_code/helper/routes_helper.dart';
import 'package:base_code/provider/packages_provider.dart';
import 'package:base_code/view/screens/packages_screen/Components/plan_card.dart';
import 'package:base_code/view/widgets/custom_button.dart';
import 'package:base_code/view/widgets/extention/int_extension.dart';
import 'package:base_code/view/widgets/extention/string_extension.dart';
import 'package:base_code/view/widgets/extention/widget_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../../../utils/colors.dart';
import '../../../utils/images.dart';
import '../../../utils/constant.dart';
import '../../../utils/style.dart';
import 'Components/plan_slider_indication.dart';

class PackagesScreen extends StatelessWidget {
  const PackagesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: whiteStatusBar(),
      child: Scaffold(
        backgroundColor: whitePrimary,
        body: Consumer<PackagesProvider>(builder: (context, controller, child) {
          return Column(
            children: [
              66.height,
              Constant.choosePlan
                  .toText(
                      color: greenPrimary,
                      fontSize: 30,
                      fontFamily: poppinsSemiBold)
                  .center,
              4.height,
              SizedBox(
                      width: 200.w,
                      child: Constant.choosePlanDescription.toText(
                          maxLine: 2,
                          textAlign: TextAlign.center,
                          color: greyPrimary,
                          fontSize: 13,
                          fontFamily: poppinsRegular))
                  .center,
              42.height,
              Container(
                height: 450.h,
                color: whitePrimary,
                alignment: Alignment.center,
                child: PageView(
                  controller: controller.pageController,
                  onPageChanged: (int page) {
                    controller.nextPageBySlide(page);
                  },
                  children: const [
                    PlanCard(
                        badge: Images.iconBadgeStarter,
                        planName: Constant.starter,
                        monthlyPrice: 5,
                        yearPrice: 60,
                        hour: 24,
                        item: 6),
                    PlanCard(
                        badge: Images.iconBadgeGold,
                        planName: Constant.gold,
                        monthlyPrice: 10,
                        yearPrice: 120,
                        hour: 1,
                        item: 50),
                    PlanCard(
                        badge: Images.iconBadgePlatinum,
                        planName: Constant.platinum,
                        monthlyPrice: 20,
                        yearPrice: 240,
                        minutes: 30,
                        item: 100),
                    PlanCard(
                        badge: Images.iconBadgeTitanium,
                        planName: Constant.titanium,
                        monthlyPrice: 50,
                        yearPrice: 600,
                        minutes: 15,
                        item: 1000),
                  ],
                ),
              ),
              30.height,
              PlanSliderIndication(
                screen: controller.currentPage,
              ),
              40.height,
              CustomButton(
                  buttonName: Constant.btnSelect,
                  onPressed: () {
                    Navigator.pushNamed(context, RouterHelper.homeScreen);
                  }).center
            ],
          );
        }),
      ),
    );
  }
}
