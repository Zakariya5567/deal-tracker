import 'dart:io';
import 'package:base_code/provider/notification_provider.dart';
import 'package:base_code/view/widgets/extention/int_extension.dart';
import 'package:base_code/view/widgets/extention/string_extension.dart';
import 'package:base_code/view/widgets/extention/widget_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../../../utils/colors.dart';
import '../../../utils/constant.dart';
import '../../../utils/style.dart';
import '../../widgets/custom_app_bar.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: greenStatusBar(),
      child: SafeArea(
        bottom: Platform.isAndroid ? true : false,
        top: Platform.isAndroid ? true : false,
        child: Scaffold(
          backgroundColor: whiteSecondary,
          appBar: customAppBar(
              context: context, title: Constant.privacyPolicy, isBack: true),
          body: Consumer<NotificationProvider>(
              builder: (context, controller, child) {
            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  10.height,
                  Constant.titleOfTheContent.toText(
                      color: blackPrimary,
                      fontSize: 16,
                      fontFamily: poppinsMedium),
                  10.height,
                  Constant.policyPrivacyDescription.toText(
                      maxLine: 50,
                      lineHeight: 1.6,
                      color: blackPrimary,
                      fontSize: 12,
                      fontFamily: poppinsRegular),
                ],
              ).paddingSymmetric(horizontal: 20.w, vertical: 20.h),
            );
          }),
        ),
      ),
    );
  }
}
