import 'package:base_code/utils/constant.dart';
import 'package:base_code/utils/style.dart';
import 'package:base_code/view/widgets/custom_button.dart';
import 'package:base_code/view/widgets/extention/int_extension.dart';
import 'package:base_code/view/widgets/extention/string_extension.dart';
import 'package:base_code/view/widgets/extention/widget_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/images.dart';

Future subscriptionBottumSheet(
    BuildContext context, String description, VoidCallback onPressed) {
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
                    Navigator.pop(context);
                  }),
                ],
              ).paddingOnly(bottom: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 320.w,
                    child: description.toText(
                      fontSize: 16,
                      fontFamily: poppinsMedium,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.clip,
                      color: blackPrimary,
                    ),
                  )
                ],
              ).paddingOnly(bottom: 60.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButton(
                      buttonName: Constant.okText, onPressed: onPressed)
                ],
              )
            ],
          ).paddingSymmetric(
            horizontal: 20.w,
            vertical: 20.h,
          ),
        ),
      );
    },
  );
}
