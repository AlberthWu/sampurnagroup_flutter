import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sgmobile/utils/colors_style.dart';
import 'package:sgmobile/utils/text_style.dart';

class NoDriverCard extends StatelessWidget {
  const NoDriverCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.45,
      height: Get.height * 0.318,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        border: Border.all(color: ColorStyle.greyLight),
        color: ColorStyle.white,
      ),
      child: const Padding(
        padding: const EdgeInsets.all(6.0),
        child: Center(
          child: Text(
            'No Driver',
            style: TextStyles.bold13Black,
          ),
        ),
      ),
    );
  }
}
