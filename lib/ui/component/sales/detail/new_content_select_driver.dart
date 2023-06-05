import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sgmobile/bussiness_logic/controller/SJ_Controller.dart';
import 'package:sgmobile/bussiness_logic/model/driver_model.dart';
import 'package:sgmobile/ui/component/sales/detail/new_content_driver_card.dart';
import 'package:sgmobile/utils/colors_style.dart';
import 'package:sgmobile/utils/no_driver_card.dart';
import 'package:sgmobile/utils/text_style.dart';

class NewSJContentSelectDriver extends StatelessWidget {
  const NewSJContentSelectDriver({
    Key? key,
    required this.selectedDriverId,
    required this.primaryStatusTemp,
    required this.secondaryStatusTemp,
  }) : super(key: key);

  final int? selectedDriverId;
  final int? primaryStatusTemp;
  final int? secondaryStatusTemp;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SJController>();

    return Obx(
      () {
        final driverData = controller.driverData.value?.data;
        return Column(
          children: [
            if (controller.isLoading.value)
              Column(
                children: [
                  Container(
                    width: Get.width * 0.45,
                    height: Get.height * 0.318,
                    child: Center(
                        child: Text("Loading...", style: TextStyles.bold18Red)),
                  )
                ],
              )
            else if (driverData != null)
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (driverData.primary_driver != null)
                          DriverContainer(
                            imageData: driverData.primary_driver!.image_data,
                            name: driverData.primary_driver!.name,
                            religion: driverData.primary_driver!.religion,
                            bankName: driverData.primary_driver!.bank_id.name,
                            bankNo: driverData.primary_driver!.bank_no,
                            licenseType:
                                driverData.primary_driver!.license_type,
                            licenseNo: driverData.primary_driver!.license_no,
                            licenseExpDate:
                                driverData.primary_driver!.license_exp_date,
                            isSelected: controller.primaryDriverSelected.value,
                            onTap: () {
                              print('test');
                              controller.driverStatusChanged(true);
                            },
                          )
                        else
                          NoDriverCard(),
                        if (driverData.secondary_driver != null)
                          DriverContainer(
                            imageData: driverData.secondary_driver!.image_data,
                            name: driverData.secondary_driver!.name,
                            religion: driverData.secondary_driver!.religion,
                            bankName: driverData.secondary_driver!.bank_id.name,
                            bankNo: driverData.secondary_driver!.bank_no,
                            licenseType:
                                driverData.secondary_driver!.license_type,
                            licenseNo: driverData.secondary_driver!.license_no,
                            licenseExpDate:
                                driverData.secondary_driver!.license_exp_date,
                            isSelected: !controller.primaryDriverSelected.value,
                            onTap: () {
                              controller.driverStatusChanged(false);
                            },
                          )
                        else
                          NoDriverCard(),
                      ],
                    ),
                  ],
                ),
              )
            else
              const Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [NoDriverCard(), NoDriverCard()],
                ),
              ),
          ],
        );
      },
    );
  }
}

// class NewSJContentSelectDriver extends StatelessWidget {
//   const NewSJContentSelectDriver({Key? key});

//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.find<SJController>();

