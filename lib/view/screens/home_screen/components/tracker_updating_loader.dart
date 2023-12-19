import 'package:base_code/view/widgets/extention/int_extension.dart';
import 'package:base_code/view/widgets/extention/string_extension.dart';
import 'package:flutter/material.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/constant.dart';
import '../../../../utils/style.dart';

class TrackerUpdatingLoader extends StatelessWidget {
  const TrackerUpdatingLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 54.h,
      width: 125.w,
      color: whitePrimary,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Constant.trackerLoading.toText(
              color: blackPrimary, fontSize: 9, fontFamily: poppinsRegular),
          3.height,
          SizedBox(
            height: 25.w,
            width: 25.w,
            child: const CircularProgressIndicator(
              color: greenPrimary,
              strokeWidth: 3,
            ),
          )
        ],
      ),
    );
  }
}
