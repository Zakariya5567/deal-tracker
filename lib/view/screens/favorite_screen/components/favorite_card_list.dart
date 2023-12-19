import 'package:base_code/view/widgets/custom_button.dart';
import 'package:base_code/view/widgets/extention/int_extension.dart';
import 'package:base_code/view/widgets/extention/string_extension.dart';
import 'package:base_code/view/widgets/extention/widget_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/images.dart';
import '../../../../utils/constant.dart';
import '../../../../utils/style.dart';
import '../../../widgets/warning_sheet.dart';

class FavoriteCardList extends StatelessWidget {
  const FavoriteCardList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //height: 610.h,
      width: 353.w,
      child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 5,
          itemBuilder: (context, index) {
            return Container(
              height: 175.h,
              width: 353.w,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                  color: whitePrimary,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                        color: greySecondary,
                        offset: Offset(0, 4),
                        blurRadius: 8,
                        spreadRadius: 2)
                  ]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 110.h,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 75.w,
                          child: Column(
                            children: [
                              12.height,
                              SizedBox(
                                height: 64.w,
                                width: 64.w,
                                child: Image.asset(
                                  Images.imgWatch,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 210.w,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              12.height,
                              "Rolex stainless steel men's silver watch".toText(
                                  maxLine: 2,
                                  color: blackPrimary,
                                  fontSize: 13,
                                  fontFamily: poppinsRegular),
                              5.height,
                              Row(
                                children: [
                                  Constant.firstPrice.toText(
                                      color: blackPrimary,
                                      fontSize: 10,
                                      fontFamily: poppinsRegular),
                                  "${Constant.dollar}2500".toText(
                                      color: greenPrimary,
                                      fontSize: 10,
                                      fontFamily: poppinsSemiBold),
                                ],
                              ),
                              5.height,
                              Row(
                                children: [
                                  Constant.stock.toText(
                                      color: blackPrimary,
                                      fontSize: 10,
                                      fontFamily: poppinsRegular),
                                  Constant.available.toText(
                                      color: greenPrimary,
                                      fontSize: 10,
                                      fontFamily: poppinsSemiBold),
                                ],
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 55.w,
                          child: Column(
                            children: [
                              12.height,
                              SvgPicture.asset(
                                Images.iconDeleteCircle,
                                height: 26.w,
                                width: 26.w,
                              ).onPress(() {
                                warningBottumSheet(
                                    context,
                                    Images.iconDeleteCircle,
                                    Constant.deleteItemWarning,
                                    () {});
                              })
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 60.h,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: CustomButton(
                          height: 35.h,
                          width: 190.w,
                          textSize: 12,
                          buttonName: Constant.btnStartTracking,
                          onPressed: () {}),
                    ).paddingOnly(right: 15.w),
                  )
                ],
              ),
            ).paddingOnly(bottom: 15.h);
          }),
    );
  }
}
