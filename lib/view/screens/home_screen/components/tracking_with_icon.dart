import 'package:base_code/view/widgets/extention/int_extension.dart';
import 'package:base_code/view/widgets/extention/string_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/images.dart';
import '../../../../utils/style.dart';

class TrackingWithIcon extends StatelessWidget {
  const TrackingWithIcon({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          Images.iconCheck,
          height: 13.w,
          width: 14.w,
        ),
        5.width,
        title.toText(
            color: blackPrimary, fontSize: 8, fontFamily: poppinsRegular),
      ],
    );
  }
}
