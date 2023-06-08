import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sgmobile/bussiness_logic/model/schedule_detail_model.dart';
import 'package:sgmobile/utils/bulid_row.dart';
import 'package:sgmobile/utils/divider_style.dart';
import 'package:sgmobile/utils/text_style.dart';

class NewSJContentPengiriman extends StatelessWidget {
  const NewSJContentPengiriman({Key? key, required this.item})
      : super(key: key);
  final dynamic item;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SvgPicture.asset('assets/icon-svg/directboxsend.svg'),
                SizedBox(width: 2),
                const Text(
                  ' Info Pengiriman',
                  style: TextStyles.bold16Black,
                ),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4, bottom: 4),
              child: BuildRow()
                  .buildRow("No Jadwal", item.data.schedule_id.schedule_no),
            ),
            BuildRow()
                .buildRow("Tanggal Jadwal", item.data.schedule_id.issue_date),
            Padding(
              padding: const EdgeInsets.only(top: 4, bottom: 4),
              child: BuildRow()
                  .buildRow("No SJ", item.data.reference_no.toString()),
            ),
            BuildRow().buildRow("Tanggal SJ", item.data.issue_date),
            Padding(
              padding: const EdgeInsets.only(top: 4, bottom: 4),
              child: BuildRow().buildRow("Asal", item.data.origin_id.name),
            ),
            BuildRow().buildRow("Pelanggan", item.data.customer_id.name),
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
                      item.data.plant_id.fullName,
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
        ),
      ],
    );
  }
}
