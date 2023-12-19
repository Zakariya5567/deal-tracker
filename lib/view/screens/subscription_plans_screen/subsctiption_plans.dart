import 'dart:io';

import 'package:base_code/helper/routes_helper.dart';
import 'package:base_code/utils/style.dart';
import 'package:base_code/view/screens/subscription_plans_screen/components/slected_plan_card.dart';
import 'package:base_code/view/screens/subscription_plans_screen/components/upgrade_plan_card.dart';
import 'package:base_code/view/widgets/custom_button.dart';
import 'package:base_code/view/widgets/extention/int_extension.dart';
import 'package:base_code/view/widgets/extention/string_extension.dart';
import 'package:base_code/view/widgets/extention/widget_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../../provider/packages_provider.dart';
import '../../../utils/colors.dart';
import '../../../utils/constant.dart';
import '../../../utils/images.dart';
import '../../widgets/custom_app_bar.dart';

class SubscriptionPlans extends StatelessWidget {
  const SubscriptionPlans({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: greenStatusBar(),
      child: SafeArea(
        bottom: Platform.isAndroid ? true : false,
        top: Platform.isAndroid ? true : false,
        child: Scaffold(
          backgroundColor: whiteSecondary,
          appBar: customAppBar(
              context: context,
              title: Constant.subscriptionPlans,
              isBack: true),
          body: Consumer<PackagesProvider>(
            builder: (context, controller, child) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    20.height,
                    const SelectedPlan(
                        badge: Images.iconBadgeGold,
                        planName: Constant.gold,
                        paymentType: "Monthly Payment",
                        startedDate: "20/05/2023",
                        nextPaymentDate: "20/06/2023"),
                    Constant.upgradePlanQuestion
                        .toText(
                          fontSize: 14,
                          fontFamily: poppinsSemiBold,
                          color: greenPrimary,
                        )
                        .paddingOnly(top: 20.h, bottom: 10.h),
                    const UpgradePlanCard(
                            badge: Images.iconBadgeStarter,
                            planName: Constant.starter,
                            perMonthPrice: "5",
                            perYearPrice: "60")
                        .paddingOnly(bottom: 10.h),
                    const UpgradePlanCard(
                            badge: Images.iconBadgePlatinum,
                            planName: Constant.platinum,
                            perMonthPrice: "20",
                            perYearPrice: "240")
                        .paddingOnly(bottom: 10.h),
                    const UpgradePlanCard(
                            badge: Images.iconBadgeTitanium,
                            planName: Constant.titanium,
                            perMonthPrice: "50",
                            perYearPrice: "600")
                        .paddingOnly(bottom: 40.h),
                    CustomButton(
                        buttonName: Constant.upgradePlan,
                        onPressed: () {
                          Navigator.pushNamed(
                              context, RouterHelper.choosePlansScreen);
                        }).paddingOnly(bottom: 25.h),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
