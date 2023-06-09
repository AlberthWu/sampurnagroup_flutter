import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sgmobile/bussiness_logic/controller/SJ_Controller.dart';
import 'package:sgmobile/bussiness_logic/model/schedule_model.dart';
import 'package:sgmobile/ui/component/sales/daftar_jadwal/image_logo_handle.dart';
import 'package:sgmobile/ui/pages/sales/detail_sj.dart';
import 'package:sgmobile/utils/colors_style.dart';
import 'package:sgmobile/utils/text_style.dart';

import '../../../../utils/bulid_row.dart';
import '../../../../utils/divider_style.dart';

class ListOrderList extends StatelessWidget {
  const ListOrderList(this.item, {super.key});
  final ListDataSchedule item;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SJController>();
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
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
              padding: const EdgeInsets.all(6.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            item.schedule_no,
                            style: TextStyles.bold14Black,
                          ),
                          Text(
                            item.issue_date,
                            style: TextStyles.light13Black,
                          )
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        '${item.actual * -1} / ${item.total_do}',
                        style: TextStyles.bold13Black,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        (item.order_list.isNotEmpty)
            ? Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(8),
                        bottomRight: Radius.circular(8),
                      ),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromARGB(35, 14, 13, 13),
                            offset: Offset(0, 0),
                            blurRadius: 9,
                            spreadRadius: 2,
                            blurStyle: BlurStyle.normal)
                      ]),
                  child: Column(
                    children: [
                      for (var item in item.order_list)
                        Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    item.employee_name,
                                    style: TextStyles.bold15Black,
                                  ),
                                  Text(
                                    item.reference_no,
                                    style: TextStyles.light13Black,
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 6,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 1, bottom: 4),
                                    child: Text(
                                      item.company_name,
                                      style: TextStyles.bold13Black,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    item.coor_name,
                                    style: TextStyles.bold13Black,
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    item.formation_grup_name,
                                    style: TextStyles.bold13Black,
                                  ),
                                  Text(' | '),
                                  Text(
                                    item.fleet_type_name,
                                    style: TextStyles.bold13Black,
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    item.fleet_type_name,
                                    style: TextStyles.light13Black,
                                  ),
                                ],
                              ),
                              DividerStyles.divider2,
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
              )
            : Container()
      ],
    );
    // Padding(
    //   padding: const EdgeInsets.all(8.0),
    //   child: Container(
    //     height: Get.height,
    //     decoration: const BoxDecoration(
    //         color: ColorStyle.white,
    //         borderRadius: BorderRadius.only(
    //             topLeft: Radius.circular(20), topRight: Radius.circular(20))),
    //     child: ListView.builder(
    //       itemCount: item.order_list.length,
    //       itemBuilder: (BuildContext context, int index) {
    //         var listOrder = item.order_list[index];
    //         return Container(
    //           decoration: BoxDecoration(
    //             color: ColorStyle.white,
    //             borderRadius: BorderRadius.all(Radius.circular(10)),
    //             boxShadow: [
    //               BoxShadow(
    //                 color: ColorStyle.greyVeryLight.withOpacity(0.5),
    //                 spreadRadius: 2,
    //                 blurRadius: 1,
    //                 offset: Offset(0, 0),
    //               ),
    //             ],
    //           ),
    //           child: Padding(
    //             padding: const EdgeInsets.all(6),
    //             child: GestureDetector(
    //               onTap: () async {
    //                 final itemId = listOrder.id;
    //                 try {
    //                   Get.to(() => DetailSJPage(itemId));
    //                   await controller.getSJDetail(itemId.toInt());
    //                 } catch (e) {}
    //               },
    //               child: Container(
    //                 decoration: BoxDecoration(color: ColorStyle.white),
    //                 width: Get.width,
    //                 height: Get.height * 0.15,
    //                 child: Padding(
    //                   padding: const EdgeInsets.all(8.0),
    //                   child: Column(
    //                     children: [
    //                       Row(
    //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                         children: [
    //                           Text(
    //                             listOrder.employee_name,
    //                             style: TextStyles.bold13Black,
    //                           ),
    //                           Text(
    //                             listOrder.reference_no,
    //                             style: TextStyles.light13Black,
    //                           )
    //                         ],
    //                       ),
    //                       SizedBox(
    //                         height: 8,
    //                       ),
    //                       Row(
    //                         mainAxisAlignment: MainAxisAlignment.start,
    //                         children: [
    //                           Padding(
    //                             padding:
    //                                 const EdgeInsets.only(top: 3, bottom: 4),
    //                             child: Text(
    //                               listOrder.company_name,
    //                               style: TextStyles.bold13Black,
    //                             ),
    //                           ),
    //                         ],
    //                       ),
    //                       Row(
    //                         mainAxisAlignment: MainAxisAlignment.start,
    //                         children: [
    //                           Text(
    //                             listOrder.coor_name,
    //                             style: TextStyles.bold13Black,
    //                           ),
    //                         ],
    //                       ),
    //                       Row(
    //                         mainAxisAlignment: MainAxisAlignment.start,
    //                         children: [
    //                           Text(
    //                             listOrder.formation_grup_name,
    //                             style: TextStyles.bold13Black,
    //                           ),
    //                           Text(' | '),
    //                           Text(
    //                             listOrder.fleet_type_name,
    //                             style: TextStyles.bold13Black,
    //                           ),
    //                         ],
    //                       ),
    //                       Row(
    //                         mainAxisAlignment: MainAxisAlignment.start,
    //                         children: [
    //                           Text(
    //                             listOrder.fleet_type_name,
    //                             style: TextStyles.light13Black,
    //                           ),
    //                         ],
    //                       )
    //                     ],
    //                   ),
    //                 ),
    //               ),
    //             ),
    //           ),
    //         );
    //       },
    //     ),
    //   ),
    // );
  }
}
