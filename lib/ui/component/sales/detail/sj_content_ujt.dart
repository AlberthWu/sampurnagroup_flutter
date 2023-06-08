import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/svg.dart';
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
                  // DividerStyles.divider,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset('assets/icon-svg/gallery.svg'),
                          SizedBox(width: 2),
                          const Text(
                            ' Bukti Foto',
                            style: TextStyles.bold16Black,
                          ),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Obx(
                        () => Container(
                          child: Column(
                            children: [
                              for (final imageFile in controller.imageDataList)
                                Container(
                                  color: Colors.amber,
                                  width: Get.width*0.25,
                                  height: Get.height*0.15,
                                  child: Image.file(File(imageFile.path),fit: BoxFit.cover,)),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: Get.width*0.425,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  // primary: Colors.red, // Background color
                                  onPrimary: Colors.black,
                                ),
                                onPressed: () {}, child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.camera, size: 20,),
                                    Text(' Camera'),
                                  ],
                                )),
                          ),
                          Container(
                            width: Get.width*0.425,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  // primary: Colors.red, // Background color
                                  onPrimary: Colors.black,
                                ),
                                onPressed: () {
                                  controller.openGallery();
                                },
                                child: 
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.image, size: 20,),
                                    Text(' Gallery'),
                                  ],
                                )),
                          ),
                        ],
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
                      Row(
                        children: [
                          SvgPicture.asset('assets/icon-svg/gallery.svg'),
                          SizedBox(width: 2),
                          const Text(
                            ' Bukti Foto',
                            style: TextStyles.bold16Black,
                          ),
                        ],
                      ),
                      ///
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: Get.width*0.425,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  // primary: Colors.red, // Background color
                                  onPrimary: Colors.black,
                                ),
                                onPressed: () {}, child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.camera, size: 20,),
                                    Text(' Camera'),
                                  ],
                                )),
                          ),
                          Container(
                            width: Get.width*0.425,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  // primary: Colors.red, // Background color
                                  onPrimary: Colors.black,
                                ),
                                onPressed: () {
                                  controller.openGallery();
                                },
                                child: 
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.image, size: 20,),
                                    Text(' Gallery'),
                                  ],
                                )),
                          ),
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
