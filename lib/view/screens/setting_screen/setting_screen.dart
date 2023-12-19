import 'dart:io';
import 'package:base_code/helper/routes_helper.dart';
import 'package:base_code/provider/setting_provider.dart';
import 'package:base_code/utils/images.dart';
import 'package:base_code/view/screens/setting_screen/components/setting_list.dart';
import 'package:base_code/view/widgets/bottom_navigation.dart';
import 'package:base_code/view/widgets/custom_button.dart';
import 'package:base_code/view/widgets/extention/int_extension.dart';
import 'package:base_code/view/widgets/extention/string_extension.dart';
import 'package:base_code/view/widgets/extention/widget_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../../../utils/colors.dart';
import '../../../utils/constant.dart';
import '../../../utils/style.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/warning_sheet.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

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
              context: context, title: Constant.setting, isBack: false),
          bottomNavigationBar: const BottomNavigation(
            currentIndex: 3,
          ),
          body:
              Consumer<SettingProvider>(builder: (context, controller, child) {
            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                      height: 62.h,
                      child: ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: Container(
                            width: 62.w,
                            height: 62.w,
                            decoration: const BoxDecoration(
                              color: greenSecondary,
                              borderRadius: BorderRadius.all(
                                Radius.circular(15),
                              ),
                            ),
                            child: SvgPicture.asset(Images.iconPerson)
                                .paddingAll(15.w),
                          ),
                          title: "Faraz Cheema".toText(
                              color: blackPrimary,
                              fontSize: 18,
                              fontFamily: poppinsMedium),
                          subtitle: "Faraz24@gmail.com".toText(
                            color: greyPrimary,
                            fontSize: 12,
                            fontFamily: poppinsRegular,
                          ))),
                  50.height,
                  SettingList(
                      icon: Images.iconUser,
                      title: Constant.myProfile,
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          RouterHelper.profileScreen,
                        );
                      }),
                  SettingList(
                    icon: Images.iconSubscription,
                    title: Constant.subscriptionPlans,
                    onTap: () {
                      Navigator.pushNamed(
                          context, RouterHelper.subscriptionPlansScreen);
                    },
                  ),
                  SettingList(
                      icon: Images.iconLock,
                      title: Constant.changePassword,
                      onTap: () {
                        Navigator.pushNamed(
                            context, RouterHelper.changePasswordScreen);
                      }),
                  SettingList(
                      icon: Images.iconPrivacy,
                      title: Constant.privacyPolicy,
                      onTap: () {
                        Navigator.pushNamed(
                            context, RouterHelper.privacyPolicyScreen);
                      }),
                  SettingList(
                      icon: Images.iconLogout,
                      title: Constant.logOut,
                      color: redPrimary,
                      onTap: () {
                        warningBottumSheet(context, Images.iconLogoutCircle,
                            Constant.logOutWarning, () {});
                      }),
                  130.height,
                  CustomButton(
                    width: 175.w,
                    height: 45.h,
                    buttonName: Constant.btnDeleteAccount,
                    onPressed: () {},
                    buttonColor: redPrimary,
                    borderColor: redPrimary,
                  )
                ],
              ).paddingSymmetric(vertical: 20.h, horizontal: 30.w),
            );
          }),
        ),
      ),
    );
  }
}
