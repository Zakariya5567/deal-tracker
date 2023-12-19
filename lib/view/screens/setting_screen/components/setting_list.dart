import 'package:base_code/view/widgets/extention/int_extension.dart';
import 'package:base_code/view/widgets/extention/string_extension.dart';
import 'package:base_code/view/widgets/extention/widget_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/images.dart';
import '../../../../utils/style.dart';

class SettingList extends StatelessWidget {
  const SettingList(
      {super.key,
      required this.icon,
      required this.title,
      required this.onTap,
      this.color,
      this.iconWidth,
      this.iconHeight});

  final String icon;
  final String title;
  final VoidCallback onTap;
  final Color? color;
  final double? iconHeight;
  final double? iconWidth;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      contentPadding: EdgeInsets.zero,
      minLeadingWidth: 0,
      leading: SvgPicture.asset(
        icon,
        height: iconHeight ?? 25.w,
        width: iconWidth ?? 25.w,
        colorFilter: ColorFilter.mode(color ?? greenPrimary, BlendMode.srcIn),
      ),
      title: title.toText(
          color: color ?? blackPrimary,
          fontSize: 15,
          fontFamily: poppinsRegular),
      trailing: SvgPicture.asset(
        Images.iconArrowForward,
        height: 15.w,
        width: 15.w,
      ),
    ).paddingSymmetric(vertical: 3.h);
  }
}
