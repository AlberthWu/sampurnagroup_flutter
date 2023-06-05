import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sgmobile/ui/component/home/carousel_home.dart';
import 'package:sgmobile/ui/component/home/Info.dart';
import 'package:sgmobile/ui/component/home/menu.dart';
import 'package:sgmobile/ui/component/home/menu2.dart';
import 'package:sgmobile/utils/colors_style.dart';
import 'package:sgmobile/utils/text_style.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorStyle.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: Get.height * 0.2,
                child: Stack(
                  children: [
                    Container(
                      width: Get.width,
                      height: Get.height * 0.15,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30.0),
                          bottomRight: Radius.circular(30.0),
                        ),
                        color: ColorStyle.redLight,
                      ),
                    ),
                    const Positioned(
                      top: 8,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Semangat Kerja",
                              style: TextStyles.bold20White,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 50,
                      left: 10,
                      right: 10,
                      bottom: 0,
                      child: Container(
                        width: Get.width,
                        height: Get.height * 0.4,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(35),
                            color: ColorStyle.white,
                            boxShadow: const [
                              BoxShadow(
                                  spreadRadius: 0.5,
                                  color: ColorStyle.greyVeryLight,
                                  blurRadius: 1,
                                  blurStyle: BlurStyle.normal,
                                  offset: Offset(0, 4))
                            ]
                            // border: Border.all(
                            //   width: 1,
                            //   color: ColorStyle.redPrimary,
                            // ),
                            ),
                        child: Row(
                          children: [
                            Container(
                              width: Get.width * 0.28,
                              height: Get.height * 0.13,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ClipOval(
                                  child: Image.asset(
                                    'assets/images/images.jpg',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Container(
                                width: Get.width * 0.6,
                                height: Get.height,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text('Nama Karyawan',
                                        style: TextStyles.bold18Black),
                                    Container(
                                      width: Get.width * 0.6,
                                      height: Get.height * 0.04,
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                        color: ColorStyle.redPrimary,
                                      ),
                                      alignment: Alignment.centerLeft,
                                      child: const Padding(
                                        padding: EdgeInsets.only(left: 5),
                                        child: Text('Alam Sampurna Makmur',
                                            style: TextStyles.bold18White),
                                      ),
                                    ),
                                    const Text('Depatemen | Jabatan',
                                        style: TextStyles.bold14Black)
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 30, 15, 30),
                child: Container(
                  height: Get.height * 0.12,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: ColorStyle.redLight,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 4,
                        child: InfoHome(),
                      ),
                      Expanded(
                        flex: 7,
                        child: MenuComponent2(),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: Get.width,
                height: Get.height * 0.25,
                child: MenuComponent(),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
                child: Container(
                  width: Get.width,
                  height: Get.height * 0.25,
                  child: CarouselImage(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
