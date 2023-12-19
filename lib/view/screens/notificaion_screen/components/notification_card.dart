import 'package:base_code/view/widgets/extention/int_extension.dart';
import 'package:base_code/view/widgets/extention/string_extension.dart';
import 'package:base_code/view/widgets/extention/widget_extension.dart';
import 'package:flutter/material.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/images.dart';
import '../../../../utils/constant.dart';
import '../../../../utils/style.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 353.w,
        child: Container(
          height: 80.h,
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
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  10.width,
                  Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: greySecondary,
                    ),
                    height: 50.h,
                    width: 50.w,
                    child: Image.asset(
                      Images.imgWatch,
                      fit: BoxFit.cover,
                    ).paddingAll(10),
                  ),
                  5.width,
                  SizedBox(
                    height: 80.h,
                    width: 230.w,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        "Rolex stainless steel men's silver watch".toText(
                            maxLine: 2,
                            color: blackPrimary,
                            fontSize: 12,
                            fontFamily: poppinsRegular),
                        5.height,
                        Row(
                          children: [
                            Constant.priceDropsTo.toText(
                                color: blackPrimary,
                                fontSize: 10,
                                fontFamily: poppinsRegular),
                            "10${Constant.percent} ${Constant.down}".toText(
                                color: greenPrimary,
                                fontSize: 10,
                                fontFamily: poppinsMedium),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ).paddingOnly(bottom: 15.h));
  }
}
