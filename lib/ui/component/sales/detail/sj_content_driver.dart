import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sgmobile/bussiness_logic/model/SJ_Model.dart';
import 'package:sgmobile/ui/component/sales/daftar_jadwal/image_logo_handle.dart';
import 'package:sgmobile/utils/bulid_row.dart';
import 'package:sgmobile/utils/colors_style.dart';
import 'package:sgmobile/utils/divider_style.dart';
import 'package:sgmobile/utils/text_style.dart';

class SJDetailContentDriver extends StatelessWidget {
  const SJDetailContentDriver(this.detail, {super.key});
  final DetailSJ detail;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      Row(
          children: [
            SvgPicture.asset('assets/icon-svg/SteeringWheel.svg'),
            SizedBox(width: 2),
            const Text(
              'Info Driver',
              style: TextStyles.bold16Black,
            ),
          ],
        ),
        BuildRow().buildRow(
          'No Kendaraan', detail.data.fleet_id.plateNo
        ),
        Container(
          height: Get.height*0.25,
          width: Get.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            border: Border.all(color: ColorStyle.goldLight)
          ),
          // color: ColorStyle.goldLight,
          child: Padding(
          padding: const EdgeInsets.only(top: 4.0),
          child: (detail.data.primary_status == 1)
              ? Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) => Dialog(
                            child: Container(
                              width: Get.width,
                              height: Get.height * 0.6,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: detail.data.primary_driver!.image_data ==
                                      null
                                  ? Image.asset(
                                      'assets/images/person.png',
                                      fit: BoxFit.cover,
                                    )
                                  : Image.memory(
                                      base64Decode(
                                        detail.data.primary_driver!.image_data!
                                            .substring(detail.data
                                                    .primary_driver!.image_data!
                                                    .indexOf(',') +
                                                1),
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                            ),
                          ),
                        );
                      },
                      child: Container(
                        height: Get.height * 0.2,
                        width: Get.width * 0.4,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          color: ColorStyle.greyVeryLight,
                        ),
                        child: detail.data.primary_driver!.image_data == null
                            ? ClipRRect(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                child: Image.asset('assets/images/person.png'),
                              )
                            : ClipRRect(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                child: Image.memory(
                                  base64Decode(
                                    detail.data.primary_driver!.image_data!
                                        .substring(detail.data.primary_driver!
                                                .image_data!
                                                .indexOf(',') +
                                            1),
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                      ),
                    ),
                    Container(
                      width: Get.width * 0.5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 15.0),
                            child: Column(
                              children: [
                                Text(
                                  detail.data.primary_driver!.name,
                                  style: TextStyles.bold13Black,
                                ),
                                Text(
                                  detail.data.primary_driver!.sex +
                                      " | " +
                                      detail.data.primary_driver!.religion,
                                  style: TextStyles.light13Black,
                                ),
                                Text(
                                  detail.data.primary_driver!.license_type +
                                      " | " +
                                      (detail.data.primary_driver!.license_no ??
                                          'Not-Set'),
                                  style: TextStyles.light13Black,
                                )
                              ],
                            ),
                          ),
                          ImageHandle<DetailSJ>(detail),
                          Text(
                            detail.data.company_id.name,
                            style: TextStyles.light13Black,
                          ),
                          Text(
                            detail.data.primary_driver!.department_id.name +
                                " | " +
                                detail.data.primary_driver!.division_id.name +
                                " | " +
                                detail.data.primary_driver!.occupation_id.name,
                            style: TextStyles.light13Black,
                          )
                        ],
                      ),
                    ),
                  ],
                )
              : Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) => Dialog(
                            child: Container(
                              width: Get.width,
                              height: Get.height * 0.6,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: detail.data.secondary_driver!.image_data ==
                                      null
                                  ? Image.asset(
                                      'assets/images/person.png',
                                      fit: BoxFit.cover,
                                    )
                                  : Image.memory(
                                      base64Decode(
                                        detail
                                            .data.secondary_driver!.image_data!
                                            .substring(
                                          detail.data.secondary_driver!
                                                  .image_data!
                                                  .indexOf(',') +
                                              1,
                                        ),
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                            ),
                          ),
                        );
                      },
                      child: Container(
                        height: Get.height * 0.2,
                        width: Get.width * 0.4,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          color: ColorStyle.greyVeryLight,
                        ),
                        child: detail.data.secondary_driver!.image_data == null
                            ? ClipRRect(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                child: Image.asset('assets/images/person.png'),
                              )
                            : ClipRRect(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                child: Image.memory(
                                  base64Decode(
                                    detail.data.secondary_driver!.image_data!
                                        .substring(
                                      detail.data.secondary_driver!.image_data!
                                              .indexOf(',') +
                                          1,
                                    ),
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                      ),
                    ),
                    Container(
                      width: Get.width * 0.5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 15.0),
                            child: Column(
                              children: [
                                Text(
                                  detail.data.secondary_driver!.name,
                                  style: TextStyles.bold13Black,
                                ),
                                Text(
                                  detail.data.secondary_driver!.sex +
                                      " | " +
                                      detail.data.secondary_driver!.religion,
                                  style: TextStyles.light13Black,
                                ),
                                Text(
                                  detail.data.secondary_driver!.license_type +
                                      " | " +
                                      (detail.data.secondary_driver!.bank_no),
                                  style: TextStyles.light13Black,
                                )
                              ],
                            ),
                          ),
                          ImageHandle<DetailSJ>(detail),
                          Text(
                            detail.data.company_id.name,
                            style: TextStyles.light13Black,
                          ),
                          Text(
                            detail.data.secondary_driver!.department_id.name +
                                " | " +
                                detail.data.secondary_driver!.division_id.name +
                                " | " +
                                detail
                                    .data.secondary_driver!.occupation_id.name,
                            style: TextStyles.light13Black,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
        ),
      
        ),

        ],
    );
  }
}
