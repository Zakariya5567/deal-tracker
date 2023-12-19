import 'package:base_code/utils/constant.dart';
import 'package:base_code/utils/style.dart';
import 'package:base_code/view/widgets/custom_button.dart';
import 'package:base_code/view/widgets/custom_switch.dart';
import 'package:base_code/view/widgets/extention/int_extension.dart';
import 'package:base_code/view/widgets/extention/string_extension.dart';
import 'package:base_code/view/widgets/extention/widget_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../../provider/home_provider.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/images.dart';

Future updateItemBottumSheet(
  BuildContext context,
  VoidCallback onTrackPrice,
  VoidCallback onTrackAvailability,
  VoidCallback onUpdate,
) {
  return showModalBottomSheet(
    isScrollControlled: true,
    backgroundColor: whitePrimary,
    // set this when inner content overflows, making RoundedRectangleBorder not working as expected
    clipBehavior: Clip.antiAlias,
    // set shape to make top corners rounded
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(30),
        topRight: Radius.circular(30),
      ),
    ),
    context: context,
    builder: (context) {
      return Consumer<HomeProvider>(
        builder: (context, controller, child) {
          return Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 6.h,
                        width: 50.w,
                        decoration: BoxDecoration(
                          color: greenSecondary,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ],
                  ).paddingOnly(bottom: 10.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SvgPicture.asset(
                        Images.iconClose,
                        height: 20.h,
                        width: 20.h,
                      ).onPress(() {
                        controller.resetItemForm();
                        Navigator.pop(context);
                      }),
                    ],
                  ).paddingOnly(bottom: 10.h),
                  Constant.placeUrlToTrackanyitem
                      .toText(
                        fontSize: 18,
                        fontFamily: poppinsMedium,
                        color: blackPrimary,
                      )
                      .paddingOnly(bottom: 30.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Constant.trackPrice.toText(
                        fontSize: 16,
                        fontFamily: poppinsRegular,
                        color: blackPrimary,
                      ),
                      CustomSwitch(
                        isNotify: controller.isPriceTrack,
                        onPressed: onTrackPrice,
                      ),
                    ],
                  ).paddingOnly(bottom: 20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Constant.trackAvailability.toText(
                        fontSize: 16,
                        fontFamily: poppinsRegular,
                        color: blackPrimary,
                      ),
                      CustomSwitch(
                        isNotify: controller.isAvailabilityTrack,
                        onPressed: onTrackAvailability,
                      ),
                    ],
                  ).paddingOnly(bottom: 30.h),
                  CustomButton(
                          buttonName: Constant.btnUpdate,
                          borderColor: greenPrimary,
                          onPressed: onUpdate)
                      .paddingOnly(bottom: 20.h),
                ],
              ).paddingSymmetric(
                horizontal: 20.w,
                vertical: 20.h,
              ),
            ),
          );
        },
      );
    },
  ).then((value) =>
      Provider.of<HomeProvider>(context, listen: false).resetItemForm());
}
