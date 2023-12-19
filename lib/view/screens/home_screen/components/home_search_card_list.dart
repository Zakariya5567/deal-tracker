import 'package:base_code/view/screens/home_screen/components/home_card.dart';
import 'package:flutter/material.dart';

import '../../../../provider/home_provider.dart';

class HomeSearchCardList extends StatelessWidget {
  const HomeSearchCardList({super.key, required this.controller});
  final HomeProvider controller;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 4,
        itemBuilder: (context, index) {
          return HomeCard(index: index, controller: controller,);
        });
  }
}
