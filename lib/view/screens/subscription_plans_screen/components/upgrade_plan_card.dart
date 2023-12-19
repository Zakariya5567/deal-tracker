import 'package:base_code/utils/colors.dart';
import 'package:base_code/utils/style.dart';
import 'package:base_code/view/widgets/extention/int_extension.dart';
import 'package:base_code/view/widgets/extention/string_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../utils/constant.dart';

class UpgradePlanCard extends StatelessWidget {
  const UpgradePlanCard(
      {super.key,
      required this.badge,
      required this.planName,
      required this.perMonthPrice,
      required this.perYearPrice});
  final String badge;
  final String planName;
  final String perMonthPrice;
  final String perYearPrice;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140.h,
      width: 355.w,
      child: Stack(
        children: [
          Positioned(
            top: 10.h,
            child: Container(
              height: 130.h,
              width: 353.w,
              decoration: BoxDecoration(
                color: greenSecondary,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: greenPrimary,
                ),
              ),
              child: Column(
                children: [
                  10.height,
                  planName.toText(
                    fontSize: 20,
                    fontFamily: poppinsMedium,
                    color: greenPrimary,
                  ),
                  10.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          "${Constant.dollar}$perMonthPrice".toText(
                            fontSize: 23,
                            fontFamily: poppinsSemiBold,
                            color: greenPrimary,
                          ),
                          Constant.perMonth.toText(
                            fontSize: 8,
                            fontFamily: poppinsMedium,
                            color: greenPrimary,
                          )
                        ],
                      ),
                      50.width,
                      Column(
                        children: [
                          "${Constant.dollar}$perYearPrice".toText(
                            fontSize: 23,
                            fontFamily: poppinsSemiBold,
                            color: greenPrimary,
                          ),
                          Constant.perYear.toText(
                            fontSize: 8,
                            fontFamily: poppinsMedium,
                            color: greenPrimary,
                          )
                        ],
                      ),
                    ],
                  )
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
            ),
          ),
        ],
      ),
    );
  }
}
