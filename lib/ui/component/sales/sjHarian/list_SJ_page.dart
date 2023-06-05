import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sgmobile/bussiness_logic/controller/SJ_Controller.dart';
import 'package:sgmobile/ui/component/sales/sjHarian/sj_harian_content.dart';
import 'package:sgmobile/utils/loading.dart';
import 'package:sgmobile/utils/no_data.dart';

class ListSJ extends StatelessWidget {
  const ListSJ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SJController>();

    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Obx(
            () {
              final isLoading = controller.isLoading.value;
              final listData = controller.listSJData.value?.list;
              final isError = controller.isError.value;

              if (isLoading && listData == null) {
                return const LoadingInformation();
              }
              // else if (isError) {
              //   return Column(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     crossAxisAlignment: CrossAxisAlignment.center,
              //     children: const [
              //       Padding(
              //         padding: const EdgeInsets.only(top: 120.0),
              //         child:
              //             Text("Connection Error", style: TextStyles.bold18Red),
              //       ),
              //     ],
              //   );
              // }
              else if (listData != null && listData.isNotEmpty) {
                return Expanded(child: SJListContent(listData));
              } else {
                return NoData();
              }
            },
          ),
        ],
      ),
    );
  }
}
