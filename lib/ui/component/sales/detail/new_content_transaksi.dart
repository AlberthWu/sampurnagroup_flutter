import 'package:flutter/material.dart';
import 'package:sgmobile/bussiness_logic/model/schedule_detail_model.dart';
import 'package:sgmobile/bussiness_logic/model/ujt_model.dart';
import 'package:sgmobile/utils/bulid_row.dart';
import 'package:sgmobile/utils/currency.dart';
import 'package:sgmobile/utils/divider_style.dart';
import 'package:sgmobile/utils/text_style.dart';

class NewSJContentTransaksi extends StatelessWidget {
  const NewSJContentTransaksi(this.ujt, {Key? key, required this.item})
      : super(key: key);
  final dynamic item;
  final UJTModel? ujt;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Informasi Transaksi",
              style: TextStyles.bold16Black,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4, bottom: 4),
              child: BuildRow().buildRow(
                  "Jenis Transaksi", item?.data.order_type_id.name ?? ""),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "UJT",
                  style: TextStyles.light13Black,
                ),
                Text(
                  formatCurrency(ujt?.data.ujt.toInt() ?? 0),
                  style: TextStyles.light13Black,
                )
              ],
            ),
          ],
        ),
        DividerStyles.divider,
      ],
    );
  }
}
