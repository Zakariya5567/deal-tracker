import 'package:base_code/view/widgets/extention/int_extension.dart';
import 'package:base_code/view/widgets/extention/string_extension.dart';
import 'package:base_code/view/widgets/extention/widget_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/constant.dart';
import '../../../../utils/images.dart';
import '../../../../utils/style.dart';

class ChoosePlanDescription extends StatelessWidget {
  const ChoosePlanDescription(
      {super.key,
      required this.description,
      this.isBackground,
      this.hour,
      this.item,
      this.minute});
  final String description;
  final bool? isBackground;
  final int? hour;
  final int? minute;
  final int? item;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          Images.iconDone,
          height: 8.h,
          width: 20.w,
        ),
        10.width,
        description.toText(
            color: whitePrimary, fontSize: 10, fontFamily: poppinsRegular),
        hour != null
            ? Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  color:
                      isBackground == true ? whitePrimary : Colors.transparent,
                ),
                child: " $hour ${Constant.hours} ".toText(
                    color: isBackground == true ? greenPrimary : whitePrimary,
                    fontSize: 10,
                    fontFamily: poppinsRegular),
              )
            : const SizedBox(),
        minute != null
            ? Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  color:
                      isBackground == true ? whitePrimary : Colors.transparent,
                ),
                child: " $minute ${Constant.minutes} ".toText(
                    color: isBackground == true ? greenPrimary : whitePrimary,
                    fontSize: 10,
                    fontFamily: poppinsRegular),
              )
            : const SizedBox(),
        item != null
            ? Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  color:
                      isBackground == true ? whitePrimary : Colors.transparent,
                ),
                child: " $item ${Constant.items} ".toText(
                    color: isBackground == true ? greenPrimary : whitePrimary,
                    fontSize: 10,
                    fontFamily: poppinsRegular),
              )
            : const SizedBox(),
      ],
    ).paddingOnly(left: 10.w, top: 10.h);
  }
}
