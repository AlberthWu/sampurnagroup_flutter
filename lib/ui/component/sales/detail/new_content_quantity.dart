import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sgmobile/bussiness_logic/model/schedule_detail_model.dart';
import 'package:sgmobile/bussiness_logic/model/ujt_model.dart';
import 'package:sgmobile/utils/bulid_row.dart';
import 'package:sgmobile/utils/currency.dart';
import 'package:sgmobile/utils/divider_style.dart';
import 'package:sgmobile/utils/text_style.dart';
import 'package:text_form_field_wrapper/text_form_field_wrapper.dart';

import '../../../../utils/colors_style.dart';

class NewSJContentQuantity extends StatelessWidget {
  const NewSJContentQuantity(this.ujt, {Key? key, required this.item})
      : super(key: key);
  final dynamic item;
  final UJTModel? ujt;

  @override
  Widget build(BuildContext context) {
    TextEditingController myController1 = TextEditingController();
    return Column(children: [
      Column(
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
                          //     formField: TextFormField(
                          //       // controller: myController1,
                          //       decoration: InputDecoration(
                          //           border: InputBorder.none, hintText: '0000'),
                          //       style: TextStyles.bold15Black,
                          //     ),
                          //     borderFocusedColor: ColorStyle.goldLight,
                          //     borderFocusedThickness: 1.5,
                          //     borderRadius: 5),
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
          ])
    ]);
  }
}
