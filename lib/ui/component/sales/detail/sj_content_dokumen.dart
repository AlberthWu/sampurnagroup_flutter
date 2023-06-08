import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sgmobile/bussiness_logic/model/SJ_Model.dart';
import 'package:sgmobile/utils/bulid_row.dart';
import 'package:sgmobile/utils/colors_style.dart';
import 'package:sgmobile/utils/divider_style.dart';
import 'package:sgmobile/utils/text_style.dart';
import 'package:d_input/d_input.dart';
import 'package:text_form_field_wrapper/text_form_field_wrapper.dart';

class SJDetailContentDokumen extends StatelessWidget {
  const SJDetailContentDokumen(this.detail, {super.key});
  final DetailSJ detail;

  @override
  Widget build(BuildContext context) {
    TextEditingController myController1 = TextEditingController();
    return Column(
      // mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SvgPicture.asset('assets/icon-svg/documenttext1.svg'),
            SizedBox(width: 2),
            Text(
              " Informasi Dokumen",
              style: TextStyles.bold16Black,
            ),
          ],
        ),
        SizedBox(
          height: 9,
        ),
        Container(
            width: Get.width * 0.9,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text(
                    'No DO',
                    style: TextStyles.bold15Black,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: TextFormFieldWrapper(
                      formField: TextFormField(
                        controller: myController1,
                        decoration: InputDecoration(
                            border: InputBorder.none, hintText: 'Isi no DO'),
                        style: TextStyles.bold15Black,
                      ),
                      borderFocusedColor: ColorStyle.goldLight,
                      borderFocusedThickness: 1.5,
                      borderRadius: 5),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text(
                    'No SPA',
                    style: TextStyles.bold15Black,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: TextFormFieldWrapper(
                      formField: TextFormField(
                        controller: myController1,
                        decoration: InputDecoration(
                            border: InputBorder.none, hintText: 'Isi no SPA'),
                        style: TextStyles.bold15Black,
                      ),
                      borderFocusedColor: ColorStyle.goldLight,
                      borderFocusedThickness: 1.5,
                      borderRadius: 5),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text(
                    'No Countainer',
                    style: TextStyles.bold15Black,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: TextFormFieldWrapper(
                      formField: TextFormField(
                        controller: myController1,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Isi no Countainer'),
                        style: TextStyles.bold15Black,
                      ),
                      borderFocusedColor: ColorStyle.goldLight,
                      borderFocusedThickness: 1.5,
                      borderRadius: 5),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text(
                    'No PTO',
                    style: TextStyles.bold15Black,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: TextFormFieldWrapper(
                      formField: TextFormField(
                        controller: myController1,
                        decoration: InputDecoration(
                            border: InputBorder.none, hintText: 'Isi no PTO'),
                        style: TextStyles.bold15Black,
                      ),
                      borderFocusedColor: ColorStyle.goldLight,
                      borderFocusedThickness: 1.5,
                      borderRadius: 5),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text(
                    'No DI',
                    style: TextStyles.bold15Black,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: TextFormFieldWrapper(
                      formField: TextFormField(
                        controller: myController1,
                        decoration: InputDecoration(
                            border: InputBorder.none, hintText: 'Isi no DI'),
                        style: TextStyles.bold15Black,
                      ),
                      borderFocusedColor: ColorStyle.goldLight,
                      borderFocusedThickness: 1.5,
                      borderRadius: 5),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text(
                    'SJ Customer',
                    style: TextStyles.bold15Black,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: TextFormFieldWrapper(
                      formField: TextFormField(
                        controller: myController1,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Isi SJ Customer'),
                        style: TextStyles.bold15Black,
                      ),
                      borderFocusedColor: ColorStyle.goldLight,
                      borderFocusedThickness: 1.5,
                      borderRadius: 5),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text(
                    'SJ Supplier',
                    style: TextStyles.bold15Black,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: TextFormFieldWrapper(
                      formField: TextFormField(
                        controller: myController1,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Isi SJ Supplier'),
                        style: TextStyles.bold15Black,
                      ),
                      borderFocusedColor: ColorStyle.goldLight,
                      borderFocusedThickness: 1.5,
                      borderRadius: 5),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text(
                    'Note',
                    style: TextStyles.bold15Black,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: TextFormFieldWrapper(
                      formField: TextFormField(
                        controller: myController1,
                        decoration: InputDecoration(
                            border: InputBorder.none, hintText: 'Isi note'),
                        style: TextStyles.bold15Black,
                      ),
                      borderFocusedColor: ColorStyle.goldLight,
                      borderFocusedThickness: 1.5,
                      borderRadius: 5),
                ),
              ],
            )),
      ],
    );
  }
}
