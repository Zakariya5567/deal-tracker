import 'package:base_code/helper/routes_helper.dart';
import 'package:base_code/view/widgets/button_with_icon.dart';
import 'package:base_code/view/widgets/extention/int_extension.dart';
import 'package:base_code/view/widgets/extention/string_extension.dart';
import 'package:base_code/view/widgets/extention/widget_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../provider/home_provider.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/images.dart';
import '../../../../utils/constant.dart';
import '../../../../utils/style.dart';
import 'add_new_item_sheet.dart';

homeAppBar({required BuildContext context, required HomeProvider controller}) {
  return AppBar(
    automaticallyImplyLeading: false,
    centerTitle: true,
    toolbarHeight: 110.h,
    elevation: 0,
    title: Constant.home
        .toText(color: whitePrimary, fontSize: 20, fontFamily: poppinsRegular),
    bottom: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: Container(
          height: 70.h,
          color: greenPrimary,
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 48.h,
                width: 230.w,
                decoration: BoxDecoration(
                    color: whitePrimary,
                    borderRadius: BorderRadius.circular(23)),
                child: Row(
                  children: [
                    10.width,
                    SvgPicture.asset(
                      Images.iconSearch,
                      colorFilter:
                          const ColorFilter.mode(greyDark, BlendMode.srcIn),
                    ),
                    8.width,
                    Constant.hintSearch.toText(
                        color: greyDark,
                        fontSize: 14,
                        fontFamily: poppinsRegular),
                  ],
                ),
              ).onPress(() {
                Navigator.pushNamed(context, RouterHelper.homeSearchScreen);
              }),
              ButtonWithIcon(
                  borderColor: yellowPrimary,
                  height: 48.h,
                  width: 115.w,
                  buttonColor: yellowPrimary,
                  buttonName: Constant.btnAddItem,
                  onPressed: () {
                    addNewItemBottumSheet(context, () {
                      // Track Price Switch
                      controller.setPriceTrack();
                    }, () {
                      // Track Availability Switch
                      controller.setAvailabilityTrack();
                    }, () {
                      // Start Tracking
                    }, () {
                      // Ad to Favourite
                    });
                  },
                  icon: Images.iconAdd)
            ],
          ).paddingSymmetric(horizontal: 20.w),
        )),
  );
}
