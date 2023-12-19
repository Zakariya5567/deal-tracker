import 'dart:io';
import 'package:base_code/helper/routes_helper.dart';
import 'package:base_code/provider/profile_provider.dart';
import 'package:base_code/utils/images.dart';
import 'package:base_code/view/screens/profile_screen/components/profile_field.dart';
import 'package:base_code/view/widgets/custom_button.dart';
import 'package:base_code/view/widgets/extention/int_extension.dart';
import 'package:base_code/view/widgets/extention/widget_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../../../utils/colors.dart';
import '../../../utils/constant.dart';
import '../../widgets/custom_app_bar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: greenStatusBar(),
      child: SafeArea(
        bottom: Platform.isAndroid ? true : false,
        top: Platform.isAndroid ? true : false,
        child: Consumer<ProfileProvider>(builder: (context, controller, child) {
          return Scaffold(
            backgroundColor: whiteSecondary,
            appBar: customAppBar(
                context: context, title: Constant.myProfile, isBack: true),
            body: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  30.height,
                  SizedBox(
                    height: 122.w,
                    width: 122.w,
                    child: Container(
                        height: 120.w,
                        width: 120.w,
                        clipBehavior: Clip.hardEdge,
                        decoration: const BoxDecoration(
                            color: greenSecondary, shape: BoxShape.circle),
                        child: Image.asset(
                          Images.imgProfile,
                        )),
                  ).center,
                  50.height,
                  const ProfileField(
                      icon: Images.iconUser,
                      title: Constant.userName,
                      data: "Faraz Cheema"),
                  ProfileField(
                    icon: Images.iconEmail,
                    title: Constant.email,
                    data: "Faraz234@gmail.com",
                    iconHeight: 16.w,
                  ),
                  const ProfileField(
                      icon: Images.iconPhone,
                      title: Constant.phoneNumber,
                      data: "+92 100000000000"),
                  const ProfileField(
                    icon: Images.iconAddress,
                    title: Constant.address,
                    data: "XYZ,ABX,123",
                  ),
                  60.height,
                  CustomButton(
                    width: 313.w,
                    height: 50.h,
                    buttonName: Constant.editProfile,
                    onPressed: () {
                      Navigator.pushNamed(
                          context, RouterHelper.editProfileScreen);
                    },
                  ).center
                ],
              ).paddingSymmetric(vertical: 20.h, horizontal: 30.w),
            ),
          );
        }),
      ),
    );
  }
}
