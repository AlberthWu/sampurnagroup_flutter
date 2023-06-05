// perbikilah code berikut ini untuk menampilkan menu pada home
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sgmobile/ui/pages/gps/armada.dart';
import 'package:sgmobile/ui/pages/hrd/kas_bon.dart';
import 'package:sgmobile/ui/pages/hrd/kehadiran.dart';
import 'package:sgmobile/ui/pages/hrd/slip.dart';
import 'package:sgmobile/ui/pages/purchase/pembelian.dart';
import 'package:sgmobile/ui/pages/sales/penjualan.dart';
import 'package:sgmobile/utils/colors_style.dart';
import 'package:sgmobile/utils/text_style.dart';

class MenuComponent2 extends StatelessWidget {
  MenuComponent2({Key? key}) : super(key: key);
  final List<MenuList2> menuList2 = [
    MenuList2(
        "Kehadiran",
        Icon(
          Icons.timelapse_outlined,
          color: ColorStyle.redPrimary,
          size: 25,
        ),
        () => KehadiranPage()),
    MenuList2(
        "Kasbon",
        Icon(
          Icons.money_outlined,
          color: ColorStyle.redPrimary,
          size: 25,
        ),
        () => KasBonPage()),
    MenuList2(
        "Slip Gaji",
        Icon(Icons.file_open_outlined, color: ColorStyle.redPrimary, size: 25),
        () => SlipPage()),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: menuList2.length,
      itemBuilder: (context, index) {
        final menu = menuList2[index];
        return GestureDetector(
          onTap: () {
            Get.to(menu.route);
          },
          child: Container(
            width: Get.width * 0.18,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    height: Get.height * 0.04,
                    width: Get.width * 0.09,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: ColorStyle.white,
                    ),
                    child: menuList2[index].icon),
                const SizedBox(height: 8),
                Text(
                  menuList2[index].name,
                  textAlign: TextAlign.center,
                  style: TextStyles.bold15White,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class MenuList2 {
  final String name;
  final Icon icon;
  final Function route;

  MenuList2(this.name, this.icon, this.route);
}
