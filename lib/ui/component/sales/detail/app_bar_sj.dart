import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sgmobile/bussiness_logic/controller/SJ_Controller.dart';
import 'package:sgmobile/utils/text_style.dart';

class AppBarSales extends StatelessWidget {
  const AppBarSales({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SJController>();
    return Obx(
      () {
        if (controller.isLoading.value) {
          return const Text(
            "Detail Surat Jalan",
            style: TextStyles.bold18Grey,
          );
        } else if (controller.detailData.value != null) {
          final detail = controller.detailData.value!;
          return Text(
            "${detail.data.reference_no} | ${detail.data.fleet_id.plateNo}",
            style: TextStyles.bold18Grey,
          );
        } else {
          return const Text(
            "Detail Surat Jalan",
            style: TextStyles.bold18Grey,
          );
        }
      },
    );
  }
}
