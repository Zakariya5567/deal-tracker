import 'package:base_code/view/screens/subscription_plans_screen/components/choose_plan_desccription.dart';
import 'package:base_code/view/widgets/custom_button.dart';
import 'package:base_code/view/widgets/extention/int_extension.dart';
import 'package:base_code/view/widgets/extention/string_extension.dart';
import 'package:base_code/view/widgets/extention/widget_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/constant.dart';
import '../../../../utils/style.dart';

class ChoosePlanCard extends StatelessWidget {
  const ChoosePlanCard({
    super.key,
    required this.badge,
    required this.planName,
    required this.monthlyPrice,
    required this.yearPrice,
    this.hour,
    this.minutes,
    required this.item,
    required this.onPressed,
  });
  final String badge;
  final String planName;
  final int monthlyPrice;
  final int yearPrice;
  final int? hour;
  final int? minutes;
  final int item;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280.h,
      width: 355.w,
      child: Stack(
        children: [
          Positioned(
            top: 10.h,
            child: Container(
              height: 270.h,
              width: 353.w,
              decoration: BoxDecoration(
                color: greenPrimary,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: greenPrimary,
                ),
              ),
              child: Column(
                children: [
                  15.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      "$planName ${Constant.planText}".toText(
                        fontSize: 20,
                        fontFamily: poppinsMedium,
                        color: whitePrimary,
                      ),
                    ],
                  ),
                  10.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          "${Constant.dollar}$monthlyPrice".toText(
                            fontSize: 23,
                            fontFamily: poppinsSemiBold,
                            color: whitePrimary,
                          ),
                          Constant.perMonth.toText(
                            fontSize: 8,
                            fontFamily: poppinsMedium,
                            color: whitePrimary,
                          )
                        ],
                      ),
                      50.width,
                      Column(
                        children: [
                          "${Constant.dollar}$yearPrice".toText(
                            fontSize: 23,
                            fontFamily: poppinsSemiBold,
                            color: whitePrimary,
                          ),
                          Constant.perYear.toText(
                            fontSize: 8,
                            fontFamily: poppinsMedium,
                            color: whitePrimary,
                          )
                        ],
                      ),
                    ],
                  ),
                  20.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const ChoosePlanDescription(
                              description: Constant.unlimitedNumberOfUrls),
                          ChoosePlanDescription(
                            description: Constant.refreshAfterEvery,
                            hour: hour,
                            minute: minutes,
                            isBackground: true,
                          ),
                          ChoosePlanDescription(
                            description: Constant.trackOnly,
                            item: item,
                            isBackground: true,
                          ),
                          const ChoosePlanDescription(
                            description: Constant.favouriteAnyItem,
                          )
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          CustomButton(
                              buttonName: Constant.chooseText,
                              height: 42.h,
                              width: 125.w,
                              buttonColor: yellowPrimary,
                              onPressed: onPressed),
                        ],
                      ),
                    ],
                  ).paddingSymmetric(horizontal: 10.w),
                ],
              ),
            ),
          ),
          //badge
          Positioned(
              top: 4.h,
              left: 20.w,
              child: SvgPicture.asset(
                badge,
                height: 40.h,
                width: 35.w,
              )),
        ],
      ),
    ).paddingSymmetric(horizontal: 20.w);
  }
}
