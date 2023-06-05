import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sgmobile/bussiness_logic/controller/SJ_Controller.dart';
import 'package:sgmobile/ui/component/sales/sjHarian/list_SJ_page.dart';
import 'package:sgmobile/ui/component/sales/date_picker.dart';
import 'package:sgmobile/ui/component/sales/menutab.dart';
import 'package:sgmobile/utils/button_style.dart';
import 'package:sgmobile/utils/colors_style.dart';
import 'package:sgmobile/utils/text_style.dart';

class PenjualanPage extends StatelessWidget {
  const PenjualanPage({super.key});

  @override
  Widget build(BuildContext context) => GetBuilder<SJController>(
      init: SJController(),
      builder: (listSJ) {
        return Scaffold(
            backgroundColor: ColorStyle.redPrimary,
            appBar: AppBar(
              leading: ButtonStyles.backButtons,
              title: Text('Surat Jalan', style: TextStyles.bold23Grey),
              backgroundColor: ColorStyle.white,
            ),
            body: ListView(
              children: <Widget>[
                const DatePickerScroll(),
                new Container(
                  height: Get.height * 0.725,
                  decoration: const BoxDecoration(
                    color: ColorStyle.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0),
                    ),
                  ),
                  child: const MenuTabSJ(),
                )
              ],
            ));
      });
}
