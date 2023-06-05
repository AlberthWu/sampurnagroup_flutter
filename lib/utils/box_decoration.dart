import 'package:flutter/material.dart';
import 'package:sgmobile/utils/colors_style.dart';

class BoxDecorationStyles {
  final cardBoxStyle = BoxDecoration(
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      boxShadow: [
        BoxShadow(
          color: ColorStyle.greyVeryLight.withOpacity(0.5),
          spreadRadius: 2,
          blurRadius: 1,
          offset: Offset(0, 0),
        ),
      ],
      color: ColorStyle.white);
  final boxDecorationButton = const BoxDecoration(
    color: ColorStyle.greyDark,
    borderRadius: BorderRadius.all(
      Radius.circular(5),
    ),
  );
}
