import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sgmobile/bussiness_logic/controller/SJ_Controller.dart';
import 'package:sgmobile/bussiness_logic/model/schedule_model.dart';
import 'package:sgmobile/ui/component/sales/daftar_jadwal/image_logo_handle.dart';
import 'package:sgmobile/ui/component/sales/daftar_jadwal/list_order_list.dart';
import 'package:sgmobile/ui/pages/sales/detail_sj.dart';
import 'package:sgmobile/ui/pages/sales/new_sj.dart';
import 'package:sgmobile/utils/box_decoration.dart';
import 'package:sgmobile/utils/colors_style.dart';
import 'package:sgmobile/utils/divider_style.dart';
import 'package:sgmobile/utils/text_style.dart';

class ListDaftarJadwal extends StatelessWidget {
  const ListDaftarJadwal(this.listSchedule, this.controller, {super.key});
  final List<ListDataSchedule> listSchedule;
  final SJController controller;

  @override
  Widget build(BuildContext context) {
    final isLoading = controller.isLoading.value;
    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        if (notification is ScrollEndNotification &&
            notification.metrics.extentAfter == 0 &&
            controller.currentPage < controller.listSchedule.value!.totalpage) {
          controller.loadMoreData();
          return true;
        }
        return false;
      },
      child: ListView(
        shrinkWrap: true,
        children: [
          for (final item in listSchedule)
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: Get.height * 0.175,
                  width: Get.width,
                  decoration: BoxDecorationStyles().cardBoxStyle,
                  padding: EdgeInsets.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                item.schedule_no,
                                style: TextStyles.bold13Black,
                              ),
                              Text(
                                item.issue_date,
                                style: TextStyles.light13Black,
                              )
                            ],
                          ),
                          Container(
                            height: Get.height * 0.03,
                            width: Get.width * 0.25,
                            decoration: BoxDecoration(
                                color: item.urgent == 1
                                    ? ColorStyle.redVeryLight
                                    : ColorStyle.goldVeryLight,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                            child: Center(
                              child: Text(
                                item.urgent == 1 ? "Urgent" : "Reguler",
                                style: (item.urgent == 1)
                                    ? TextStyles.bold13Red
                                    : TextStyles.bold13Gold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      DividerStyles.dividerCard,
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.product_id.name,
                            style: TextStyles.bold14Black,
                          ),
                          Text(
                            item.origin_id.name,
                            style: TextStyles.bold13Black,
                          ),
                          Text(
                            item.plant_id.name,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyles.bold13Black,
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              item.fleet_type_id.name.replaceAll('/', '-'),
                              style: TextStyles.bold13Black,
                            ),
                            Row(
                              children: [
                                (item.actual == 0)
                                    ? Container(
                                        height: Get.height * 0.03,
                                        width: Get.width * 0.25,
                                        decoration: const BoxDecoration(
                                            color: ColorStyle.greyPrimary,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5))),
                                        child: Center(
                                            child: Text(
                                          '${item.actual * -1} / ${item.total_do}',
                                          style: TextStyles.bold13White,
                                        )))
                                    : GestureDetector(
                                        onTap: () {
                                          showModalBottomSheet(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return ListOrderList(item);
                                            },
                                          );
                                        },
                                        child: Container(
                                            height: Get.height * 0.03,
                                            width: Get.width * 0.25,
                                            decoration: BoxDecorationStyles()
                                                .boxDecorationButton,
                                            child: Center(
                                                child: Text(
                                              '${item.actual * -1} / ${item.total_do}',
                                              style: TextStyles.bold13White,
                                            ))),
                                      ),
                                SizedBox(
                                  width: 5,
                                ),
                                if (item.balance != 0)
                                  GestureDetector(
                                    onTap: () async {
                                      final id = item.id;
                                      try {
                                        await controller.getFleetData(
                                            item.fleet_type_id.id);
                                        await controller.getUJTData(
                                          item.issue_date,
                                          item.plant_id.id,
                                          item.origin_id.id,
                                          item.product_id.id,
                                          item.fleet_type_id.id,
                                        );
                                        await controller.getDEtailSchedule(id);
                                        Get.to(() => CreateSJPage(id));
                                      } catch (e) {}
                                    },
                                    child: Container(
                                      height: Get.height * 0.03,
                                      width: Get.width * 0.25,
                                      decoration: BoxDecorationStyles()
                                          .boxDecorationButton,
                                      child: const Center(
                                        child: Text(
                                          'Buat SJ',
                                          style: TextStyles.bold13White,
                                        ),
                                      ),
                                    ),
                                  ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )),
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
