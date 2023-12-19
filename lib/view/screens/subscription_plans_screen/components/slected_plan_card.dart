import 'package:base_code/utils/style.dart';
import 'package:base_code/view/widgets/extention/int_extension.dart';
import 'package:base_code/view/widgets/extention/string_extension.dart';
import 'package:base_code/view/widgets/extention/widget_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/constant.dart';

class SelectedPlan extends StatelessWidget {
  const SelectedPlan(
      {super.key,
      required this.badge,
      required this.planName,
      required this.paymentType,
      required this.startedDate,
      required this.nextPaymentDate});
  final String badge;
  final String planName;
  final String paymentType;
  final String startedDate;
  final String nextPaymentDate;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 190.h,
      width: 355.w,
      child: Stack(
        children: [
          Positioned(
            top: 10.h,
            child: Container(
              height: 180.h,
              width: 353.w,
              decoration: BoxDecoration(
                  color: greenPrimary,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: greenPrimary,
                  )),
              child: Column(
                children: [
                  15.height,
                  // Current Plan
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Constant.currentPlan
                          .toText(
                              fontSize: 12,
                              color: whitePrimary,
                              fontFamily: poppinsRegular)
                          .center,
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      "$planName ${Constant.planText}"
                          .toText(
                              fontSize: 18,
                              color: whitePrimary,
                              fontFamily: poppinsMedium)
                          .center,
                    ],
                  ),
                  18.height,
                  // Plan Details
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          "${Constant.planPayment} :"
                              .toText(
                                  fontSize: 10,
                                  color: whitePrimary,
                                  fontFamily: poppinsRegular)
                              .center,
                          8.height,
                          "${Constant.startDate} :"
                              .toText(
                                  fontSize: 10,
                                  color: whitePrimary,
                                  fontFamily: poppinsRegular)
                              .center,
                          8.height,
                          "${Constant.nextPayment} :"
                              .toText(
                                  fontSize: 10,
                                  color: whitePrimary,
                                  fontFamily: poppinsRegular)
                              .center,
                        ],
                      ),
                      25.width,
                      Column(
                        children: [
                          "---"
                              .toText(
                                  fontSize: 10,
                                  color: whitePrimary,
                                  fontFamily: poppinsRegular)
                              .center,
                          8.height,
                          "---"
                              .toText(
                                  fontSize: 10,
                                  color: whitePrimary,
                                  fontFamily: poppinsRegular)
                              .center,
                          8.height,
                          "---"
                              .toText(
                                  fontSize: 10,
                                  color: whitePrimary,
                                  fontFamily: poppinsRegular)
                              .center,
                        ],
                      ),
                      25.width,
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            paymentType
                                .toText(
                                    fontSize: 10,
                                    color: whitePrimary,
                                    fontFamily: poppinsRegular)
                                .center,
                            8.height,
                            startedDate
                                .toText(
                                    fontSize: 10,
                                    color: whitePrimary,
                                    fontFamily: poppinsRegular)
                                .center,
                            8.height,
                            nextPaymentDate
                                .toText(
                                    fontSize: 10,
                                    color: whitePrimary,
                                    fontFamily: poppinsRegular)
                                .center,
                          ]),
                    ],
                  ),
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
