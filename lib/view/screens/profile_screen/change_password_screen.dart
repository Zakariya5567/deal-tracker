// ignore_for_file: must_be_immutable

import 'dart:io';
import 'package:base_code/provider/profile_provider.dart';
import 'package:base_code/utils/images.dart';
import 'package:base_code/view/widgets/custom_button.dart';
import 'package:base_code/view/widgets/extention/int_extension.dart';
import 'package:base_code/view/widgets/extention/string_extension.dart';
import 'package:base_code/view/widgets/extention/widget_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../../../helper/validation.dart';
import '../../../utils/colors.dart';
import '../../../utils/constant.dart';
import '../../../utils/style.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_text_field.dart';

class ChangePasswordScreen extends StatelessWidget {
  ChangePasswordScreen({Key? key}) : super(key: key);
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

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
                context: context, title: Constant.changePassword, isBack: true),
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
                          child: SvgPicture.asset(
                            Images.iconLockCircle,
                          ))).center,
                  50.height,
                  Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextField(
                          obscureText: controller.isVisible,
                          label: Constant.oldPassword,
                          icon: Images.iconLock,
                          controller: controller.oldPasswordController,
                          hintText: Constant.hintPassword,
                          textInputType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          validator: (value) {
                            return Validation.passwordValidation(value);
                          },
                          suffixIcon: Container(
                            height: 20.h,
                            width: 50.w,
                            decoration: BoxDecoration(
                                color: greenLight,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                    color: greenPrimary, width: 0.7)),
                            child: (controller.isVisible == false
                                    ? Constant.hide
                                    : Constant.show)
                                .toText(
                                    color: greenPrimary,
                                    fontSize: 12,
                                    fontFamily: poppinsRegular)
                                .center,
                          ).onPress(() {
                            controller.passwordVisibility();
                          }).paddingAll(10.h),
                        ),
                        15.height,
                        CustomTextField(
                          label: Constant.newPassword,
                          icon: Images.iconLock,
                          controller: controller.newPasswordController,
                          hintText: Constant.hintNewPassword,
                          textInputType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          validator: (value) {
                            return Validation.passwordValidation(value);
                          },
                        ),
                        15.height,
                        CustomTextField(
                          label: Constant.confirmNewPassword,
                          icon: Images.iconLock,
                          controller: controller.confirmPasswordController,
                          hintText: Constant.hintConfirmPassword,
                          textInputType: TextInputType.text,
                          textInputAction: TextInputAction.done,
                          validator: (value) {
                            return controller.confirmPasswordValidation(value!);
                          },
                        ),
                        140.height,
                        CustomButton(
                          width: 313.w,
                          height: 50.h,
                          buttonName: Constant.btnChange,
                          onPressed: () async {
                            if (formKey.currentState!.validate()) {
                              FocusManager.instance.primaryFocus?.unfocus();
                            }
                          },
                        ).center,
                      ],
                    ),
                  ),
                ],
              ).paddingSymmetric(vertical: 20.h, horizontal: 30.w),
            ),
          );
        }),
      ),
    );
  }
}
