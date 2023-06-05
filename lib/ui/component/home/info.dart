import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sgmobile/utils/colors_style.dart';
import 'package:sgmobile/utils/text_style.dart';

class InfoHome extends StatelessWidget {
  InfoHome({Key? key}) : super(key: key);

  final List<InfoList> infoList = [
    InfoList(
        "Lembur",
        Icon(
          Icons.more_time_outlined,
          color: ColorStyle.goldPrimary,
        ),
        1),
    InfoList(
        "Sisa Cuti",
        Icon(
          Icons.date_range_outlined,
          color: ColorStyle.goldPrimary,
        ),
        2),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: infoList.length,
      itemBuilder: (context, index) {
        final menu = infoList[index];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: Get.height * 0.08,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: ColorStyle.white),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(infoList[index].name, style: TextStyles.bold15Black),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    infoList[index].icon,
                    Padding(
                      padding: const EdgeInsets.only(left: 5.0),
                      child: Text(
                        infoList[index].value.toString(),
                        style: TextStyles.bold15Black,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class InfoList {
  final String name;
  final Icon icon;
  final int value;

  InfoList(this.name, this.icon, this.value);
}
