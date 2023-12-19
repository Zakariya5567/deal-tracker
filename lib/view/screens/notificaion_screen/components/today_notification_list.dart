import 'package:base_code/view/widgets/extention/int_extension.dart';
import 'package:flutter/material.dart';
import 'notification_card.dart';

class TodayNotificationList extends StatelessWidget {
  const TodayNotificationList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 353.w,
      child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 4,
          itemBuilder: (context, index) {
            return const NotificationCard();
          }),
    );
  }
}
