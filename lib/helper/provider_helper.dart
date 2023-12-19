import 'package:base_code/provider/notification_provider.dart';
import 'package:base_code/provider/packages_provider.dart';
import 'package:provider/provider.dart';

import '../provider/on_boarding_provider.dart';
import '../provider/authentication_provider.dart';
import '../provider/bottom_navigation_provider.dart';
import '../provider/home_provider.dart';
import '../provider/profile_provider.dart';
import '../provider/setting_provider.dart';
import '../provider/favorite_provider.dart';

class ProviderHelper {
  static List<ChangeNotifierProvider> providers = [
    ChangeNotifierProvider<OnBoardingProvider>(
        create: (context) => OnBoardingProvider()),
    ChangeNotifierProvider<AuthProvider>(create: (context) => AuthProvider()),
    ChangeNotifierProvider<PackagesProvider>(
        create: (context) => PackagesProvider()),
    ChangeNotifierProvider<HomeProvider>(create: (context) => HomeProvider()),
    ChangeNotifierProvider<FavoriteProvider>(
        create: (context) => FavoriteProvider()),
    ChangeNotifierProvider<ProfileProvider>(
        create: (context) => ProfileProvider()),
    ChangeNotifierProvider<BottomNavigationProvider>(
        create: (context) => BottomNavigationProvider()),
    ChangeNotifierProvider<NotificationProvider>(
        create: (context) => NotificationProvider()),
    ChangeNotifierProvider<SettingProvider>(
        create: (context) => SettingProvider()),
  ];
}
