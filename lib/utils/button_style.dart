import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sgmobile/bussiness_logic/controller/SJ_Controller.dart';
import 'package:sgmobile/utils/colors_style.dart';

class ButtonStyles {
  static BackButton backButtons = BackButton(
    onPressed: () {
      Get.back();
    },
    color: ColorStyle.greyDark,
  );

  static BackButton backButtons2 = BackButton(
    onPressed: () async {
      Get.back();
      Get.find<SJController>().selectedPlateNo.value == "";
    },
    color: ColorStyle.greyDark,
  );
}
