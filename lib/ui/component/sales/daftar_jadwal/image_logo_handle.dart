import 'package:flutter/material.dart';
import 'package:sgmobile/bussiness_logic/model/SJ_Model.dart';
import 'package:sgmobile/bussiness_logic/model/schedule_detail_model.dart';
import 'package:sgmobile/bussiness_logic/model/schedule_model.dart';

class ImageHandle<T> extends StatelessWidget {
  const ImageHandle(this.data, {Key? key}) : super(key: key);
  final T data;

  static const Map<int, String?> companyLogoPaths = {
    2: 'assets/logo/ASM.png',
    4: 'assets/logo/SMS.png',
    3: 'assets/logo/NCA.png',
  };

  static const Map<int, double> companyLogoScales = {
    2: 35,
    4: 35,
    3: 20,
  };

  String? getCompanyLogoPath(T data) {
    if (data is OrderList) {
      final order = data as OrderList;
      return companyLogoPaths[order.company_id];
    } else if (data is DetailSJ) {
      final sj = data as DetailSJ;
      return companyLogoPaths[sj.data.company_id.id];
    } else if (data is ScheduleDetailModel) {
      final item = data as ScheduleDetailModel;
      return companyLogoPaths[item.data.company_id.id];
    }
    return null;
  }

  double getCompanyLogoScale(T data) {
    if (data is OrderList) {
      final order = data as OrderList;
      return companyLogoScales[order.company_id]!;
    } else if (data is DetailSJ) {
      final sj = data as DetailSJ;
      return companyLogoScales[sj.data.company_id.id]!;
    } else if (data is ScheduleDetailModel) {
      final item = data as ScheduleDetailModel;
      return companyLogoScales[item.data.company_id.id]!;
    }
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    final logoPath = getCompanyLogoPath(data);
    final logoScale = getCompanyLogoScale(data);

    if (logoPath == null || logoScale == 0) {
      return Container();
    }

    return Container(
      child: Column(
        children: [
          Image.asset(
            logoPath,
            scale: logoScale,
          ),
        ],
      ),
    );
  }
}
