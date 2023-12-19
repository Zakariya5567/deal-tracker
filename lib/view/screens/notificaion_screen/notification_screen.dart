import 'dart:io';
import 'package:base_code/provider/notification_provider.dart';
import 'package:base_code/view/widgets/bottom_navigation.dart';
import 'package:base_code/view/widgets/custom_app_bar.dart';
import 'package:base_code/view/widgets/extention/int_extension.dart';
import 'package:base_code/view/widgets/extention/string_extension.dart';
import 'package:base_code/view/widgets/extention/widget_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../../../utils/colors.dart';
import '../../../utils/constant.dart';
import '../../../utils/style.dart';
import 'components/today_notification_list.dart';
import 'components/yesterday_notification_list.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

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
              context: context, title: Constant.notifications, isBack: false),
          bottomNavigationBar: const BottomNavigation(
            currentIndex: 2,
          ),
          body: Consumer<NotificationProvider>(
              builder: (context, controller, child) {
            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Constant.today
                          .toText(
                              color: greyDark,
                              fontSize: 12,
                              fontFamily: poppinsSemiBold)
                          .align(Alignment.topLeft),
                      18.height,
                      const TodayNotificationList(),
                      Constant.yesterday
                          .toText(
                              color: greyDark,
                              fontSize: 12,
                              fontFamily: poppinsSemiBold)
                          .align(Alignment.topLeft),
                      18.height,
                      const YesterdayNotificationList(),
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
