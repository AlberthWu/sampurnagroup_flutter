import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sgmobile/ui/pages/default/home.dart';
import 'package:sgmobile/ui/pages/default/profile.dart';
import 'package:sgmobile/ui/pages/default/report.dart';
import 'package:sgmobile/utils/colors_style.dart';

class RootPage extends StatelessWidget {
  const RootPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return GetX<MyTabController>(
      init: MyTabController(),
      builder: (tc) {
        var bottomBar = BottomNavigationBar(
          backgroundColor: ColorStyle.white,
          unselectedItemColor: ColorStyle.greyPrimary,
          selectedItemColor: ColorStyle.redPrimary,
          selectedLabelStyle:
              TextStyle(fontFamily: 'nexa', fontWeight: FontWeight.w600),
          unselectedLabelStyle:
              TextStyle(fontFamily: 'nexa', fontWeight: FontWeight.w600),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.assignment_outlined),
              label: 'Report',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: 'Profile',
            ),
          ],
          currentIndex: tc.selectedIndex.value,
          onTap: tc.onItemTapped,
        );
        return Scaffold(
          body: Center(
            child: TabBarView(
              children: tc.widgetOptions,
              physics: const NeverScrollableScrollPhysics(),
              controller: tc.tabController,
            ),
          ),
          bottomNavigationBar: bottomBar,
        );
      },
    );
  }
}

class MyTabController extends GetxController with SingleGetTickerProviderMixin {
  late TabController tabController;
  final RxInt selectedIndex = 0.obs;

  final List<Widget> widgetOptions = <Widget>[
    HomePage(),
    ReportPage(),
    ProfilePage(),
  ];

  void onItemTapped(int index) {
    tabController.animateTo(index);
    selectedIndex.value = index;
  }

  @override
  void onInit() {
    tabController = TabController(length: 3, vsync: this);
    super.onInit();
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }
}
