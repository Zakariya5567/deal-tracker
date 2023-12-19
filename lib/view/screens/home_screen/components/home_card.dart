// ignore_for_file: must_be_immutable

import 'package:base_code/view/screens/home_screen/components/car_bottom_section.dart';
import 'package:base_code/view/screens/home_screen/components/tracker_updating_loader.dart';
import 'package:base_code/view/screens/home_screen/components/tracking_with_icon.dart';
import 'package:base_code/view/screens/home_screen/components/update_item_sheet.dart';
import 'package:base_code/view/widgets/extention/int_extension.dart';
import 'package:base_code/view/widgets/extention/string_extension.dart';
import 'package:base_code/view/widgets/extention/widget_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../provider/home_provider.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/images.dart';
import '../../../../utils/constant.dart';
import '../../../../utils/style.dart';
import '../../../widgets/warning_sheet.dart';

class HomeCard extends StatelessWidget {
  const HomeCard({super.key, required this.index, required this.controller});

  final int index;
  final HomeProvider controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 210.h,
      width: 353.w,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
          color: whitePrimary,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
                color: greySecondary,
                offset: Offset(0, 4),
                blurRadius: 8,
                spreadRadius: 2)
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 145.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 75.w,
                  child: Column(
                    children: [
                      12.height,
                      SizedBox(
                        height: 64.w,
                        width: 64.w,
                        child: Image.asset(
                          Images.imgWatch,
                          fit: BoxFit.cover,
                        ),
                      ),
                      12.height,
                      Container(
                        height: 32.h,
                        width: 45.w,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(Images.iconBadge),
                        )),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            "50${Constant.percent}"
                                .toText(
                                    color: whitePrimary,
                                    fontSize: 9,
                                    fontFamily: poppinsMedium)
                                .paddingOnly(left: 6),
                            Constant.off
                                .toText(
                                    color: whitePrimary,
                                    fontSize: 8,
                                    fontFamily: poppinsRegular)
                                .paddingOnly(left: 15),
                          ],
                        ),
                      ).align(Alignment.topLeft),
                    ],
                  ),
                ),
                SizedBox(
                  width: 210.w,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      12.height,
                      "Rolex stainless steel men's silver watch".toText(
                          maxLine: 2,
                          color: blackPrimary,
                          fontSize: 13,
                          fontFamily: poppinsRegular),
                      7.height,
                      Row(
                        children: [
                          Constant.firstPrice.toText(
                              color: blackPrimary,
                              fontSize: 10,
                              fontFamily: poppinsRegular),
                          "${Constant.dollar}2500".toText(
                              color: greenPrimary,
                              fontSize: 10,
                              fontFamily: poppinsSemiBold),
                        ],
                      ),
                      8.height,
                      Row(
                        children: [
                          /// Here is logic of visibility by index will change after implementing Api
                          Visibility(
                              visible: index == 0 || index == 1 || index == 3
                                  ? true
                                  : false,
                              child: const TrackingWithIcon(
                                  title: Constant.priceTracking)),

                          index == 0 || index == 1 || index == 3
                              ? 10.width
                              : const SizedBox(),
                          Visibility(
                              visible: index == 0 || index == 1 || index == 2
                                  ? true
                                  : false,
                              child: const TrackingWithIcon(
                                  title: Constant.availabilityTracking)),
                        ],
                      ),
                      8.height,
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /// Here is logic will change after implementing Api

                          (index == 2
                                  ? Constant.startPriceTracking
                                  : Constant.showPriceHistory)
                              .toText(
                                  color: greenPrimary,
                                  fontSize: 9,
                                  fontFamily: poppinsRegular),
                          Container(
                            height: 1.h,
                            width: 82.w,
                            color: greenPrimary,
                          )
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: 55.w,
                  child: Column(
                    children: [
                      12.height,
                      SvgPicture.asset(
                        Images.iconPencilCircle,
                        height: 26.w,
                        width: 26.w,
                      ).onPress(() {
                        updateItemBottumSheet(context, () {
                          // Track Price Switch
                          controller.setPriceTrack();
                        }, () {
                          // Track Availability Switch
                          controller.setAvailabilityTrack();
                        }, () {
                          // Update
                        });
                      }),
                      8.height,
                      SvgPicture.asset(
                        Images.iconDeleteCircle,
                        height: 26.w,
                        width: 26.w,
                      ).onPress(() {
                        warningBottumSheet(context, Images.iconDeleteCircle,
                            Constant.deleteItemWarning, () {});
                      })
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 60.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                /// Here is logic  of availability base on index will change after implementing Api

                Visibility(
                  visible: index == 0 || index == 1 ? true : false,
                  child: CardBottomSection(
                    width: 125.w,
                    title: Constant.currentPrice,
                    description: "${Constant.dollar}2300.00",
                    color: greenPrimary,
                    textColor: whitePrimary,
                  ),
                ),
                Visibility(
                  visible:
                      index == 0 || index == 1 || index == 3 ? true : false,
                  child: CardBottomSection(
                    width: index == 3 ? 125.w : 90.w,
                    title: Constant.timer,
                    description: "00:12:34",
                    color: whitePrimary,
                    textColor: blackPrimary,
                  ),
                ),
                Visibility(
                  visible: index == 0 || index == 1 ? true : false,
                  child: CardBottomSection(
                    width: 125.w,
                    title: Constant.availability,
                    description: Constant.outOfStock,
                    color: yellowPrimary,
                    textColor: whitePrimary,
                  ),
                ),
                Visibility(
                  visible: index == 2 ? true : false,
                  child: const TrackerUpdatingLoader(),
                ),
                Visibility(
                  visible: index == 2 ? true : false,
                  child: CardBottomSection(
                    width: 215.w,
                    title: Constant.availability,
                    description: Constant.outOfStock,
                    color: yellowPrimary,
                    textColor: whitePrimary,
                  ),
                ),
                Visibility(
                  visible: index == 3 ? true : false,
                  child: CardBottomSection(
                    width: 215.w,
                    title: Constant.currentPrice,
                    description: "${Constant.dollar}2300.00",
                    color: greenPrimary,
                    textColor: whitePrimary,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ).paddingOnly(bottom: 15.h);
  }
}
