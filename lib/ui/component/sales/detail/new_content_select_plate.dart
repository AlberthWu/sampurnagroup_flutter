import 'dart:convert';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sgmobile/bussiness_logic/controller/SJ_Controller.dart';
import 'package:sgmobile/bussiness_logic/model/fleet_model.dart';
import 'package:sgmobile/bussiness_logic/model/schedule_detail_model.dart';
import 'package:sgmobile/bussiness_logic/model/ujt_model.dart';
import 'package:sgmobile/utils/colors_style.dart';
import 'package:sgmobile/utils/text_style.dart';

class NewSJContentSelectPlate extends StatelessWidget {
  const NewSJContentSelectPlate({
    Key? key,
    required this.item,
    required this.ujt,
    required this.listFleet,
    required this.selectedPlateNo,
  }) : super(key: key);

  final dynamic item;
  final UJTModel? ujt;
  final List<DataFleet>? listFleet;
  final dynamic selectedPlateNo;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SJController>();
    final listFleet =
        controller.filteredFleetData.value ?? controller.fleetData.value?.data;
    final driverData = controller.driverData.value?.data;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 4, bottom: 4),
          child: DropdownSearch<DataFleet>(
            mode: Mode.BOTTOM_SHEET,
            items: listFleet,
            itemAsString: (fleet) => fleet!.plate_no,
            onChanged: (selectedFleet) async {
              controller.selectedPlateNo.value = selectedFleet!;
              await controller.getDriverData(
                item?.data.order_type_id.id ?? 0,
                selectedFleet?.plate_no ?? "",
                item?.data.issue_date ?? "",
              );
              print(controller.selectedPlateNo.value!.id);
            },
            selectedItem: controller.selectedPlateNo.value,
            dropdownSearchBaseStyle: TextStyles.bold13Black,
            dropdownSearchDecoration: const InputDecoration(
              hintText: "Cari Nomor Plat",
              counterStyle: TextStyles.bold13Grey,
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.symmetric(horizontal: 8),
            ),
            showSearchBox: true,
            showClearButton: true,
          ),
        ),
      ],
    );
  }
}
