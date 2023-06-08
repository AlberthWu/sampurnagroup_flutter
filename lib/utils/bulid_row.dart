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
  Widget buildRowDriver (String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyles.light13Black,
        ),
        Text(
          value,
          style: TextStyles.bold13Black,
        ),
      ],
    );
  }
  Widget buildRowTransaksi (String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyles.italic12Grey,
        ),
        Text(
          value,
          style: TextStyles.italic12Grey,
        ),
      ],
    );
  }
  Widget buildRowTotalTransaksi(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyles.bold13Black,
        ),
        Text(
          value,
          style: TextStyles.bold13Black,
        ),
      ],
    );
  }
  Widget buildRowTransaksiDetail(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyles.light12Blue,
        ),
        Text(
          value,
          style: TextStyles.light12Blue,
        ),
      ],
    );
  }
}
