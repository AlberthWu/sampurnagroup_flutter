import 'dart:convert';
import 'dart:io';

import 'package:d_input/d_input.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sgmobile/bussiness_logic/controller/SJ_Controller.dart';
import 'package:sgmobile/bussiness_logic/model/SJ_Model.dart';
import 'package:sgmobile/utils/divider_style.dart';
import 'package:sgmobile/utils/text_style.dart';
import 'package:text_form_field_wrapper/text_form_field_wrapper.dart';

import '../../../../utils/bulid_row.dart';
import '../../../../utils/colors_style.dart';

class SJDetailContentQuantity extends StatelessWidget {
  const SJDetailContentQuantity(this.detail, {super.key});
  final DetailSJ detail;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SJController>();
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SvgPicture.asset('assets/icon-svg/box.svg'),
            SizedBox(width: 2),
            Text(
              " Quantity",
              style: TextStyles.bold16Black,
            ),
          ],
        ),
        SizedBox(
          height: 8,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: Get.width * 0.44,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(
                      'Volume Asal',
                      style: TextStyles.bold15Black,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: TextFormFieldWrapper(
                        formField: TextFormField(
                          // controller: myController1,
                          decoration: InputDecoration(
                              border: InputBorder.none, hintText: '0000'),
                          style: TextStyles.bold15Black,
                        ),
                        borderFocusedColor: ColorStyle.goldLight,
                        borderFocusedThickness: 1.5,
                        borderRadius: 5),
                  ),
                ],
              ),
            ),
            Container(
              width: Get.width * 0.44,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(
                      'Volume Tujuan',
                      style: TextStyles.bold15Black,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: TextFormFieldWrapper(
                        formField: TextFormField(
                          // controller: myController1,
                          decoration: InputDecoration(
                              border: InputBorder.none, hintText: '0000'),
                          style: TextStyles.bold15Black,
                        ),
                        borderFocusedColor: ColorStyle.goldLight,
                        borderFocusedThickness: 1.5,
                        borderRadius: 5),
                  ),
                ],
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: Get.width * 0.44,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(
                      'Volume Netto',
                      style: TextStyles.bold15Black,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: TextFormFieldWrapper(
                        formField: TextFormField(
                          // controller: myController1,
                          decoration: InputDecoration(
                              border: InputBorder.none, hintText: '0000'),
                          style: TextStyles.bold15Black,
                        ),
                        borderFocusedColor: ColorStyle.goldLight,
                        borderFocusedThickness: 1.5,
                        borderRadius: 5),
                  ),
                ],
              ),
            ),
            Container(
              width: Get.width * 0.44,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(
                      'Satuan',
                      style: TextStyles.bold15Black,
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: DropdownSearch<String>(
                          mode: Mode.MENU,
                          items: ["Kubikasi", "Tonase", "Rit"],
                          onChanged: print,
                          dropdownSearchDecoration: InputDecoration(
                            hintText: "Pilih satuan",
                            focusColor: Colors.amber,
                            border: OutlineInputBorder(),
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 15),
                          ))
                      // TextFormFieldWrapper(
                      //   formField: TextFormField(
                      //     // controller: myController1,
                      //     decoration: InputDecoration(
                      //       border: InputBorder.none,
                      //       hintText: '0000'
                      //     ),
                      //     style: TextStyles.bold15Black,
                      //   ),
                      //   borderFocusedColor: ColorStyle.goldLight,
                      //   borderFocusedThickness: 1.5,
                      //   borderRadius: 5
                      // ),
                      ),
                ],
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: Get.width * 0.44,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(
                      'Length',
                      style: TextStyles.bold15Black,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: TextFormFieldWrapper(
                        formField: TextFormField(
                          // controller: myController1,
                          decoration: InputDecoration(
                              border: InputBorder.none, hintText: '0000'),
                          style: TextStyles.bold15Black,
                        ),
                        borderFocusedColor: ColorStyle.goldLight,
                        borderFocusedThickness: 1.5,
                        borderRadius: 5),
                  ),
                ],
              ),
            ),
            Container(
              width: Get.width * 0.44,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(
                      'Width',
                      style: TextStyles.bold15Black,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: TextFormFieldWrapper(
                        formField: TextFormField(
                          // controller: myController1,
                          decoration: InputDecoration(
                              border: InputBorder.none, hintText: '0000'),
                          style: TextStyles.bold15Black,
                        ),
                        borderFocusedColor: ColorStyle.goldLight,
                        borderFocusedThickness: 1.5,
                        borderRadius: 5),
                  ),
                ],
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: Get.width * 0.44,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(
                      'Height',
                      style: TextStyles.bold15Black,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: TextFormFieldWrapper(
                        formField: TextFormField(
                          // controller: myController1,
                          decoration: InputDecoration(
                              border: InputBorder.none, hintText: '0000'),
                          style: TextStyles.bold15Black,
                        ),
                        borderFocusedColor: ColorStyle.goldLight,
                        borderFocusedThickness: 1.5,
                        borderRadius: 5),
                  ),
                ],
              ),
            ),
            Container(
              width: Get.width * 0.44,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(
                      'Volume',
                      style: TextStyles.bold15Black,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: TextFormFieldWrapper(
                        formField: TextFormField(
                          // controller: myController1,
                          decoration: InputDecoration(
                              border: InputBorder.none, hintText: '0000'),
                          style: TextStyles.bold15Black,
                        ),
                        borderFocusedColor: ColorStyle.goldLight,
                        borderFocusedThickness: 1.5,
                        borderRadius: 5),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: Get.width * 0.9,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red, // Background color
                    onPrimary: Colors.white,
                  ),
                  onPressed: () {},
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Simpan'),
                    ],
                  )),
            ),
          ],
        )
      ],
    );
  }
}
