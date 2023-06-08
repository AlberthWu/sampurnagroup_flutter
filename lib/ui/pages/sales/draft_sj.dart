import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sgmobile/bussiness_logic/controller/SJ_Controller.dart';
import 'package:sgmobile/bussiness_logic/model/SJ_Model.dart';
import 'package:sgmobile/ui/component/sales/daftar_jadwal/app_bar_SJ_baru.dart';
import 'package:sgmobile/ui/component/sales/detail/new_content_pengiriman.dart';
import 'package:sgmobile/ui/component/sales/detail/new_content_perusahaan.dart';
import 'package:sgmobile/ui/component/sales/detail/new_content_produk.dart';
import 'package:sgmobile/ui/component/sales/detail/new_content_select_driver.dart';
import 'package:sgmobile/ui/component/sales/detail/new_content_select_plate.dart';
import 'package:sgmobile/ui/component/sales/detail/new_content_transaksi.dart';
import 'package:sgmobile/ui/component/sales/detail/new_content_status.dart';
import 'package:sgmobile/ui/component/sales/detail/new_content_dokumen.dart';
import 'package:sgmobile/ui/component/sales/detail/new_content_quantity.dart';
import 'package:sgmobile/utils/colors_style.dart';

import '../../../utils/divider_style.dart';

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
              Column(
                children: [
                  NewSJContentStatus(item: detail),
                  DividerStyles.divider,
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
                    child: NewSJContentPerusahaan(item: detail),
                  ),
                  DividerStyles.divider,
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
                    child: NewSJContentProduk(item: detail),
                  ),
                  DividerStyles.divider,
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
                    child: NewSJContentPengiriman(item: detail),
                  ),
                  DividerStyles.divider,
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
                    child: NewSJContentSelectPlate(
                      item: detail,
                      ujt: ujt,
                      listFleet: listFleet,
                      selectedPlateNo: selectedPlateNo,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
                    child: NewSJContentSelectDriver(
                      primaryStatusTemp: primaryStatusTemp.toInt(),
                      secondaryStatusTemp: secondaryStatusTemp.toInt(),
                      selectedDriverId: selectedDriverId,
                    ),
                  ),
                  DividerStyles.divider,
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
                    child: NewSJContentTransaksi(ujt, item: detail),
                  ),
                  DividerStyles.divider,
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
                    child: NewSJContentDokumen(ujt, item: detail),
                  ),
                  DividerStyles.divider,
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
                    child: NewSJContentQuantity(ujt, item: detail),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: Get.width * 0.44,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: const Color.fromARGB(
                                  255, 201, 201, 201), // Background color
                              onPrimary: Colors.black,
                            ),
                            onPressed: () {},
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Tolak'),
                              ],
                            )),
                      ),
                      Container(
                        width: Get.width * 0.44,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.red, // Background color
                              onPrimary: Colors.white,
                            ),
                            onPressed: () async {
                              if (!controller.isButtonLoading.value) {
                                await controller
                                    .putSJBaru(detail.data.id.toInt());
                                await controller.getStatusUpdate(
                                    detail.data.id.toInt(), 1);
                              }
                            },
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Terima'),
                              ],
                            )),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.only(top: 8.0),
                  //   child: Container(
                  //     child: TextButton(
                  //       child: const Text('Ubah Data'),
                  //       onPressed: () async {
                  //         if (!controller.isButtonLoading.value) {
                  //           await controller
                  //               .putSJBaru(detail.data.id.toInt());
                  //           await controller.getStatusUpdate(
                  //               detail.data.id.toInt(), 1);
                  //         }
                  //       },
                  //     ),
                  //   ),
                  // ),
                ],
              )
            ],
          )),
    );
  }
}
