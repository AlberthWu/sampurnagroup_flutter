import 'package:flutter/material.dart';
import 'package:sgmobile/bussiness_logic/model/SJ_Model.dart';
import 'package:sgmobile/bussiness_logic/model/schedule_detail_model.dart';
import 'package:sgmobile/ui/component/sales/daftar_jadwal/image_logo_handle.dart';
import 'package:sgmobile/utils/bulid_row.dart';
import 'package:sgmobile/utils/divider_style.dart';
import 'package:sgmobile/utils/text_style.dart';

class NewSJContentPerusahaan extends StatelessWidget {
  const NewSJContentPerusahaan({Key? key, required this.item})
      : super(key: key);
  final dynamic item;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Informasi Perusahaan",
              style: TextStyles.bold16Black,
            ),
            Column(
              children: [
                ImageHandle<dynamic>(item),
                Text(
                  item?.data.company_id.name ?? "",
                  style: TextStyles.bold13Black,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 4, bottom: 4),
                  child: BuildRow().buildRow(
                    "Bisnis Unit",
                    item?.data.sales_type_id.name ?? "",
                  ),
                ),
                BuildRow().buildRow(
                  "No Jadwal",
                  _getScheduleNo(item),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: BuildRow().buildRow(
                    "Tanggal Jadwal",
                    item?.data.issue_date ?? "",
                  ),
                ),
              ],
            ),
          ],
        ),
        DividerStyles.divider,
      ],
    );
  }

  String _getScheduleNo(dynamic item) {
    if (item is ScheduleDetailModel) {
      return item.data.schedule_no ?? "";
    } else if (item is DetailSJ) {
      return item.data.schedule_id.schedule_no ?? "";
    }
    return "";
  }
}
