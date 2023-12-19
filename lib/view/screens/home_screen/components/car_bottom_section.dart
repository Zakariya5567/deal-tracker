import 'package:base_code/view/widgets/extention/int_extension.dart';
import 'package:base_code/view/widgets/extention/string_extension.dart';
import 'package:flutter/material.dart';
import '../../../../utils/style.dart';

class CardBottomSection extends StatelessWidget {
  const CardBottomSection(
      {super.key,
      required this.width,
      required this.title,
      required this.description,
      required this.color,
      required this.textColor});

  final double width;
  final String title;
  final String description;
  final Color color;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 54.h,
      width: width,
      color: color,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          title.toText(
              color: textColor, fontSize: 8, fontFamily: poppinsRegular),
          description.toText(
              color: textColor, fontSize: 14, fontFamily: poppinsRegular),
        ],
      ),
    );
  }
}
