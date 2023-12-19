import 'package:base_code/view/screens/Authentication_screen/forgot_password_screen.dart';
import 'package:base_code/view/screens/Authentication_screen/otp_screen.dart';
import 'package:base_code/view/screens/favorite_screen/favorite_screen.dart';
import 'package:base_code/view/screens/favorite_screen/favorite_search_screen.dart';
import 'package:base_code/view/screens/home_screen/home_screen.dart';
import 'package:base_code/view/screens/home_screen/home_search_screen.dart';
import 'package:base_code/view/screens/notificaion_screen/notification_screen.dart';
import 'package:base_code/view/screens/packages_screen/packages_screen.dart';
import 'package:base_code/view/screens/privacy_policy_screen/privacy_policy_screen.dart';
import 'package:base_code/view/screens/profile_screen/change_password_screen.dart';
import 'package:base_code/view/screens/profile_screen/profile_screen.dart';
import 'package:base_code/view/screens/setting_screen/setting_screen.dart';
import 'package:base_code/view/screens/subscription_plans_screen/choose_plan.dart';
import 'package:flutter/material.dart';
import '../view/screens/Authentication_screen/signin_screen.dart';
import '../view/screens/Authentication_screen/signup_screen.dart';
import '../view/screens/OnBoarding_screen/on_boarding_screen.dart';
import '../view/screens/connection_screen/connection_error_screen.dart';
import '../view/screens/profile_screen/edit_profile_screen.dart';
import '../view/screens/splash_screen/splash_screen.dart';
import '../view/screens/subscription_plans_screen/subsctiption_plans.dart';

class RouterHelper {
  static const initial = "/";
  static const onBoardingScreen = "/onBoardingScreen";
  static const signInScreen = "/signInScreen";
  static const signUpScreen = "/signUpScreen";
  static const forgotPasswordScreen = "/forgotPasswordScreen";
  static const otpScreen = "/otpScreen";
  static const packagesScreen = "/packagesScreen";
  static const homeScreen = "/homeScreen";
  static const favoriteScreen = "/favoriteScreen";
  static const notificationScreen = "/notificationScreen";
  static const homeSearchScreen = "/homeSearchScreen";
  static const favoriteSearchScreen = "/favoriteSearchScreen";
  static const settingScreen = "/settingScreen";
  static const privacyPolicyScreen = "/privacyPolicyScreen";
  static const profileScreen = "/profileScreen";
  static const editProfileScreen = "/editProfileScreen";
  static const changePasswordScreen = "/changePasswordScreen";
  static const subscriptionPlansScreen = "/subscriptionPlansScreen";
  static const choosePlansScreen = "/choosePlansScreen";

  static const noConnectionScreen = "/noConnectionScreen";

  static Map<String, Widget Function(BuildContext context)> routes = {
    initial: (context) => const SplashScreen(),
    onBoardingScreen: (context) => const OnBoardingScreen(),
    noConnectionScreen: (context) => const NoConnection(),
    signInScreen: (context) => const SignInScreen(),
    signUpScreen: (context) => const SignUpScreen(),
    otpScreen: (context) => const OtpScreen(),
    forgotPasswordScreen: (context) => const ForgotPasswordScreen(),
    packagesScreen: (context) => const PackagesScreen(),
    homeScreen: (context) => const HomeScreen(),
    favoriteScreen: (context) => const FavoriteScreen(),
    notificationScreen: (context) => const NotificationScreen(),
    homeSearchScreen: (context) => const HomeSearchScreen(),
    favoriteSearchScreen: (context) => const FavoriteSearchScreen(),
    settingScreen: (context) => const SettingScreen(),
    privacyPolicyScreen: (context) => const PrivacyPolicyScreen(),
    profileScreen: (context) => const ProfileScreen(),
    editProfileScreen: (context) => EditProfileScreen(),
    changePasswordScreen: (context) => ChangePasswordScreen(),
    subscriptionPlansScreen: (context) => const SubscriptionPlans(),
    choosePlansScreen: (context) => const ChoosePlan(),
  };
}
