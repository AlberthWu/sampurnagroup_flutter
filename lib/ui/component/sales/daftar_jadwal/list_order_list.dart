import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sgmobile/bussiness_logic/controller/SJ_Controller.dart';
import 'package:sgmobile/bussiness_logic/model/schedule_model.dart';
import 'package:sgmobile/ui/component/sales/daftar_jadwal/image_logo_handle.dart';
import 'package:sgmobile/ui/pages/sales/detail_sj.dart';
import 'package:sgmobile/utils/colors_style.dart';
import 'package:sgmobile/utils/text_style.dart';

class ListOrderList extends StatelessWidget {
  const ListOrderList(this.item, {super.key});
  final ListDataSchedule item;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SJController>();
    return Container(
      height: Get.height * 0.35,
      decoration: const BoxDecoration(
          color: ColorStyle.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(6, 20, 6, 6),
        child: ListView.builder(
          itemCount: item.order_list.length,
          itemBuilder: (BuildContext context, int index) {
            var listOrder = item.order_list[index];
            return Padding(
              padding: const EdgeInsets.all(6),
              child: GestureDetector(
                onTap: () async {
                  final itemId = listOrder.id;
                  try {
                    Get.to(() => DetailSJPage(itemId));
                    await controller.getSJDetail(itemId.toInt());
                  } catch (e) {}
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                          color: ColorStyle.greyVeryLight.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 1,
                          offset: Offset(0, 0),
                        ),
                      ],
                      color: ColorStyle.white),
                  width: Get.width,
                  height: Get.height * 0.115,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              listOrder.reference_no +
                                  " - " +
                                  listOrder.plate_no,
                              style: TextStyles.bold13Black,
                            ),
                            Text(
                              listOrder.issue_date,
                              style: TextStyles.light13Black,
                            )
                          ],
                        ),
                        ImageHandle<OrderList>(listOrder),
                        Text(
                          listOrder.coor_name + " | " + listOrder.employee_name,
                          style: TextStyles.bold13Black,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              listOrder.fleet_type_name +
                                  " | " +
                                  listOrder.formation_name +
                                  " | ",
                              style: TextStyles.bold13Black,
                            ),
                            Text(
                              listOrder.status.toUpperCase(),
                              style: (listOrder.status_id! < 3)
                                  ? TextStyles.bold15Gold
                                  : (listOrder.status_id! >= 3)
                                      ? TextStyles.bold15Red
                                      : TextStyles.bold15Black,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
