import 'package:base_code/view/widgets/extention/int_extension.dart';
import 'package:base_code/view/widgets/extention/widget_extension.dart';
import 'package:flutter/material.dart';

import '../../../../utils/colors.dart';

class PlanSliderIndication extends StatelessWidget {
  const PlanSliderIndication({super.key, required this.screen});

  final int screen;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            Container(
              height: 10.h,
              width: screen == 0 ? 23.w : 10.w,
              decoration: BoxDecoration(
                  color: screen == 0 ? greenPrimary : greySecondary,
                  borderRadius: BorderRadius.circular(50)),
            ),
            5.width,
            Container(
              height: 10.h,
              width: screen == 1 ? 23.w : 10.w,
              decoration: BoxDecoration(
                  color: screen == 1 ? greenPrimary : greySecondary,
                  borderRadius: BorderRadius.circular(50)),
            ),
            5.width,
            Container(
              height: 10.h,
              width: screen == 2 ? 23.w : 10.w,
              decoration: BoxDecoration(
                  color: screen == 2 ? greenPrimary : greySecondary,
                  borderRadius: BorderRadius.circular(50)),
            ),
            5.width,
            Container(
              height: 10.h,
              width: screen == 3 ? 23.w : 10.w,
              decoration: BoxDecoration(
                  color: screen == 3 ? greenPrimary : greySecondary,
                  borderRadius: BorderRadius.circular(50)),
            ),
          ],
        ),
      ],
    ).paddingSymmetric(horizontal: 50.w);
  }
}
