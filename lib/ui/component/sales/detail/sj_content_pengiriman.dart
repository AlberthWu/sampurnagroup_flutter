import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sgmobile/bussiness_logic/model/SJ_Model.dart';
import 'package:sgmobile/utils/bulid_row.dart';
import 'package:sgmobile/utils/text_style.dart';

class SJDetailContentPengiriman extends StatelessWidget {
  const SJDetailContentPengiriman(this.detail, {Key? key}) : super(key: key);
  final DetailSJ detail;

  @override
  Widget build(BuildContext context) {
    return Column(
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
              .buildRow("No Jadwal", detail.data.schedule_id.schedule_no),
        ),
        BuildRow()
            .buildRow("Tanggal Jadwal", detail.data.schedule_id.issue_date),
        Padding(
          padding: const EdgeInsets.only(top: 4, bottom: 4),
          child:
              BuildRow().buildRow("No SJ", detail.data.reference_no.toString()),
        ),
        BuildRow().buildRow("Tanggal SJ", detail.data.issue_date),
        Padding(
          padding: const EdgeInsets.only(top: 4, bottom: 4),
          child: BuildRow().buildRow("Asal", detail.data.origin_id.name),
        ),
        BuildRow().buildRow("Pelanggan", detail.data.customer_id.name),
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
