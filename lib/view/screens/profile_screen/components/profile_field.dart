import 'package:base_code/view/widgets/extention/int_extension.dart';
import 'package:base_code/view/widgets/extention/string_extension.dart';
import 'package:base_code/view/widgets/extention/widget_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/style.dart';

class ProfileField extends StatelessWidget {
  const ProfileField(
      {super.key,
      required this.icon,
      required this.title,
      required this.data,
      this.iconHeight,
      this.iconWidth});

  final String icon;
  final String title;
  final String data;
  final double? iconWidth;
  final double? iconHeight;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        title.toText(
            color: blackPrimary, fontSize: 12, fontFamily: poppinsRegular),
        5.height,
        Container(
          height: 50.h,
          width: 353.w,
          decoration: BoxDecoration(
              color: greySecondary, borderRadius: BorderRadius.circular(10)),
          child: Row(
            children: [
              SizedBox(
                height: iconHeight ?? 24.h,
                width: iconWidth ?? 24.w,
                child: SvgPicture.asset(
                  icon,
                  colorFilter:
                      const ColorFilter.mode(greenPrimary, BlendMode.srcIn),
                ),
              ),
              10.width,
              SizedBox(
                width: 270.w,
                child: data.toText(
                    color: blackPrimary,
                    fontSize: 14,
                    fontFamily: poppinsLight),
              )
            ],
          ).paddingOnly(left: 15),
        )
      ],
    ).paddingSymmetric(vertical: 8.h);
  }
}
