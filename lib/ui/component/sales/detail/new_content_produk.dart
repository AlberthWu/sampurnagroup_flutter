import 'package:flutter/material.dart';
import 'package:sgmobile/bussiness_logic/model/schedule_detail_model.dart';
import 'package:sgmobile/utils/bulid_row.dart';
import 'package:sgmobile/utils/divider_style.dart';
import 'package:sgmobile/utils/text_style.dart';

class NewSJContentProduk extends StatelessWidget {
  const NewSJContentProduk({Key? key, required this.item}) : super(key: key);
  final dynamic item;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Detail Produk",
              style: TextStyles.bold16Black,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4, bottom: 4),
              child: BuildRow()
                  .buildRow("Produk", item?.data.product_id.name ?? ""),
            ),
            BuildRow()
                .buildRow("Jenis Armada", item?.data.fleet_type_id.name ?? ""),
          ],
        ),
        DividerStyles.divider,
      ],
    );
  }
}
