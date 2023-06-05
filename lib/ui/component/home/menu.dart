import 'package:flutter/widgets.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sgmobile/ui/pages/gps/armada.dart';
import 'package:sgmobile/ui/pages/gps/gps.dart';
import 'package:sgmobile/ui/pages/hrd/karyawan.dart';
import 'package:sgmobile/ui/pages/finance/keuangan.dart';
import 'package:sgmobile/ui/pages/hrd/slip.dart';
import 'package:sgmobile/ui/pages/other/lainnya.dart';
import 'package:sgmobile/ui/pages/purchase/pembelian.dart';
import 'package:sgmobile/ui/pages/sales/penjualan.dart';
import 'package:sgmobile/utils/colors_style.dart';
import 'package:sgmobile/utils/text_style.dart';

class MenuComponent extends StatelessWidget {
  MenuComponent({Key? key}) : super(key: key);

  final List<MenuList> menuList = [
    MenuList("Penjualan", "assets/icons/sales.gif", ColorStyle.greyVeryLight,
        () => PenjualanPage()),
    MenuList("Armada", "assets/icons/fleet2.gif", ColorStyle.goldVeryLight,
        () => ArmadaPage()),
    MenuList("Pembelian", "assets/icons/purchase2.gif",
        ColorStyle.greyVeryLight, () => PembelianPage()),
    MenuList("Keuangan", "assets/icons/finance.gif", ColorStyle.goldVeryLight,
        () => KeuanganPage()),
    MenuList("Daftar Gaji", "assets/icons/payroll.gif",
        ColorStyle.goldVeryLight, () => SlipPage()),
    MenuList("Karyawan", "assets/icons/employee.gif", ColorStyle.greyVeryLight,
        () => KaryawanPage()),
    MenuList("GPS", "assets/icons/gps.gif", ColorStyle.goldVeryLight,
        () => GPSPage()),
    MenuList("Lainnya", "assets/icons/more.gif", ColorStyle.greyVeryLight,
        () => LainnyaPage()),
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        childAspectRatio: 1.0,
      ),
      itemCount: menuList.length,
      itemBuilder: (context, index) {
        final menu = menuList[index];
        return GestureDetector(
          onTap: () {
            Get.to(menu.route());
          },
          child: Column(
            children: [
              Container(
                width: Get.width,
                height: Get.height * 0.06,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: menu.color),
                alignment: AlignmentDirectional.bottomCenter,
                child: Image.asset(
                  menu.icon,
                  scale: 8,
                ),
              ),
              SizedBox(height: 8),
              Text(
                menu.name,
                style: TextStyles.light14Black,
              ),
            ],
          ),
        );
      },
    );
  }
}

class MenuList {
  final String name;
  final String icon;
  final Color color;
  final Function route;

  MenuList(this.name, this.icon, this.color, this.route);
}
