import 'package:base_code/view/widgets/extention/int_extension.dart';
import 'package:base_code/view/widgets/extention/string_extension.dart';
import 'package:base_code/view/widgets/extention/widget_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../../../../helper/routes_helper.dart';
import '../../../../provider/favorite_provider.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/images.dart';
import '../../../../utils/constant.dart';
import '../../../../utils/style.dart';

favoriteAppBar({required BuildContext context}) {
  return AppBar(
    automaticallyImplyLeading: false,
    centerTitle: true,
    toolbarHeight: 110.h,
    elevation: 0,
    title: Constant.favorite
        .toText(color: whitePrimary, fontSize: 20, fontFamily: poppinsRegular),
    bottom: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child:
            Consumer<FavoriteProvider>(builder: (context, controller, child) {
          return Container(
            height: 70.h,
            color: greenPrimary,
            alignment: Alignment.center,
            child: Container(
              height: 48.h,
              width: 333.w,
              decoration: BoxDecoration(
                  color: whitePrimary, borderRadius: BorderRadius.circular(23)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
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
                  Container(
                    width: 65.w,
                    height: 30.h,
                    decoration: BoxDecoration(
                        color: yellowPrimary,
                        borderRadius: BorderRadius.circular(15)),
                    child: Constant.btnSearch
                        .toText(
                            color: whitePrimary,
                            fontFamily: poppinsRegular,
                            fontSize: 12)
                        .center,
                  )
                ],
              ).paddingSymmetric(horizontal: 10.w),
            ).onPress(() {
              Navigator.pushNamed(context, RouterHelper.favoriteSearchScreen);
            }),
          );
        })),
  );
}
