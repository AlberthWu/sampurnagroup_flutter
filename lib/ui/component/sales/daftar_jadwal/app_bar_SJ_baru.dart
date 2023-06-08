import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sgmobile/bussiness_logic/controller/SJ_Controller.dart';
import 'package:sgmobile/utils/colors_style.dart';
import 'package:sgmobile/utils/text_style.dart';

class AppBarNewSJ {
  final AppBar newSJ = AppBar(
    leading: BackButton(
      onPressed: () async {
        Get.find<SJController>().fleetData.value = null;
        Get.find<SJController>().selectedPlateNo.value = null;
        Get.find<SJController>().driverData.value = null;
        Get.back();
      },
      color: ColorStyle.greyDark,
    ),
    title: const Text(
      "Surat Jalan Baru",
      style: TextStyles.bold18Grey,
    ),
    backgroundColor: ColorStyle.white,
  );

  final AppBar draftSJ = AppBar(
    leading: BackButton(
      onPressed: () async {
        Get.find<SJController>().onInit();
        Get.find<SJController>().fleetData.value = null;
        Get.find<SJController>().selectedPlateNo.value = null;
        Get.find<SJController>().driverData.value = null;
        Get.back();
      },
      color: ColorStyle.greyDark,
    ),
    title: const Text(
      "Surat Jalan Baru",
      style: TextStyles.bold18Grey,
    ),
    actions: [
      Icon(Icons.save),
    ],
    backgroundColor: ColorStyle.white,
  );
}
