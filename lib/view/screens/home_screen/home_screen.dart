import 'dart:io';
import 'package:base_code/provider/home_provider.dart';
import 'package:base_code/view/screens/home_screen/components/home_app_bar.dart';
import 'package:base_code/view/screens/home_screen/components/home_card_list.dart';
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
import 'components/remaining_url_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    callingApi();
    super.initState();
  }

  callingApi() {
    Future.delayed(Duration.zero, () {
      final homeProvider = Provider.of<HomeProvider>(context, listen: false);
      homeProvider.setSearchTapped(false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: greenStatusBar(),
      child: SafeArea(
        bottom: Platform.isAndroid ? true : false,
        top: Platform.isAndroid ? true : false,
        child: Consumer<HomeProvider>(builder: (context, controller, child) {
          return Scaffold(
            backgroundColor: whiteSecondary,
            appBar: homeAppBar(context: context, controller: controller),
            bottomNavigationBar: const BottomNavigation(currentIndex: 0,),
            body: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      const RemainingUrlCard(),
                      18.height,
                      "${Constant.totalTrackItems}04 "
                          .toText(
                              color: greyDark,
                              fontSize: 12,
                              fontFamily: poppinsSemiBold)
                          .align(Alignment.topLeft),
                      18.height,
                      HomeCardList(
                        controller: controller,
                      ),
                    ],
                  ).paddingOnly(left: 25.2, right: 25.w, top: 15.h)
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
