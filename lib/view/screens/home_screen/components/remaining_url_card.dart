import 'package:base_code/view/widgets/extention/int_extension.dart';
import 'package:base_code/view/widgets/extention/string_extension.dart';
import 'package:base_code/view/widgets/extention/widget_extension.dart';
import 'package:flutter/material.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/images.dart';
import '../../../../utils/constant.dart';
import '../../../../utils/style.dart';

class RemainingUrlCard extends StatelessWidget {
  const RemainingUrlCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110.h,
      width: 353.w,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: const DecorationImage(
              fit: BoxFit.cover, image: AssetImage(Images.imgCard))),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Constant.remainingURLs
              .toText(
                  color: whitePrimary, fontSize: 18, fontFamily: poppinsRegular)
              .paddingOnly(left: 20.w, top: 12.h),
          Stack(
            children: [
              SizedBox(
                height: 75.w,
                width: 75.w,
                child: const RotatedBox(
                  quarterTurns: 4,
                  child: CircularProgressIndicator(
                    strokeWidth: 5,
                    value: 0.78,
                    color: whitePrimary,
                  ),
                ),
              ),
              Positioned(
                  top: 20.h,
                  left: 18.w,
                  child: Row(
                    children: [
                      "46".toText(
                          color: whitePrimary,
                          fontSize: 19,
                          fontFamily: poppinsRegular),
                      "/50".toText(
                          color: whitePrimary,
                          fontSize: 10,
                          fontFamily: poppinsLight)
                    ],
                  ))
            ],
          ).paddingOnly(right: 25, top: 8),
        ],
      ),
    );
  }
}
