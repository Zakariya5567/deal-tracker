// ignore_for_file: must_be_immutable

import 'package:base_code/provider/on_boarding_provider.dart';
import 'package:base_code/view/widgets/extention/int_extension.dart';
import 'package:base_code/view/widgets/extention/widget_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/images.dart';

class SliderIndication extends StatelessWidget {
  SliderIndication({super.key, required this.controller});

  OnBoardingProvider controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              height: 10.h,
              width: controller.currentPage == 0 ? 23.w : 10.w,
              decoration: BoxDecoration(
                  color: controller.currentPage == 0
                      ? greenPrimary
                      : greySecondary,
                  borderRadius: BorderRadius.circular(50)),
            ),
            5.width,
            Container(
              height: 10.h,
              width: controller.currentPage == 1 ? 23.w : 10.w,
              decoration: BoxDecoration(
                  color: controller.currentPage == 1
                      ? greenPrimary
                      : greySecondary,
                  borderRadius: BorderRadius.circular(50)),
            ),
            5.width,
            Container(
              height: 10.h,
              width: controller.currentPage == 2 ? 23.w : 10.w,
              decoration: BoxDecoration(
                  color: controller.currentPage == 2
                      ? greenPrimary
                      : greySecondary,
                  borderRadius: BorderRadius.circular(50)),
            ),
          ],
        ),
        SizedBox(
                height: 65.w,
                width: 65.w,
                child: Stack(
                  children: [
                    SizedBox(
                      height: 65.w,
                      width: 65.w,
                      child: RotatedBox(
                        quarterTurns: controller.currentPage == 0 ? 1 : 8,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          value: controller.currentPage == 0
                              ? 1.5 / 3
                              : controller.currentPage == 1
                                  ? 2.3 / 3
                                  : 3 / 3,
                          color: yellowPrimary,
                        ),
                      ),
                    ),
                    Positioned(
                        bottom: 8.h,
                        left: 8.w,
                        child: CircleAvatar(
                          backgroundColor: greenPrimary,
                          radius: 25.w,
                          child: SvgPicture.asset(
                            controller.currentPage == 2
                                ? Images.iconDone
                                : Images.iconArrowForward,
                            colorFilter: const ColorFilter.mode(
                                whitePrimary, BlendMode.srcIn),
                            height: 12.h,
                          ),
                        )),
                  ],
                ).center)
            .onPress(() {
          controller.nextPageByButton(context);
        })
      ],
    ).paddingSymmetric(horizontal: 50.w);
  }
}
