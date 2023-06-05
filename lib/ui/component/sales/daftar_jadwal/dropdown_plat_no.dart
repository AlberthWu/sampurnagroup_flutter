// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
// import 'package:get/get.dart';
// import 'package:sgmobile/bussiness_logic/controller/SJ_Controller.dart';
// import 'package:sgmobile/bussiness_logic/model/fleet_model.dart';

// abstract class DropdownPlat extends State<FleetModel>{
//   final controller = Get.find<SJController>();
//   final listPlat = Get.find<SJController>().fleetData.value!;
//   DropDownState(
//                               DropDown(
//                                 bottomSheetTitle: const Text(
//                                   'Plat Nomor',
//                                   style: TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 20.0,
//                                   ),
//                                 ),
//                                 submitButtonChild: const Text(
//                                   'Done',
//                                   style: TextStyle(
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                                 data: listPlat ?? [],
//                                 selectedItems: (List<dynamic> selectedList) {
//                                   List<String> selectedPlatNumbers = [];
//                                   for (var item in selectedList) {
//                                     if (item is FleetModel) {
//                                       selectedPlatNumbers.add(item.plateNo);
//                                     }
//                                   }
//                                   controller.selectedPlateNo.value =
//                                       selectedPlatNumbers.join(", ");
//                                 },
//                                 enableMultipleSelection: false,
//                               ),
//                             );
// }