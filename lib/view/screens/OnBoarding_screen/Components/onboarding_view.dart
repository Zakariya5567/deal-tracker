import 'package:base_code/view/widgets/extention/int_extension.dart';
import 'package:base_code/view/widgets/extention/string_extension.dart';
import 'package:base_code/view/widgets/extention/widget_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/images.dart';
import '../../../../utils/style.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView(
      {super.key,
      required this.image,
      required this.heading,
      required this.description});

  final String image;
  final String heading;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        15.height,
        SvgPicture.asset(
          Images.imgLogo,
          height: 72.h,
          width: 56.w,
        ).paddingOnly(top: 25.h, left: 25.w, bottom: 20.h),
        SvgPicture.asset(
          image,
          height: 380.h,
          width: 383.w,
        ),
        55.height,
        heading
            .toText(
                color: blackPrimary, fontSize: 23, fontFamily: poppinsSemiBold)
            .center,
        15.height,
        SizedBox(
                width: 304.w,
                child: description.toText(
                    maxLine: 4,
                    textAlign: TextAlign.center,
                    color: blackPrimary,
                    fontSize: 16,
                    fontFamily: poppinsRegular))
            .center,
      ],
    );
  }
}
