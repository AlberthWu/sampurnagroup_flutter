import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sgmobile/bussiness_logic/model/SJ_Model.dart';
import 'package:sgmobile/utils/text_style.dart';

class SJDetailContentPerusahaan extends StatelessWidget {
  const SJDetailContentPerusahaan(this.detail, {super.key});
  final DetailSJ detail;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SvgPicture.asset('assets/icon-svg/building.svg'),
                  SizedBox(width: 2),
                  const Text(
                    " Detail Perusahaan",
                    style: TextStyles.bold16Black,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4, bottom: 0),
              child: Container(
                width: Get.width,
                height: Get.height * 0.1,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Color.fromARGB(35, 14, 13, 13),
                          offset: Offset(0, 0),
                          blurRadius: 9,
                          spreadRadius: 2,
                          blurStyle: BlurStyle.normal)
                    ]),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      if (detail.data.company_id.id == 2)
                        Image.asset("assets/logo/ASM.png")
                      else if (detail.data.company_id.id == 3)
                        Image.asset(
                          "assets/logo/NCA.png",
                          scale: 10,
                        )
                      else if (detail.data.company_id.id == 4)
                        Image.asset("assets/logo/SMS.png"),
                      SizedBox(width: 10),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            detail.data.company_id.name,
                            style: TextStyles.light16Black,
                          ),
                          Row(
                            children: [
                              Text(
                                detail.data.reference_no.toString(),
                                style: TextStyles.light15Black,
                              ),
                              Text(' | '),
                              Text(
                                detail.data.fleet_id.plateNo,
                                style: TextStyles.bold15Black,
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
