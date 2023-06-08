import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:sgmobile/bussiness_logic/controller/SJ_Controller.dart';
import 'package:sgmobile/bussiness_logic/model/SJ_Model.dart';
import 'package:sgmobile/ui/pages/sales/detail_sj.dart';
import 'package:sgmobile/ui/pages/sales/draft_sj.dart';
import 'package:sgmobile/utils/text_style.dart';

import '../../../../utils/divider_style.dart';

class SJListContent extends StatelessWidget {
  const SJListContent(this.listData, {super.key});
  final List<ListDataSJ> listData;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SJController>();
    final isLoading = controller.isLoading.value;
    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        if (notification is ScrollEndNotification &&
            notification.metrics.extentAfter == 0 &&
            controller.currentPage < controller.listSJData.value!.totalpage) {
          controller.loadMoreData();
          return true;
        }
        return false;
      },
      child: ListView(
        shrinkWrap: true,
        children: [
          for (final item in listData)
            Padding(
              padding: const EdgeInsets.fromLTRB(8,8,8,0),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () async {
                      final itemId = item.id;
                      try {
                        if (item.status_id! <= 1) {
                          await controller.getSJDetail(itemId.toInt());
                          await controller.getFleetDataId(
                              item.fleet_id.plateNo, item.fleet_type_id.id);
                          controller.selectedPlateNo.value =
                              controller.fleetDataId.value!.data.first;
                          await controller.getFleetData(item.fleet_type_id.id);
                          await controller.getUJTData(
                              item.issue_date,
                              item.plant_id.id,
                              item.origin_id.id,
                              item.product_id.id,
                              item.fleet_type_id.id);
                          await controller.getDriverData(item.order_type_id.id,
                              item.fleet_id.plateNo, item.issue_date);
                          final detail = controller.detailData.value!;
                          Get.to(() => DraftSJ(detail));
                        } else {
                          Get.to(() => DetailSJPage(itemId));
                          await controller.getSJDetail(itemId.toInt());
                        }

                        // if (item.status_id! >= 3) {
                        //   await controller.getSJDetail(itemId.toInt());
                        // } else {
                        //   await controller.getSJDetail(itemId.toInt());
                        //   await controller.getFleetDataId(
                        //       item.fleet_id.plateNo, item.fleet_type_id.id);
                        //   controller.selectedPlateNo.value =
                        //       controller.fleetDataId.value!.data.first;
                        //   await controller.getFleetData(item.fleet_type_id.id);
                        //   await controller.getUJTData(
                        //       item.issue_date,
                        //       item.plant_id.id,
                        //       item.origin_id.id,
                        //       item.product_id.id,
                        //       item.fleet_type_id.id);
                        // }
                      } catch (e) {}
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: Get.width * 0.2,
                              height: Get.height * 0.13,
                              decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8))),
                              child: item.employee_id.imageData != null
                                  ? ClipRRect(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(8)),
                                      child: Image.memory(
                                        base64Decode(item.employee_id.imageData!
                                            .substring(item.employee_id.imageData!
                                                    .indexOf(',') +
                                                1)),
                                        fit: BoxFit.cover,
                                      ),
                                    )
                                  : ClipRRect(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(8)),
                                      child: Image.asset(
                                        'assets/images/no_pic.png',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Container(
                                width: Get.width * 0.645,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          item.reference_no.toString(),
                                          style: TextStyles.bold15Black,
                                        ),
                                        Text(
                                          item.issue_date,
                                          style: TextStyles.bold12Black,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          item.fleet_id.plateNo,
                                          style: TextStyles.bold15Black,
                                        ),
                                        Text(
                                          ' | ',
                                          style: TextStyles.light15Black,
                                        ),
                                        Text(
                                          item.fleet_type_id.name,
                                          style: TextStyles.light15Black,
                                        )
                                      ],
                                    ),
                                    Text(
                                      item.employee_id.name,
                                      style: TextStyles.bold15Black,
                                    ),
                                    Text(
                                      item.origin_id.name,
                                      style: TextStyles.light15Black,
                                    ),
                                    Text(
                                      item.plant_id.fullName,
                                      style: TextStyles.light15Black,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          item.status,
                                          style: (item.status_id! < 3)
                                              ? TextStyles.bold15Gold
                                              : (item.status_id! >= 3)
                                                  ? TextStyles.bold15Red
                                                  : TextStyles.bold15Black,
                                        ),
                                        Text(
                                          " | ",
                                          style: TextStyles.light15Black,
                                        ),
                                        Text(
                                          item.schedule_id.urgent == 1
                                              ? "Urgent"
                                              : "Reguler",
                                          style: (item.schedule_id.urgent == 1)
                                              ? TextStyles.bold15Red
                                              : TextStyles.bold15GoldStatus,
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                        
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0,8,0,0),
                    child: DividerStyles.divider2,
                  ),
                ],
              ),
            ),
          if (isLoading)
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Center(
                  child: Text("Loading...", style: TextStyles.bold18Red)),
            ),
        ],
      ),
    );
  }
}
