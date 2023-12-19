import 'dart:io';
import 'package:base_code/utils/constant.dart';
import 'package:base_code/utils/style.dart';
import 'package:base_code/view/screens/Authentication_screen/components/header_section.dart';
import 'package:base_code/view/screens/Authentication_screen/components/social_button.dart';
import 'package:base_code/view/widgets/extention/int_extension.dart';
import 'package:base_code/view/widgets/extention/string_extension.dart';
import 'package:base_code/view/widgets/extention/widget_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../../../../utils/colors.dart';
import '../../../helper/routes_helper.dart';
import '../../../helper/validation.dart';
import '../../../provider/authentication_provider.dart';
import '../../../utils/images.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/custom_button.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: whiteStatusBar(),
      child: SafeArea(
        key: scaffoldKey,
        bottom: Platform.isAndroid ? true : false,
        top: Platform.isAndroid ? true : false,
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: whitePrimary,
          body: Consumer<AuthProvider>(builder: (context, controller, child) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const HeaderSection(
                      image: Images.imgLogin,
                      title: Constant.login,
                      description: Constant.loginDescription),
                  30.height,
                  Form(
                    key: formKey,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTextField(
                            icon: Images.iconEmail,
                            label: Constant.emailAddress,
                            controller: controller.signInEmailController,
                            hintText: Constant.hintEmail,
                            textInputType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            suffixIcon: controller.isValidSignInEmail
                                ? Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 15.h, horizontal: 20.w),
                                    child: SvgPicture.asset(
                                      Images.iconTick,
                                    ),
                                  )
                                : const SizedBox(),
                            validator: (value) {
                              // if (controller
                              //     .signInEmailController.text.isNotEmpty) {
                              Future.delayed(Duration.zero, () {
                                if (Validation.emailValidation(value) == null) {
                                  controller.setValidSignInEmail(true);
                                } else {
                                  controller.setValidSignInEmail(false);
                                }
                              });
                              return Validation.emailValidation(value);
                              // } else {
                              //   return null;
                              // }
                            },
                          ),
                          18.height,
                          CustomTextField(
                            label: Constant.password,
                            icon: Images.iconLock,
                            obscureText: true,
                            controller: controller.signInPasswordController,
                            hintText: Constant.hintPassword,
                            textInputType: TextInputType.text,
                            textInputAction: TextInputAction.done,
                            onEyeTap: () {
                              controller.passwordVisibility();
                            },
                            validator: (value) {
                              return Validation.passwordValidation(value);
                            },
                          ),
                          15.height,
                          Constant.textBtnForgotPassword
                              .toText(
                                  fontSize: 14,
                                  color: greenPrimary,
                                  fontFamily: poppinsRegular)
                              .onPress(() {
                            Navigator.pushNamed(
                                    context, RouterHelper.forgotPasswordScreen)
                                .then((value) => formKey.currentState!.reset());

                            controller.clearTextFields();
                            controller.resetValidation();
                          }).align(Alignment.centerRight),
                          42.height,
                          CustomButton(
                            buttonName: Constant.login,
                            onPressed: () async {
                              // if (formKey.currentState!.validate()) {
                              //   FocusManager.instance.primaryFocus?.unfocus();
                              Navigator.pushNamed(
                                      context, RouterHelper.otpScreen)
                                  .then(
                                      (value) => formKey.currentState!.reset());
                              controller.clearTextFields();
                              controller.resetValidation();
                              // }
                            },
                          ).center,
                          22.height,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Constant.noUserAccountYet.toText(
                                  fontSize: 14,
                                  color: blackPrimary,
                                  fontFamily: poppinsLight),
                              Constant.textBtnSignUp
                                  .toText(
                                      fontSize: 14,
                                      color: greenPrimary,
                                      fontFamily: poppinsMedium)
                                  .onPress(() {
                                Navigator.of(context)
                                    .pushNamedAndRemoveUntil(
                                        RouterHelper.signUpScreen,
                                        (route) => false)
                                    .then((value) =>
                                        formKey.currentState!.reset());

                                controller.clearTextFields();
                                controller.resetValidation();
                                // Navigator.pushNamed(
                                //     context, RouterHelper.signUpScreen);
                              })
                            ],
                          ),
                          28.height,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SocialButton(
                                  image: Images.iconGoogle, onPressed: () {}),
                              40.width,
                              SocialButton(
                                  image: Images.iconApple, onPressed: () {}),
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
