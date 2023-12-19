import 'package:base_code/view/screens/packages_screen/Components/plan_description.dart';
import 'package:base_code/view/widgets/extention/int_extension.dart';
import 'package:base_code/view/widgets/extention/string_extension.dart';
import 'package:base_code/view/widgets/extention/widget_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/constant.dart';
import '../../../../utils/style.dart';

class PlanCard extends StatelessWidget {
  const PlanCard(
      {super.key,
      required this.badge,
      required this.planName,
      required this.monthlyPrice,
      required this.yearPrice,
      this.hour,
      this.minutes,
      required this.item});

  final String badge;
  final String planName;
  final int monthlyPrice;
  final int yearPrice;
  final int? hour;
  final int? minutes;
  final int item;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: SizedBox(
        height: 430.h,
        width: 265.w,
        // color: Colors.red,
        child: Stack(
          children: [
            //green card
            Positioned(
              top: 8.h,
              left: 30.w,
              child: Container(
                  height: 400.h,
                  width: 220.w,
                  decoration: BoxDecoration(
                    color: greenPrimary,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    children: [
                      20.height,
                      planName
                          .toText(
                              color: whitePrimary,
                              fontSize: 22,
                              fontFamily: poppinsSemiBold)
                          .center,
                      SizedBox(
                        height: 62.h,
                        width: 170.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ("${Constant.dollar}$monthlyPrice").toText(
                                    color: whitePrimary,
                                    fontSize: 20,
                                    fontFamily: poppinsSemiBold),
                                Constant.perMonth.toText(
                                    color: whitePrimary,
                                    fontSize: 10,
                                    fontFamily: poppinsRegular)
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ("${Constant.dollar}$yearPrice").toText(
                                    color: whitePrimary,
                                    fontSize: 20,
                                    fontFamily: poppinsSemiBold),
                                Constant.perYear.toText(
                                    color: whitePrimary,
                                    fontSize: 12,
                                    fontFamily: poppinsRegular)
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  )),
            ),

            // //shadow

            Positioned(
                bottom: -2,
                left: 50.w,
                child: ClipOval(
                  child: Container(
                    width: 180.w,
                    height: 10.h,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          whiteSecondary,
                          greySecondary,
                          greyPrimary,
                          greySecondary,
                          whiteSecondary
                        ],
                      ),
                    ),
                  ),
                )),

            //Yellow card
            Positioned(
              bottom: 70.h,
              left: 0,
              child: Container(
                height: 210.h,
                width: 212.w,
                decoration: BoxDecoration(
                  color: yellowPrimary,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    40.height,
                    const PlanDescription(
                      description: Constant.unlimitedNumberOfUrls,
                    ),
                    PlanDescription(
                      description: Constant.refreshAfterEvery,
                      hour: hour,
                      minute: minutes,
                      isBackground: true,
                    ),
                    PlanDescription(
                      description: Constant.trackOnly,
                      item: item,
                      isBackground: true,
                    ),
                    const PlanDescription(
                      description: Constant.favouriteAnyItem,
                    )
                  ],
                ).paddingSymmetric(
                  horizontal: 10.w,
                ),
              ),
            ),
            //badge
            Positioned(
                top: 2.h,
                left: 50.w,
                child: SvgPicture.asset(
                  badge,
                  height: 40.h,
                  width: 35.w,
                )),
          ],
        ),
      ),
    );
  }
}
