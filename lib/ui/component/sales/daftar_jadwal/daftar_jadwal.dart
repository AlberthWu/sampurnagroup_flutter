import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sgmobile/bussiness_logic/controller/SJ_Controller.dart';
import 'package:sgmobile/ui/component/sales/daftar_jadwal/list_daftar_jadwal.dart';
import 'package:sgmobile/ui/pages/sales/detail_sj.dart';
import 'package:sgmobile/ui/pages/sales/new_sj.dart';
import 'package:sgmobile/utils/colors_style.dart';
import 'package:sgmobile/utils/loading.dart';
import 'package:sgmobile/utils/no_data.dart';
import 'package:sgmobile/utils/text_style.dart';

class DaftarJadwal extends StatelessWidget {
  const DaftarJadwal({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SJController>();

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Obx(() {
            final isLoading = controller.isLoading.value;
            final listSchedule = controller.listSchedule.value?.list;
            final isError = controller.isError.value;

            if (isLoading && listSchedule == null) {
              return const LoadingInformation();
            } else if (listSchedule != null && listSchedule.isNotEmpty) {
              return Expanded(
                  child: ListDaftarJadwal(listSchedule, controller));
            } else {
              return const NoData();
            }
          })
        ],
      ),
    );
  }
}
