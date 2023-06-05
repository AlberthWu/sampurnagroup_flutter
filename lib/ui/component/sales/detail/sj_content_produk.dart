import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sgmobile/bussiness_logic/model/SJ_Model.dart';
import 'package:sgmobile/utils/bulid_row.dart';
import 'package:sgmobile/utils/divider_style.dart';
import 'package:sgmobile/utils/text_style.dart';

class SJDetailContentProduk extends StatelessWidget {
  const SJDetailContentProduk(this.detail, {super.key});
  final DetailSJ detail;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SvgPicture.asset('assets/icon-svg/truck(1).svg'),
            SizedBox(width: 2),
            Text(
              "Detail Produk",
              style: TextStyles.bold16Black,
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 4),
          child: BuildRow().buildRow("Produk", detail.data.product_id.name),
        ),
        BuildRow().buildRow("Jenis Armada", detail.data.fleet_type_id.name),
      ],
    );
  }
}