//     return Obx(
//       () {
//         final driverData = controller.driverData.value?.data;
//         return Column(
//           children: [
//             if (controller.isLoading.value)
//               Column(
//                 children: [
//                   Container(
//                     width: Get.width * 0.45,
//                     height: Get.height * 0.318,
//                     child: Center(
//                         child: Text("Loading...", style: TextStyles.bold18Red)),
//                   )
//                 ],
//               )
//             else if (driverData != null)
//               Padding(
//                 padding: const EdgeInsets.only(top: 8.0),
//                 child: Column(
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         (driverData.primary_driver != null)
//                             ? Column(
//                                 children: [
//                                   InkWell(
//                                     onTap: () {
//                                       print('test');
//                                       controller.driverStatusChanged(true);
//                                     },
//                                     child: Container(
//                                       width: Get.width * 0.45,
//                                       height: Get.height * 0.318,
//                                       decoration: BoxDecoration(
//                                           boxShadow: [
//                                             BoxShadow(
//                                                 blurRadius: 5,
//                                                 color: controller
//                                                         .primaryDriverSelected
//                                                         .value
//                                                     ? ColorStyle.goldLight
//                                                     : Colors.transparent)
//                                           ],
//                                           borderRadius: BorderRadius.all(
//                                               Radius.circular(10)),
//                                           border: Border.all(
//                                               color: controller
//                                                       .primaryDriverSelected
//                                                       .value
//                                                   ? ColorStyle.goldPrimary
//                                                   : ColorStyle.greyLight),
//                                           color: ColorStyle.white),
//                                       child: Padding(
//                                         padding: const EdgeInsets.all(6.0),
//                                         child: Column(
//                                           children: [
//                                             Container(
//                                               width: Get.width * 0.43,
//                                               height: Get.height * 0.22,
//                                               decoration: const BoxDecoration(
//                                                   borderRadius:
//                                                       BorderRadius.all(
//                                                           Radius.circular(8))),
//                                               child: driverData.primary_driver!
//                                                           .image_data !=
//                                                       null
//                                                   ? ClipRRect(
//                                                       borderRadius:
//                                                           BorderRadius.all(
//                                                               Radius.circular(
//                                                                   8)),
//                                                       child: Image.memory(
//                                                         base64Decode(driverData
//                                                             .primary_driver!
//                                                             .image_data!
//                                                             .substring(driverData
//                                                                     .primary_driver!
//                                                                     .image_data!
//                                                                     .indexOf(
//                                                                         ',') +
//                                                                 1)),
//                                                         fit: BoxFit.cover,
//                                                       ),
//                                                     )
//                                                   : ClipRRect(
//                                                       borderRadius:
//                                                           const BorderRadius
//                                                                   .all(
//                                                               Radius.circular(
//                                                                   8)),
//                                                       child: Image.asset(
//                                                         'assets/images/person.png',
//                                                         fit: BoxFit.cover,
//                                                       ),
//                                                     ),
//                                             ),
//                                             Text(
//                                               driverData.primary_driver?.name
//                                                       .toUpperCase() ??
//                                                   "",
//                                               style: TextStyles.bold13Black,
//                                             ),
//                                             Text(
//                                               driverData
//                                                       .primary_driver?.religion
//                                                       .toUpperCase() ??
//                                                   "",
//                                               style: TextStyles.light11Black,
//                                             ),
//                                             Text(
//                                               (driverData.primary_driver
//                                                           ?.bank_id.name
//                                                           .toUpperCase() ??
//                                                       "BANK") +
//                                                   " | " +
//                                                   (driverData
//                                                       .primary_driver!.bank_no),
//                                               style: TextStyles.light11Black,
//                                             ),
//                                             Text(
//                                               (driverData.primary_driver!
//                                                       .license_type) +
//                                                   " | " +
//                                                   (driverData.primary_driver!
//                                                           .license_no ??
//                                                       "-"),
//                                               style: TextStyles.light11Black,
//                                             ),
//                                             Text(
//                                               driverData.primary_driver!
//                                                       .license_exp_date ??
//                                                   "-",
//                                               style: TextStyles.light11Black,
//                                             )
//                                           ],
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               )
//                             : Container(
//                                 width: Get.width * 0.45,
//                                 height: Get.height * 0.318,
//                                 decoration: BoxDecoration(
//                                     borderRadius:
//                                         BorderRadius.all(Radius.circular(10)),
//                                     border:
//                                         Border.all(color: ColorStyle.greyLight),
//                                     color: ColorStyle.white),
//                                 child: const Padding(
//                                     padding: const EdgeInsets.all(6.0),
//                                     child: Center(
//                                       child: Text(
//                                         'No Driver',
//                                         style: TextStyles.bold13Black,
//                                       ),
//                                     )),
//                               ),
//                         (driverData.secondary_driver != null)
//                             ? InkWell(
//                                 onTap: () {
//                                   controller.driverStatusChanged(false);
//                                 },
//                                 child: Container(
//                                   width: Get.width * 0.45,
//                                   height: Get.height * 0.318,
//                                   decoration: BoxDecoration(
//                                       boxShadow: [
//                                         BoxShadow(
//                                             blurRadius: 5,
//                                             color: controller
//                                                     .primaryDriverSelected.value
//                                                 ? Colors.transparent
//                                                 : ColorStyle.goldLight)
//                                       ],
//                                       borderRadius:
//                                           BorderRadius.all(Radius.circular(10)),
//                                       border: Border.all(
//                                           color: controller
//                                                   .primaryDriverSelected.value
//                                               ? ColorStyle.greyLight
//                                               : ColorStyle.goldPrimary),
//                                       color: ColorStyle.white),
//                                   child: Padding(
//                                     padding: const EdgeInsets.all(6.0),
//                                     child: Column(
//                                       children: [
//                                         Container(
//                                           width: Get.width * 0.43,
//                                           height: Get.height * 0.22,
//                                           decoration: const BoxDecoration(
//                                               borderRadius: BorderRadius.all(
//                                                   Radius.circular(8))),
//                                           child: driverData.secondary_driver
//                                                       ?.image_data !=
//                                                   null
//                                               ? ClipRRect(
//                                                   borderRadius:
//                                                       BorderRadius.all(
//                                                           Radius.circular(8)),
//                                                   child: Image.memory(
//                                                     base64Decode(driverData
//                                                         .secondary_driver!
//                                                         .image_data!
//                                                         .substring(driverData
//                                                                 .secondary_driver!
//                                                                 .image_data!
//                                                                 .indexOf(',') +
//                                                             1)),
//                                                     fit: BoxFit.cover,
//                                                   ),
//                                                 )
//                                               : ClipRRect(
//                                                   borderRadius:
//                                                       const BorderRadius.all(
//                                                           Radius.circular(8)),
//                                                   child: Image.asset(
//                                                     'assets/images/person.png',
//                                                     fit: BoxFit.cover,
//                                                   ),
//                                                 ),
//                                         ),
//                                         Text(
//                                           driverData.secondary_driver?.name
//                                                   .toUpperCase() ??
//                                               "",
//                                           style: TextStyles.bold13Black,
//                                         ),
//                                         Text(
//                                           driverData.secondary_driver?.religion
//                                                   .toUpperCase() ??
//                                               "",
//                                           style: TextStyles.light11Black,
//                                         ),
//                                         Text(
//                                           (driverData.secondary_driver?.bank_id
//                                                       .name
//                                                       .toUpperCase() ??
//                                                   "BANK") +
//                                               " | " +
//                                               (driverData
//                                                   .secondary_driver!.bank_no),
//                                           style: TextStyles.light11Black,
//                                         ),
//                                         Text(
//                                           (driverData.secondary_driver!
//                                                   .license_type) +
//                                               " | " +
//                                               (driverData.secondary_driver!
//                                                       .license_no ??
//                                                   "-"),
//                                           style: TextStyles.light11Black,
//                                         ),
//                                         Text(
//                                           driverData.secondary_driver!
//                                                   .license_exp_date ??
//                                               "-",
//                                           style: TextStyles.light11Black,
//                                         )
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                               )
//                             : Container(
//                                 width: Get.width * 0.45,
//                                 height: Get.height * 0.318,
//                                 decoration: BoxDecoration(
//                                     borderRadius:
//                                         BorderRadius.all(Radius.circular(10)),
//                                     border:
//                                         Border.all(color: ColorStyle.greyLight),
//                                     color: ColorStyle.white),
//                                 child: Padding(
//                                     padding: const EdgeInsets.all(6.0),
//                                     child: Center(
//                                       child: Text(
//                                         'No Driver',
//                                         style: TextStyles.bold13Black,
//                                       ),
//                                     )),
//                               ),
//                       ],
//                     ),
//                   ],
//                 ),
//               )
//             else
//               Padding(
//                 padding: const EdgeInsets.only(top: 8.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Container(
//                       width: Get.width * 0.45,
//                       height: Get.height * 0.318,
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.all(Radius.circular(10)),
//                           border: Border.all(color: ColorStyle.greyLight),
//                           color: ColorStyle.white),
//                       child: const Padding(
//                           padding: const EdgeInsets.all(6.0),
//                           child: Center(
//                             child: Text(
//                               'No Driver',
//                               style: TextStyles.bold13Black,
//                             ),
//                           )),
//                     ),
//                     Container(
//                       width: Get.width * 0.45,
//                       height: Get.height * 0.318,
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.all(Radius.circular(10)),
//                           border: Border.all(color: ColorStyle.greyLight),
//                           color: ColorStyle.white),
//                       child: const Padding(
//                           padding: const EdgeInsets.all(6.0),
//                           child: Center(
//                             child: Text(
//                               'No Driver',
//                               style: TextStyles.bold13Black,
//                             ),
//                           )),
//                     ),
//                   ],
//                 ),
//               ),
//             Padding(
//               padding: const EdgeInsets.only(top: 8.0),
//               child: Container(
//                 child: TextButton(
//                     child: Text('Buat UJT'),
//                     onPressed: () {
//                       if (controller.isButtonLoading == false) {
//                         controller.postSJBaru();
//                       }
//                     }),
//               ),
//             )
//           ],
//         );
//       },
//     );
//   }
// }
