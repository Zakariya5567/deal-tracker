import 'dart:io';
import 'package:base_code/provider/packages_provider.dart';
import 'package:base_code/view/screens/favorite_screen/components/favorite_app_bar.dart';
import 'package:base_code/view/widgets/bottom_navigation.dart';
import 'package:base_code/view/widgets/extention/int_extension.dart';
import 'package:base_code/view/widgets/extention/string_extension.dart';
import 'package:base_code/view/widgets/extention/widget_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../../../utils/colors.dart';
import '../../../utils/constant.dart';
import '../../../utils/style.dart';
import 'components/favorite_card_list.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: greenStatusBar(),
      child: SafeArea(
        bottom: Platform.isAndroid ? true : false,
        top: Platform.isAndroid ? true : false,
        child: Scaffold(
          backgroundColor: whiteSecondary,
          appBar: favoriteAppBar(context: context),
          bottomNavigationBar: const BottomNavigation(
            currentIndex: 1,
          ),
          body:
              Consumer<PackagesProvider>(builder: (context, controller, child) {
            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      "${Constant.totalFavouriteItems}06 "
                          .toText(
                              color: greyDark,
                              fontSize: 12,
                              fontFamily: poppinsSemiBold)
                          .align(Alignment.topLeft),
                      18.height,
                      const FavoriteCardList(),
                    ],
                  ).paddingOnly(left: 25.2, right: 25.w, top: 15.h)
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
