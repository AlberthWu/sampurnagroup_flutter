import 'package:flutter/material.dart';
import 'package:sgmobile/bussiness_logic/model/SJ_Model.dart';
import 'package:sgmobile/utils/bulid_row.dart';
import 'package:sgmobile/utils/divider_style.dart';
import 'package:sgmobile/utils/text_style.dart';

class SJDetailContentTransaksi extends StatelessWidget {
  const SJDetailContentTransaksi(this.detail, {super.key});
  final DetailSJ detail;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Rincian Transaksi',
          style: TextStyles.bold16Black,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 4, bottom: 4),
          child: BuildRow()
              .buildRow("Jenis Transaksi", detail.data.order_type_id.name),
        ),
        BuildRow().buildRow("Tanggal Terima", detail.data.receive_date ?? ""),
        Padding(
          padding: const EdgeInsets.only(top: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Tujuan",
                style: TextStyles.light13Black,
              ),
              const SizedBox(width: 70),
              Expanded(
                child: Text(
                  detail.data.plant_id.fullName,
                  style: TextStyles.light13Black,
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.end,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
