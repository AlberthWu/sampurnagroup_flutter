import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:sgmobile/ui/component/sales/sjHarian/list_SJ_page.dart';
import 'package:sgmobile/ui/component/sales/daftar_jadwal/daftar_jadwal.dart';
import 'package:sgmobile/ui/component/sales/list_sj_berjalan.dart';
import 'package:sgmobile/utils/colors_style.dart';
import 'package:sgmobile/utils/text_style.dart';

class MenuTabSJ extends StatefulWidget {
  const MenuTabSJ({Key? key}) : super(key: key);

  @override
  _MenuTabSJState createState() => _MenuTabSJState();
}

class _MenuTabSJState extends State<MenuTabSJ>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          indicatorColor: ColorStyle.redLight,
          labelColor: ColorStyle.redPrimary,
          controller: _tabController,
          labelStyle: TextStyles.bold13Black,
          tabs: const [
            Tab(text: 'SJ Berjalan'),
            Tab(text: 'SJ Harian'),
            Tab(text: 'Daftar Jadwal'),
          ],
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: const [
              ListSJBerjalan(),
              ListSJ(),
              DaftarJadwal(),
            ],
          ),
        ),
      ],
    );
  }
}
