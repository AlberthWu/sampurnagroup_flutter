import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sgmobile/bussiness_logic/controller/SJ_Controller.dart';
import 'package:sgmobile/bussiness_logic/model/SJ_Model.dart';
import 'package:sgmobile/ui/component/sales/daftar_jadwal/image_logo_handle.dart';
import 'package:sgmobile/utils/bulid_row.dart';
import 'package:sgmobile/utils/colors_style.dart';
import 'package:sgmobile/utils/divider_style.dart';
import 'package:sgmobile/utils/text_style.dart';

class SJDetailContentStatus extends StatelessWidget {
  const SJDetailContentStatus(this.detail, {super.key});
  final DetailSJ detail;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SJController>();
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: Get.width * 0.02,
                height: Get.height * 0.03,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(5),
                        bottomRight: Radius.circular(5)),
                    color: detail.data.status_id! <= 1
                        ? Colors.red
                        : detail.data.status_id == 2
                            ? Colors.green
                            : Colors.amber),
              ),
              SizedBox(width: 8),
              Text(
                detail.data.status,
                style: TextStyles.bold16Black,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Container(
                width: Get.width * 0.15,
                height: Get.height * 0.02,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(3)),
                    color: detail.data.schedule_id.urgent == 1
                        ? ColorStyle.redLight
                        : ColorStyle.goldLightStatus),
                child: Center(
                  child: Text(
                    detail.data.schedule_id.urgent == 1 ? 'Urgent' : 'Reguler',
                    style: detail.data.schedule_id.urgent == 1
                        ? TextStyles.bold23Grey
                        : TextStyles.bold13Gold,
                  ),
                )),
          )
        ],
      ),
    );
  }
}
