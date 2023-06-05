import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sgmobile/bussiness_logic/controller/SJ_Controller.dart';
import 'package:sgmobile/bussiness_logic/model/SJ_Model.dart';
import 'package:sgmobile/utils/divider_style.dart';
import 'package:sgmobile/utils/text_style.dart';

class SJDetailContentUJT extends StatelessWidget {
  const SJDetailContentUJT(this.detail, {super.key});
  final DetailSJ detail;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SJController>();
    return Column(
      children: [
        (detail.data.image_data.isEmpty)
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DividerStyles.divider,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(detail.data.id.toString()),
                      const Text(
                        'Informasi UJT',
                        style: TextStyles.bold16Black,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                controller.openGallery();
                              },
                              child: Text('Pilih Foto')),
                          ElevatedButton(
                              onPressed: () {}, child: Text('Ambil Foto')),
                        ],
                      ),
                      Obx(
                        () => Column(
                          children: [
                            for (final imageFile in controller.imageDataList)
                              Image.file(File(imageFile.path)),
                          ],
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          if (controller.imageDataList.isNotEmpty) {
                            controller.postImageList(
                              detail!.data.id.toInt(),
                              controller.imageDataList.toList(),
                            );
                          }
                        },
                        child: Text('Post Gambar'),
                      ),
                    ],
                  ),
                ],
              )
            : Column(
                children: [
                  Text(detail.data.id.toString()),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Informasi UJT",
                        style: TextStyles.bold16Black,
                      ),

                      ///
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                controller.openGallery();
                              },
                              child: Text('Pilih Foto')),
                          ElevatedButton(
                              onPressed: () {}, child: Text('Ambil Foto')),
                        ],
                      ),
                      Obx(
                        () => Column(
                          children: [
                            for (final imageFile in controller.imageDataList)
                              Image.file(File(imageFile.path)),
                          ],
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          if (controller.imageDataList.isNotEmpty) {
                            controller.postImageList(
                              detail.data.id.toInt(),
                              controller.imageDataList.toList(),
                            );
                          }
                        },
                        child: Text('Post Gambar'),
                      ),
                      ///////
                      for (var i in detail.data.image_data)
                        GestureDetector(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) => Dialog(
                                      child: Container(
                                        child: Image.memory(base64Decode(
                                            i.image_data.substring(
                                                i.image_data.indexOf(',') +
                                                    1))),
                                      ),
                                    ));
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Image.memory(base64Decode(i.image_data
                                .substring(i.image_data.indexOf(',') + 1))),
                          ),
                        )
                    ],
                  )
                ],
              ),
      ],
    );
  }
}
