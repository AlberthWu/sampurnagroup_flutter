import 'package:flutter/material.dart';
import 'package:sgmobile/bussiness_logic/model/schedule_model.dart';
import 'package:sgmobile/ui/component/sales/daftar_jadwal/list_order_list.dart';

class DaftarJadwalDetail extends StatelessWidget {
  const DaftarJadwalDetail(this.item, {super.key});
  final ListDataSchedule item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [ListOrderList(item)],
      ),
    );
  }
}
