import 'dart:io';

import 'package:base_code/view/screens/subscription_plans_screen/components/choose_plan_card.dart';
import 'package:base_code/view/screens/subscription_plans_screen/components/subscription_bottom_sheet.dart';
import 'package:base_code/view/widgets/extention/int_extension.dart';
import 'package:base_code/view/widgets/extention/widget_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../../provider/packages_provider.dart';
import '../../../utils/colors.dart';
import '../../../utils/constant.dart';
import '../../../utils/images.dart';
import '../../widgets/custom_app_bar.dart';

class ChoosePlan extends StatelessWidget {
  const ChoosePlan({super.key});

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
              context: context, title: Constant.choosePlan, isBack: true),
          body: Consumer<PackagesProvider>(
            builder: (context, controller, child) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    ChoosePlanCard(
                      badge: Images.iconBadgeStarter,
                      planName: Constant.starter,
                      monthlyPrice: 5,
                      yearPrice: 60,
                      hour: 24,
                      item: 5,
                      onPressed: () => subscriptionBottumSheet(context,
                          Constant.subscriptionBottomSheetDescription, () {}),
                    ).paddingOnly(top: 20.h),
                    ChoosePlanCard(
                      badge: Images.iconBadgePlatinum,
                      planName: Constant.platinum,
                      monthlyPrice: 20,
                      yearPrice: 240,
                      minutes: 30,
                      item: 100,
                      onPressed: () {
                       
                      },
                    ).paddingOnly(top: 20.h),
                    ChoosePlanCard(
                      badge: Images.iconBadgeTitanium,
                      planName: Constant.titanium,
                      monthlyPrice: 50,
                      yearPrice: 600,
                      minutes: 15,
                      item: 1000,
                      onPressed: () {},
                    ).paddingSymmetric(vertical: 20.h),
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
