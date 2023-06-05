import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_holo_date_picker_widget/date_picker.dart';
import 'package:flutter_holo_date_picker_widget/i18n/date_picker_i18n.dart';
import 'package:get/get.dart';
import 'package:sgmobile/bussiness_logic/controller/SJ_Controller.dart';
import 'package:sgmobile/utils/colors_style.dart';
import 'package:sgmobile/utils/text.dart';
import 'package:sgmobile/utils/text_style.dart';

class DatePickerScroll extends StatelessWidget {
  const DatePickerScroll({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SJController>();
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(TextInfo.suratJalan, style: TextStyles.bold20White),
              const Text(TextInfo.suratJalan2, style: TextStyles.light18White),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsetsDirectional.all(10)),
                    onPressed: () async {
                      final date = await DatePicker.showSimpleDatePicker(
                          context,
                          initialDate: controller.selectedDate.value,
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2100),
                          dateFormat: "dd-MMMM-yyyy",
                          locale: DateTimePickerLocale.en_us,
                          looping: true,
                          titleText: 'Pilih Tanggal');
                      if (date != null) {
                        controller.selectedDate.value = date;
                        controller.isButtonLoading.value = true;
                        controller.currentPage = 1;
                        await controller.ScheduleController();
                        await controller.SJListController();
                        controller.isButtonLoading.value = false;
                      }
                    },
                    child: Row(
                      children: [
                        const Icon(
                          Icons.calendar_today_outlined,
                          size: 17,
                          color: ColorStyle.redPrimary,
                        ),
                        Obx(
                          () => Text(
                              ' Tanggal: ${controller.selectedDate.value.day}-${controller.selectedDate.value.month}-${controller.selectedDate.value.year}',
                              style: TextStyles.bold13Red),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  // ElevatedButton(
                  //   onPressed: () async {
                  //     controller.isButtonLoading.value = true;
                  //     controller.currentPage = 1;
                  //     await controller.SJListController();
                  //     controller.isButtonLoading.value = false;
                  //   },
                  //   child: Obx(() {
                  //     if (controller.isButtonLoading.value) {
                  //       return Row(
                  //         children: const [
                  //           SizedBox(
                  //             height: 16,
                  //             width: 16,
                  //             child: CircularProgressIndicator(
                  //               color: ColorStyle.goldPrimary,
                  //               strokeWidth: 2,
                  //             ),
                  //           ),
                  //           SizedBox(width: 8),
                  //           Text("Load..", style: TextStyles.bold13Red),
                  //         ],
                  //       );
                  //     } else {
                  //       return Row(
                  //         children: const [
                  //           Icon(
                  //             Icons.search,
                  //             size: 17,
                  //             color: ColorStyle.redPrimary,
                  //           ),
                  //           Text("Cari", style: TextStyles.bold13Red),
                  //         ],
                  //       );
                  //     }
                  //   }),
                  // )
                ],
              ),
            ],
          ),
          Image.asset(
            "assets/images/note.png",
            scale: 16,
          )
        ],
      ),
    );
  }
}
