import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sgmobile/utils/colors_style.dart';
import 'package:sgmobile/utils/text_style.dart';

class DriverContainer extends StatelessWidget {
  final String? imageData;
  final String? name;
  final String? religion;
  final String? bankName;
  final String? bankNo;
  final String? licenseType;
  final String? licenseNo;
  final String? licenseExpDate;
  final bool isSelected;
  final VoidCallback onTap;

  const DriverContainer({
    Key? key,
    this.imageData,
    this.name,
    this.religion,
    this.bankName,
    this.bankNo,
    this.licenseType,
    this.licenseNo,
    this.licenseExpDate,
    this.isSelected = false,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: Get.width * 0.45,
        height: Get.height * 0.318,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              blurRadius: 5,
              color: isSelected ? ColorStyle.goldLight : Colors.transparent,
            )
          ],
          borderRadius: BorderRadius.all(Radius.circular(10)),
          border: Border.all(
            color: isSelected ? ColorStyle.goldPrimary : ColorStyle.greyLight,
          ),
          color: ColorStyle.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Column(
            children: [
              Container(
                width: Get.width * 0.43,
                height: Get.height * 0.22,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                child: imageData != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        child: Image.memory(
                          base64Decode(
                            imageData!.substring(imageData!.indexOf(',') + 1),
                          ),
                          fit: BoxFit.cover,
                        ),
                      )
                    : ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        child: Image.asset(
                          'assets/images/person.png',
                          fit: BoxFit.cover,
                        ),
                      ),
              ),
              Text(
                name?.toUpperCase() ?? "",
                style: TextStyles.bold13Black,
              ),
              Text(
                religion?.toUpperCase() ?? "",
                style: TextStyles.light11Black,
              ),
              Text(
                (bankName?.toUpperCase() ?? "BANK") + " | " + (bankNo ?? ""),
                style: TextStyles.light11Black,
              ),
              Text(
                (licenseType ?? "") + " | " + (licenseNo ?? "-"),
                style: TextStyles.light11Black,
              ),
              Text(
                licenseExpDate ?? "-",
                style: TextStyles.light11Black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
