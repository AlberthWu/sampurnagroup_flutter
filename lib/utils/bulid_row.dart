import 'package:flutter/material.dart';
import 'package:sgmobile/utils/text_style.dart';

class BuildRow {
  Widget buildRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyles.light13Black,
        ),
        Text(
          value,
          style: TextStyles.light13Black,
        ),
      ],
    );
  }
}
