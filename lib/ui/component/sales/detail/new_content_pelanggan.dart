import 'package:flutter/material.dart';
import 'package:sgmobile/bussiness_logic/model/schedule_detail_model.dart';
import 'package:sgmobile/utils/bulid_row.dart';
import 'package:sgmobile/utils/divider_style.dart';
import 'package:sgmobile/utils/text_style.dart';

class NewSJContentPelanggan extends StatelessWidget {
  const NewSJContentPelanggan({Key? key, required this.item}) : super(key: key);
  final dynamic item;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Infromasi Pelanggan',
              style: TextStyles.bold16Black,
            ),
            Padding(
                padding: const EdgeInsets.only(top: 4, bottom: 4),
                child: BuildRow()
                    .buildRow("Asal", item?.data.origin_id.name ?? "")),
            BuildRow().buildRow("Pelanggan", item?.data.customer_id.name ?? ""),
            Padding(
              padding: const EdgeInsets.only(
                top: 4,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Tujuan",
                    style: TextStyles.light13Black,
                  ),
                  SizedBox(
                    width: 70,
                  ),
                  Expanded(
                    child: Text(
                      item?.data.plant_id.fullName ?? "",
                      style: TextStyles.light13Black,
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.end,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        DividerStyles.divider,
      ],
    );
  }
}
