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
              ' Info Driver',
              style: TextStyles.bold16Black,
            ),
          ],
        ),
        SizedBox(
          height: 8,
        ),
        BuildRow().buildRowDriver(
          'No Kendaraan', detail.data.fleet_id.plateNo
        ),
        SizedBox(
          height: 9,
        ),
        Stack(
          children: [
            Container(
              height: Get.height*0.215,
              width: Get.width*0.9,
              // color: ColorStyle.goldLight,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Color.fromARGB(255, 219, 171, 87),
                boxShadow: [
                  BoxShadow(
                      color: Color.fromARGB(35, 14, 13, 13),
                      offset: Offset(0, 0),
                      blurRadius: 9,
                      spreadRadius: 2,)
                ]
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Container(
                // height: Get.height*0.25,
                width: Get.width*0.87,
                // color: ColorStyle.white,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topRight: Radius.circular(10), bottomRight: Radius.circular(10)),
                  // border: Border.all(color: const Color.fromARGB(255, 255, 255, 255)),
                  color: ColorStyle.white,
                  
                ),
                child: Padding(
                padding: const EdgeInsets.only(top: 4.0, left: 10),
                child: (detail.data.primary_status == 1)
                    ? Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Supir Utama', style: TextStyles.bold15Black
                        ),
                        SizedBox(height: 4),
                        Row(
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
                                                'assets/images/no_pic.png',
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
                                  height: Get.height * 0.15,
                                  width: Get.width * 0.25,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(8)),
                                    color: ColorStyle.greyVeryLight,
                                  ),
                                  child: detail.data.primary_driver!.image_data == null
                                      ? ClipRRect(
                                          borderRadius:
                                              BorderRadius.all(Radius.circular(8)),
                                          child: Image.asset('assets/images/no_pic.png'),
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 15.0, left: 10),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            detail.data.primary_driver!.name,
                                            style: TextStyles.bold13Black,
                                          ),
                                          Text(
                                            detail.data.company_id.name,
                                            style: TextStyles.bold13Black,
                                          ),
                                          Text(
                                            detail.data.primary_driver!.phone,
                                            style: TextStyles.light13Black,
                                          ),
                                          Text(
                                            'No Rek. ${detail.data.primary_driver!.bank_no}',
                                            style: TextStyles.light13Black,
                                          ),
                                          Text(
                                            'SIM ' +  detail.data.primary_driver!.license_type,
                                            style: TextStyles.light13Black,
                                          ),
                                          Text(
                                            detail.data.primary_driver!.license_no.toString(),
                                            style: TextStyles.light13Black,
                                          ),
                                          Text(
                                            detail.data.primary_driver!.license_exp_date==null ? 'Exp. ': 'Exp. ' + detail.data.primary_driver!.license_exp_date.toString(),
                                            style: TextStyles.light13Black,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
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
                ),
              ),
            // Positioned(
            //   left: 7.5,
            //   child: Container(
            //     height: Get.height*0.25,
            //     width: Get.width*0.87,
            //     // color: ColorStyle.white,
            //     decoration: BoxDecoration(
            //       borderRadius: BorderRadius.all(Radius.circular(10)),
            //       border: Border.all(color: const Color.fromARGB(255, 255, 255, 255)),
            //       color: ColorStyle.white,
                  
            //     ),
            //     child: Padding(
            //     padding: const EdgeInsets.only(top: 4.0, left: 10),
            //     child: (detail.data.primary_status == 1)
            //         ? Column(
            //           mainAxisAlignment: MainAxisAlignment.start,
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           children: [
            //             Text(
            //               'Supir Utama', style: TextStyles.bold15Black
            //             ),
            //             Row(
            //                 children: [
            //                   GestureDetector(
            //                     onTap: () {
            //                       showDialog(
            //                         context: context,
            //                         builder: (context) => Dialog(
            //                           child: Container(
            //                             width: Get.width,
            //                             height: Get.height * 0.6,
            //                             decoration: BoxDecoration(
            //                               borderRadius: BorderRadius.circular(8),
            //                             ),
            //                             child: detail.data.primary_driver!.image_data ==
            //                                     null
            //                                 ? Image.asset(
            //                                     'assets/images/person.png',
            //                                     fit: BoxFit.cover,
            //                                   )
            //                                 : Image.memory(
            //                                     base64Decode(
            //                                       detail.data.primary_driver!.image_data!
            //                                           .substring(detail.data
            //                                                   .primary_driver!.image_data!
            //                                                   .indexOf(',') +
            //                                               1),
            //                                     ),
            //                                     fit: BoxFit.cover,
            //                                   ),
            //                           ),
            //                         ),
            //                       );
            //                     },
            //                     child: Container(
            //                       height: Get.height * 0.15,
            //                       width: Get.width * 0.25,
            //                       decoration: BoxDecoration(
            //                         borderRadius: BorderRadius.all(Radius.circular(8)),
            //                         color: ColorStyle.greyVeryLight,
            //                       ),
            //                       child: detail.data.primary_driver!.image_data == null
            //                           ? ClipRRect(
            //                               borderRadius:
            //                                   BorderRadius.all(Radius.circular(8)),
            //                               child: Image.asset('assets/images/no_pic.png'),
            //                             )
            //                           : ClipRRect(
            //                               borderRadius:
            //                                   BorderRadius.all(Radius.circular(8)),
            //                               child: Image.memory(
            //                                 base64Decode(
            //                                   detail.data.primary_driver!.image_data!
            //                                       .substring(detail.data.primary_driver!
            //                                               .image_data!
            //                                               .indexOf(',') +
            //                                           1),
            //                                 ),
            //                                 fit: BoxFit.cover,
            //                               ),
            //                             ),
            //                     ),
            //                   ),
            //                   Container(
            //                     width: Get.width * 0.5,
            //                     child: Column(
            //                       crossAxisAlignment: CrossAxisAlignment.start,
            //                       mainAxisAlignment: MainAxisAlignment.start,
            //                       children: [
            //                         Padding(
            //                           padding: const EdgeInsets.only(bottom: 15.0, left: 10),
            //                           child: Column(
            //                             mainAxisAlignment: MainAxisAlignment.start,
            //                             crossAxisAlignment: CrossAxisAlignment.start,
            //                             children: [
            //                               Text(
            //                                 detail.data.primary_driver!.name,
            //                                 style: TextStyles.bold13Black,
            //                               ),
            //                               Text(
            //                                 detail.data.company_id.name,
            //                                 style: TextStyles.bold13Black,
            //                               ),
            //                               Text(
            //                                 detail.data.primary_driver!.phone,
            //                                 style: TextStyles.light13Black,
            //                               ),
            //                               Text(
            //                                 'No Rek. ${detail.data.primary_driver!.bank_no}',
            //                                 style: TextStyles.light13Black,
            //                               ),
            //                               Text(
            //                                 'SIM ' +  detail.data.primary_driver!.license_type,
            //                                 style: TextStyles.light13Black,
            //                               ),
            //                               Text(
            //                                 detail.data.primary_driver!.license_no.toString(),
            //                                 style: TextStyles.light13Black,
            //                               ),
            //                               Text(
            //                                 detail.data.primary_driver!.license_exp_date==null ? 'Exp. ': 'Exp. ' + detail.data.primary_driver!.license_exp_date.toString(),
            //                                 style: TextStyles.light13Black,
            //                               ),
            //                             ],
            //                           ),
            //                         ),
            //                       ],
            //                     ),
            //                   ),
            //                 ],
            //               ),
            //           ],
            //         )
            //         : Row(
            //             children: [
            //               GestureDetector(
            //                 onTap: () {
            //                   showDialog(
            //                     context: context,
            //                     builder: (context) => Dialog(
            //                       child: Container(
            //                         width: Get.width,
            //                         height: Get.height * 0.6,
            //                         decoration: BoxDecoration(
            //                           borderRadius: BorderRadius.circular(8),
            //                         ),
            //                         child: detail.data.secondary_driver!.image_data ==
            //                                 null
            //                             ? Image.asset(
            //                                 'assets/images/person.png',
            //                                 fit: BoxFit.cover,
            //                               )
            //                             : Image.memory(
            //                                 base64Decode(
            //                                   detail
            //                                       .data.secondary_driver!.image_data!
            //                                       .substring(
            //                                     detail.data.secondary_driver!
            //                                             .image_data!
            //                                             .indexOf(',') +
            //                                         1,
            //                                   ),
            //                                 ),
            //                                 fit: BoxFit.cover,
            //                               ),
            //                       ),
            //                     ),
            //                   );
            //                 },
            //                 child: Container(
            //                   height: Get.height * 0.2,
            //                   width: Get.width * 0.4,
            //                   decoration: BoxDecoration(
            //                     borderRadius: BorderRadius.all(Radius.circular(8)),
            //                     color: ColorStyle.greyVeryLight,
            //                   ),
            //                   child: detail.data.secondary_driver!.image_data == null
            //                       ? ClipRRect(
            //                           borderRadius:
            //                               BorderRadius.all(Radius.circular(8)),
            //                           child: Image.asset('assets/images/person.png'),
            //                         )
            //                       : ClipRRect(
            //                           borderRadius:
            //                               BorderRadius.all(Radius.circular(8)),
            //                           child: Image.memory(
            //                             base64Decode(
            //                               detail.data.secondary_driver!.image_data!
            //                                   .substring(
            //                                 detail.data.secondary_driver!.image_data!
            //                                         .indexOf(',') +
            //                                     1,
            //                               ),
            //                             ),
            //                             fit: BoxFit.cover,
            //                           ),
            //                         ),
            //                 ),
            //               ),
            //               Container(
            //                 width: Get.width * 0.5,
            //                 child: Column(
            //                   crossAxisAlignment: CrossAxisAlignment.center,
            //                   mainAxisAlignment: MainAxisAlignment.center,
            //                   children: [
            //                     Padding(
            //                       padding: const EdgeInsets.only(bottom: 15.0),
            //                       child: Column(
            //                         children: [
            //                           Text(
            //                             detail.data.secondary_driver!.name,
            //                             style: TextStyles.bold13Black,
            //                           ),
            //                           Text(
            //                             detail.data.secondary_driver!.sex +
            //                                 " | " +
            //                                 detail.data.secondary_driver!.religion,
            //                             style: TextStyles.light13Black,
            //                           ),
            //                           Text(
            //                             detail.data.secondary_driver!.license_type +
            //                                 " | " +
            //                                 (detail.data.secondary_driver!.bank_no),
            //                             style: TextStyles.light13Black,
            //                           )
            //                         ],
            //                       ),
            //                     ),
            //                     ImageHandle<DetailSJ>(detail),
            //                     Text(
            //                       detail.data.company_id.name,
            //                       style: TextStyles.light13Black,
            //                     ),
            //                     Text(
            //                       detail.data.secondary_driver!.department_id.name +
            //                           " | " +
            //                           detail.data.secondary_driver!.division_id.name +
            //                           " | " +
            //                           detail
            //                               .data.secondary_driver!.occupation_id.name,
            //                       style: TextStyles.light13Black,
            //                     )
            //                   ],
            //                 ),
            //               ),
            //             ],
            //           ),
            //           ),
                  
            //   ),
            // ),
          ],
        ),

        ],
    );
  }
}
