import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sgmobile/bussiness_logic/controller/SJ_Controller.dart';
import 'package:sgmobile/bussiness_logic/model/SJ_Model.dart';
import 'package:sgmobile/ui/component/sales/daftar_jadwal/app_bar_SJ_baru.dart';
import 'package:sgmobile/ui/component/sales/detail/new_content_pelanggan.dart';
import 'package:sgmobile/ui/component/sales/detail/new_content_perusahaan.dart';
import 'package:sgmobile/ui/component/sales/detail/new_content_produk.dart';
import 'package:sgmobile/ui/component/sales/detail/new_content_select_driver.dart';
import 'package:sgmobile/ui/component/sales/detail/new_content_select_plate.dart';
import 'package:sgmobile/ui/component/sales/detail/new_content_transaksi.dart';
import 'package:sgmobile/utils/colors_style.dart';

class DraftSJ extends StatelessWidget {
  const DraftSJ(this.detail, {Key? key}) : super(key: key);
  final DetailSJ detail;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SJController>();
    final listFleet = controller.fleetData.value?.data;
    final ujt = controller.ujtData.value;
    final selectedPlateNo = detail.data.fleet_id.id;
    final primaryStatusTemp = detail.data.primary_status;
    final secondaryStatusTemp = detail.data.secondary_status;
    final selectedDriverId = primaryStatusTemp == 1
        ? detail.data.primary_driver?.id ?? 0
        : detail.data.secondary_driver?.id ?? 0;
    final memo_ids = controller.memo_ids.value;

    return WillPopScope(
      onWillPop: () async {
        controller.selectedPlateNo.value = null;
        controller.fleetData.value = null;
        controller.driverData.value = null;
        controller.onInit();
        return true;
      },
      child: Scaffold(
          backgroundColor: ColorStyle.white,
          appBar: AppBarNewSJ().draftSJ,
          body: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    NewSJContentPerusahaan(item: detail),
                    NewSJContentPelanggan(item: detail),
                    NewSJContentProduk(item: detail),
                    NewSJContentTransaksi(ujt, item: detail),
                    NewSJContentSelectPlate(
                      item: detail,
                      ujt: ujt,
                      listFleet: listFleet,
                      selectedPlateNo: selectedPlateNo,
                    ),
                    NewSJContentSelectDriver(
                      primaryStatusTemp: primaryStatusTemp.toInt(),
                      secondaryStatusTemp: secondaryStatusTemp.toInt(),
                      selectedDriverId: selectedDriverId,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Container(
                        child: TextButton(
                          child: const Text('Ubah Data'),
                          onPressed: () async {
                            if (!controller.isButtonLoading.value) {
                              await controller
                                  .putSJBaru(detail.data.id.toInt());
                              await controller.getStatusUpdate(
                                  detail.data.id.toInt(), 1);
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
