import 'package:flutter/services.dart';

//primary swatch
const Map<int, Color> primaryColor = {
  50: Color.fromRGBO(66, 112, 105, 0.1),
  100: Color.fromRGBO(66, 112, 105, 0.2),
  200: Color.fromRGBO(66, 112, 105, 0.3),
  300: Color.fromRGBO(66, 112, 105, 0.4),
  400: Color.fromRGBO(66, 112, 105, 0.5),
  500: Color.fromRGBO(66, 112, 105, 0.6),
  600: Color.fromRGBO(66, 112, 105, 0.7),
  700: Color.fromRGBO(66, 112, 105, 0.8),
  800: Color.fromRGBO(66, 112, 105, 0.9),
  900: Color.fromRGBO(66, 112, 105, 1),
};

// blue
const yellowPrimary = Color.fromRGBO(252, 176, 65, 1);

const redPrimary = Color.fromRGBO(222, 0, 0, 1);
const redSecondary = Color.fromRGBO(255, 66, 41, 1);

const blackPrimary = Color.fromRGBO(48, 44, 43, 1);
const blackSecondary = Color.fromRGBO(35, 35, 35, 1);
const blackLight = Color.fromRGBO(18, 18, 18, 1);

const skylarColor = Color.fromRGBO(107, 206, 188, 1);

const greenBush = Color.fromRGBO(52, 94, 86, 1);
const greenPrimary = Color.fromRGBO(66, 112, 105, 1);
const greenSecondary = Color.fromRGBO(66, 112, 105, 0.26);
const greenLight = Color.fromRGBO(66, 112, 105, 0.07);

const greyPrimary = Color.fromRGBO(130, 130, 130, 1);
const greySecondary = Color.fromRGBO(219, 219, 219, 1);
const greyLight = Color.fromRGBO(198, 198, 198, 1);
const greyDark = Color.fromRGBO(139, 139, 139, 1);

const whitePrimary = Color.fromRGBO(255, 255, 255, 1);
const whiteSecondary = Color.fromRGBO(245, 245, 245, 1);


// statusBar

greenStatusBar() {
  return const SystemUiOverlayStyle(
      statusBarColor: greenPrimary,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: whitePrimary,
      systemNavigationBarIconBrightness: Brightness.dark,
      systemNavigationBarDividerColor: greenSecondary);
}

whiteStatusBar() {
  return const SystemUiOverlayStyle(
      statusBarColor: whitePrimary,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: whitePrimary,
      systemNavigationBarIconBrightness: Brightness.dark,
      systemNavigationBarDividerColor: whitePrimary);
}
