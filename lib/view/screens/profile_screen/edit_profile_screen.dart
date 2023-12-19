// ignore_for_file: must_be_immutable

import 'dart:io';
import 'package:base_code/provider/profile_provider.dart';
import 'package:base_code/utils/images.dart';
import 'package:base_code/view/widgets/custom_button.dart';
import 'package:base_code/view/widgets/extention/int_extension.dart';
import 'package:base_code/view/widgets/extention/widget_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../../../helper/validation.dart';
import '../../../utils/colors.dart';
import '../../../utils/constant.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_text_field.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({Key? key}) : super(key: key);
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
                context: context, title: Constant.editProfile, isBack: true),
            body: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  30.height,
                  SizedBox(
                    height: 122.w,
                    width: 122.w,
                    child: Stack(
                      children: [
                        Container(
                            height: 120.w,
                            width: 120.w,
                            clipBehavior: Clip.hardEdge,
                            decoration: const BoxDecoration(
                                color: greenSecondary, shape: BoxShape.circle),
                            child: Image.asset(
                              Images.imgProfile,
                            )
                            // SvgPicture.asset(
                            //   Images.iconPerson,
                            // ).paddingAll(25.w
                            // )
                            ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: InkWell(
                            onTap: () {
                              //  showPicker(context);
                            },
                            child: Container(
                                height: 34.w,
                                width: 34.w,
                                clipBehavior: Clip.hardEdge,
                                decoration: const BoxDecoration(
                                    color: greenPrimary,
                                    shape: BoxShape.circle),
                                child: SvgPicture.asset(
                                  Images.iconPencil,
                                ).paddingAll(8.w)),
                          ),
                        ),
                      ],
                    ),
                  ).center,
                  50.height,
                  Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextField(
                          label: Constant.userName,
                          icon: Images.iconUser,
                          controller: controller.nameController,
                          hintText: Constant.hintUserName,
                          textInputType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          validator: (value) {
                            return Validation.nameValidation(value);
                          },
                        ),
                        15.height,
                        CustomTextField(
                          label: Constant.email,
                          icon: Images.iconEmail,
                          controller: controller.emailController,
                          hintText: Constant.hintEnterEmail,
                          textInputType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          validator: (value) {
                            return Validation.emailValidation(value);
                          },
                        ),
                        15.height,
                        CustomTextField(
                          label: Constant.phoneNumber,
                          icon: Images.iconPhone,
                          controller: controller.phoneController,
                          hintText: Constant.hintPhoneNumber,
                          textInputType: TextInputType.phone,
                          textInputAction: TextInputAction.next,
                          validator: (value) {
                            return Validation.phoneValidation(value);
                          },
                        ),
                        15.height,
                        CustomTextField(
                          label: Constant.address,
                          icon: Images.iconAddress,
                          controller: controller.addressController,
                          hintText: Constant.hintAddress,
                          textInputType: TextInputType.text,
                          textInputAction: TextInputAction.done,
                          validator: (value) {
                            return Validation.addressValidation(value);
                          },
                        ),
                        60.height,
                        CustomButton(
                          width: 313.w,
                          height: 50.h,
                          buttonName: Constant.btnUpdate,
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
