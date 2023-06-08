import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sgmobile/bussiness_logic/controller/SJ_Controller.dart';
import 'package:sgmobile/ui/component/sales/daftar_jadwal/app_bar_SJ_baru.dart';
import 'package:sgmobile/ui/component/sales/detail/new_content_pengiriman.dart';
import 'package:sgmobile/ui/component/sales/detail/new_content_perusahaan.dart';
import 'package:sgmobile/ui/component/sales/detail/new_content_produk.dart';
import 'package:sgmobile/ui/component/sales/detail/new_content_select_driver.dart';
import 'package:sgmobile/ui/component/sales/detail/new_content_select_plate.dart';
import 'package:sgmobile/ui/component/sales/detail/new_content_transaksi.dart';
import 'package:sgmobile/utils/colors_style.dart';

import '../../../utils/divider_style.dart';

class CreateSJPage extends StatelessWidget {
  const CreateSJPage(int id, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SJController>();
    final listFleet =
        controller.filteredFleetData.value ?? controller.fleetData.value?.data;
    final item = controller.detailSchedule.value;
    final ujt = controller.ujtData.value;
    final selectedPlateNo = controller.selectedPlateNo.value;
    final primaryStatusTemp = controller.primaryStatusTemp;
    final secondaryStatusTemp = controller.secondaryStatusTemp;
    final selectedDriverId = controller.selectedDriverId;
    return WillPopScope(
      onWillPop: () async {
        controller.detailSchedule.value = null;
        controller.selectedPlateNo.value = null;
        controller.fleetData.value = null;
        controller.driverData.value = null;
        return true;
      },
      child: Scaffold(
        backgroundColor: ColorStyle.white,
        appBar: AppBarNewSJ().newSJ,
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
              child: Obx(() {
                return Column(
                  children: [
                    NewSJContentPerusahaan(item: item),
                    NewSJContentPengiriman(item: item),
                    NewSJContentProduk(item: item),
                    NewSJContentTransaksi(item: item, ujt),
                    NewSJContentSelectPlate(
                      item: item,
                      ujt: ujt,
                      listFleet: listFleet,
                      selectedPlateNo: selectedPlateNo,
                    ),
                    NewSJContentSelectDriver(
                      primaryStatusTemp: primaryStatusTemp.toInt(),
                      secondaryStatusTemp: secondaryStatusTemp.toInt(),
                      selectedDriverId: selectedDriverId.toInt(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Container(
                        child: TextButton(
                          child: const Text('Buat UJT'),
                          onPressed: () {
                            if (!controller.isButtonLoading.value) {
                              controller.postSJBaru();
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
