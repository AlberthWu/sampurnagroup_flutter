import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
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
            Row(
              children: [
                SvgPicture.asset('assets/icon-svg/receipt1.svg'),
                SizedBox(width: 2),
                const Text(
                  ' Rincian Transaksi',
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
                  .buildRow("Jenis Transaksi", item.data.order_type_id.name),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4, bottom: 4),
              child: BuildRow().buildRow(
                  "Tanggal Transaksi", item.data.confirm_ujt_date.toString()),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4, bottom: 4),
              child: BuildRow()
                  .buildRow("UJT", formatCurrency(item.data.ujt.toInt())),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4, bottom: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: Get.width * 0.55,
                    height: Get.height * 0.0850,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromARGB(35, 14, 13, 13),
                              offset: Offset(0, 0),
                              blurRadius: 9,
                              spreadRadius: 2,
                              blurStyle: BlurStyle.normal)
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.all(9.0),
                      child: Column(
                        children: [
                          BuildRow().buildRowTransaksi(
                              "Selisih Operan", formatCurrency(100000)),
                          BuildRow().buildRowTransaksi(
                              "Bonus Potongan", formatCurrency(50000)),
                          BuildRow().buildRowTransaksiDetail("", "Lihat semua"),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4, bottom: 4),
              child: BuildRow().buildRow("Biaya Lift Off", formatCurrency(0)),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4, bottom: 4),
              child: BuildRow().buildRow("Biaya Loading", formatCurrency(0)),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4, bottom: 4),
              child: BuildRow().buildRow("Biaya Kawal", formatCurrency(400000)),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4, bottom: 4),
              child:
                  BuildRow().buildRow("Biaya Tambahan", formatCurrency(200000)),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4, bottom: 4),
              child: BuildRow()
                  .buildRow("Memo Tambahan", 'Mohon tinggalkan memo...'),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4, bottom: 4),
              child: BuildRow()
                  .buildRowTotalTransaksi("Total UJT", formatCurrency(1100000)),
            ),
          ],
        ),
      ],
    );
  }
}
