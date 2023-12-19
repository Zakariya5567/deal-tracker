import 'dart:async';
import 'package:base_code/view/widgets/extention/int_extension.dart';
import 'package:base_code/view/widgets/extention/string_extension.dart';
import 'package:base_code/view/widgets/extention/widget_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import '../../../helper/routes_helper.dart';
import '../../../utils/colors.dart';
import '../../../utils/dimension.dart';
import '../../../utils/images.dart';
import '../../../utils/constant.dart';
import '../../../utils/style.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    routes();
  }

  void routes() async {
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed(RouterHelper.onBoardingScreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    mediaQuerySize(context);
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: whiteStatusBar(),
      child: Scaffold(
          backgroundColor: whitePrimary,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              20.height,
              SvgPicture.asset(
                Images.imgLogoWithText,
                height: 96.h,
                width: 248.w,
              ),
              Constant.version
                  .toText(
                      color: blackSecondary,
                      fontSize: 14,
                      fontFamily: poppinsRegular)
                  .center
                  .paddingOnly(bottom: 10.h)
            ],
          )),
    );
  }
}
