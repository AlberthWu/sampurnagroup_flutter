import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:sgmobile/bussiness_logic/controller/SJ_Controller.dart';
import 'package:sgmobile/ui/component/sales/detail/app_bar_sj.dart';
import 'package:sgmobile/ui/component/sales/detail/sj_content_perusahaan.dart';
import 'package:sgmobile/ui/component/sales/detail/sj_content_driver.dart';
import 'package:sgmobile/ui/component/sales/detail/sj_content_pengiriman.dart';
import 'package:sgmobile/ui/component/sales/detail/sj_content_produk.dart';
import 'package:sgmobile/ui/component/sales/detail/sj_content_status.dart';
import 'package:sgmobile/ui/component/sales/detail/sj_content_transaksi.dart';
import 'package:sgmobile/ui/component/sales/detail/sj_content_ujt.dart';
import 'package:sgmobile/utils/button_style.dart';
import 'package:sgmobile/utils/colors_style.dart';
import 'package:sgmobile/utils/divider_style.dart';
import 'package:sgmobile/utils/loading.dart';
import 'package:sgmobile/utils/no_data.dart';

class DetailSJPage extends StatelessWidget {
  const DetailSJPage(this.itemId, {super.key});
  final num itemId;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SJController>();

    return WillPopScope(
      onWillPop: () async {
        controller.imageDataList.value = [];
        return true;
      },
      child: Scaffold(
        backgroundColor: ColorStyle.white,
        appBar: AppBar(
            backgroundColor: ColorStyle.white,
            leading: ButtonStyles.backButtons,
            title: AppBarSales()),
        body: ListView(
          children: [
            Obx(
              () {
                if (controller.isLoading.value) {
                  return const LoadingInformation();
                } else if (controller.detailData.value != null) {
                  final detail = controller.detailData.value!;
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          SJDetailContentStatus(detail),
                          DividerStyles.divider,
                          Padding(
                            padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
                            child: SJDetailContentPerusahaan(detail),
                          ),
                          DividerStyles.divider,
                          Padding(
                            padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
                            child: SJDetailContentProduk(detail),
                          ),
                          DividerStyles.divider,
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: SJDetailContentPengiriman(detail),
                          ),
                          DividerStyles.divider,
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: SJDetailContentDriver(detail),
                          ),
                          DividerStyles.divider,
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: SJDetailContentTransaksi(detail),
                          ),
                          DividerStyles.divider,
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: SJDetailContentUJT(detail),
                          )
                        ],
                      )
                    ],
                  );
                } else {
                  return const NoData();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
