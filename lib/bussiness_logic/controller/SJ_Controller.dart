import 'dart:io';

import 'package:cool_alert/cool_alert.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sgmobile/bussiness_logic/api/SJ_API.dart';
import 'package:sgmobile/bussiness_logic/model/SJ_Model.dart';
import 'package:sgmobile/bussiness_logic/model/confirm_model.dart';
import 'package:sgmobile/bussiness_logic/model/driver_model.dart';
import 'package:sgmobile/bussiness_logic/model/fleet_model.dart';
import 'package:sgmobile/bussiness_logic/model/schedule_detail_model.dart';
import 'package:sgmobile/bussiness_logic/model/schedule_model.dart';
import 'package:sgmobile/bussiness_logic/model/ujt_model.dart';
import 'package:intl/intl.dart';

class SJController extends GetxController {
  final Rxn<DataSJ> listSJData = Rxn<DataSJ>();
  final Rxn<DetailSJ> detailData = Rxn<DetailSJ>();
  final Rxn<DataSchedule> listSchedule = Rxn<DataSchedule>();
  final Rxn<ScheduleDetailModel> detailSchedule = Rxn<ScheduleDetailModel>();
  final Rxn<UJTModel> ujtData = Rxn<UJTModel>();
  final Rxn<FleetModel> fleetData = Rxn<FleetModel>();
  final Rxn<FleetModel> fleetDataId = Rxn<FleetModel>();
  final Rxn<DataFleet> selectedPlateNo = Rxn<DataFleet>();
  final Rxn<DriverModel> driverData = Rxn<DriverModel>();
  final Rxn<List<DataFleet>> filteredFleetData = Rxn<List<DataFleet>>();
  final Rxn<ConfirmModel> confirmData = Rxn<ConfirmModel>();
  final RxList<File> imageDataList = <File>[].obs;

  var isLoading = false.obs;
  var isError = false.obs;
  var isButtonLoading = false.obs;

  Rx<DateTime> selectedDate = DateTime.now().obs;
  var currentPage = 1;
  final RxBool primaryDriverSelected = true.obs;
  final RxInt primaryStatusTemp = 1.obs;
  final RxInt secondaryStatusTemp = 0.obs;
  final RxInt selectedDriverId = 0.obs;
  final RxString memo_ids = "".obs;

  @override
  void onInit() {
    SJListController();
    ScheduleController();
    super.onInit();
  }

  Future<void> SJListController() async {
    if (currentPage == 1) {
      listSJData.value = null;
    }

    isLoading.value = true;
    try {
      final data = await SJAPI().getListSJData(
          DateFormat('yyyy-MM-dd').format(selectedDate.value), currentPage);
      if (listSJData.value != null && currentPage == 1) {
        listSJData.value!.list = data.data.list;
        isLoading.value = false;
      } else if (listSJData.value != null) {
        final newData = listSJData.value!.list + data.data.list;
        listSJData.value!.list = newData;
      } else {
        listSJData.value = data.data;
      }
    } catch (e) {
      isError.value = true;
      throw Exception(e);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> loadMoreData() async {
    if (!isLoading.value && currentPage < listSJData.value!.totalpage) {
      currentPage++;
      await SJListController();
    }
    if (!isLoading.value && currentPage < listSchedule.value!.totalpage) {
      currentPage++;
      await ScheduleController();
    }
  }

  Future<void> getSJDetail(int id) async {
    isLoading.value = true;
    try {
      final data = await SJAPI().getSJDetail(id);
      detailData.value = data;
    } catch (e) {
      isError.value = true;
      throw Exception(e);
    } finally {
      isLoading.value = false;
    }
  }

  // Future<void> openGallery() async {
  //   final ImagePicker imagePicker = ImagePicker();
  //   final List<XFile>? images = await imagePicker.pickMultiImage(
  //     imageQuality: 50, // Adjust the image quality as per your requirement
  //   );
  //   if (images != null) {
  //     final List<File> imageFiles =
  //         images.map((image) => File(image.path)).toList();
  //     imageDataList.value = imageFiles;
  //   }
  // }
  Future<void> openGallery() async {
    final ImagePicker imagePicker = ImagePicker();
    final List<XFile>? images = await imagePicker.pickMultiImage(
      imageQuality: 50,
    );
    if (images != null) {
      final List<File> imageFiles =
          images.map((image) => File(image.path)).toList();
      imageDataList.assignAll(imageFiles);
    }
  }

  Future<void> ScheduleController() async {
    if (currentPage == 1) {
      listSchedule.value == null;
    }

    isLoading.value = true;
    try {
      final data = await SJAPI().getListScheduleData(
          DateFormat('yyyy-MM-dd').format(selectedDate.value), currentPage);
      if (listSchedule.value != null && currentPage == 1) {
        listSchedule.value!.list = data.data.list;
      } else if (listSchedule.value != null) {
        final newData = listSchedule.value!.list + data.data.list;
        listSchedule.value!.list = newData;
      } else {
        listSchedule.value = data.data;
      }
    } catch (e) {
      isError.value = true;
      throw Exception(e);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> getDEtailSchedule(int id) async {
    try {
      final data = await SJAPI().getScheduleData(id);
      detailSchedule.value = data;
    } catch (e) {
      isError.value = true;
      throw Exception(e);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> getUJTData(String dateTime, int plant_id, int origin_id,
      int product_id, int fleet_type_id) async {
    try {
      final data = await SJAPI()
          .getUJT(dateTime, plant_id, origin_id, product_id, fleet_type_id);
      ujtData.value = data;
    } catch (e) {
      isError.value = true;
      throw Exception(e);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> getFleetData(int fleet_type_id) async {
    try {
      isLoading.value = true;
      final data = await SJAPI().getFleet(fleet_type_id);
      fleetData.value = data;
      isError.value = false;
      isLoading.value = false;
    } catch (e) {
      isError.value = true;
      throw Exception(e);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> getFleetDataId(String keyword, int fleet_type_id) async {
    try {
      isLoading.value = true;
      final data = await SJAPI().getFleetId(keyword, fleet_type_id);
      fleetDataId.value = data;
      isError.value = false;
      isLoading.value = false;
    } catch (e) {
      isError.value = true;
      throw Exception(e);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> getDriverData(
      int order_id, String plate_no, String issue_date) async {
    try {
      isLoading.value = true;
      final data = await SJAPI().getDriver(order_id, plate_no, issue_date);
      driverData.value = data;
      isError.value = false;
    } catch (e) {
      isError.value = true;
      throw Exception(e);
    } finally {
      isLoading.value = false;
    }
  }

  // void driverStatusChanged(bool isPrimaryDriverSelected) {
  //   primaryDriverSelected.value = isPrimaryDriverSelected;
  //   if (isPrimaryDriverSelected) {
  //     primaryStatusTemp.value = 1;
  //     secondaryStatusTemp.value = 0;
  //     selectedDriverId.value = driverData.value!.data.primary_driver!.id;
  //   } else {
  //     primaryStatusTemp.value = 0;
  //     secondaryStatusTemp.value = 1;
  //     selectedDriverId.value = driverData.value!.data.secondary_driver!.id;
  //   }
  //   print(detailSchedule.value!.data.order_type_id);
  //   print(primaryStatusTemp.value);
  //   print(secondaryStatusTemp.value);
  //   print(selectedDriverId.value);
  //   print(detailSchedule.value!.data.sales_type_id);
  //   print(detailSchedule.value!.data.issue_date);
  //   print(this.selectedPlateNo.value);
  //   print(detailSchedule.value!.data.id);
  //   print(detailSchedule.value!.data.origin_id);
  //   print(detailSchedule.value!.data.plant_id);
  //   print(detailSchedule.value!.data.product_id.id);
  //   print(detailSchedule.value!.data.company_id);
  //   print(ujtData.value!.data.id);
  //   print(ujtData.value!.data.ujt);
  //   print(detailSchedule.value!.data.multi_product);
  // }

  void driverStatusChanged(bool isPrimaryDriverSelected) {
    primaryDriverSelected.value = isPrimaryDriverSelected;
    if (isPrimaryDriverSelected) {
      primaryStatusTemp.value = 1;
      secondaryStatusTemp.value = 0;
      selectedDriverId.value = driverData.value?.data.primary_driver?.id ?? 0;
      memo_ids.value = driverData
              .value?.data.primary_driver?.employee_memo_pot_current
              ?.map((memo) => memo.id.toString())
              ?.join(',') ??
          '';
    } else {
      primaryStatusTemp.value = 0;
      secondaryStatusTemp.value = 1;
      selectedDriverId.value = driverData.value?.data.secondary_driver?.id ?? 0;
      memo_ids.value = driverData
              .value?.data.secondary_driver?.employee_memo_pot_current
              ?.map((memo) => memo.id.toString())
              ?.join(',') ??
          '';
    }
    print(memo_ids.value);
    print(detailData.value!.data.order_type_id.id);
  }

  Future<void> postSJBaru() async {
    final orderTypeId = detailSchedule.value!.data.order_type_id;
    final primaryStatus = primaryStatusTemp.value;
    final secondaryStatus = secondaryStatusTemp.value;
    final employeeId = selectedDriverId.value;
    final salesTypeId = detailSchedule.value!.data.sales_type_id;
    final issueDate = detailSchedule.value!.data.issue_date;
    final selectedPlateNo = this.selectedPlateNo.value;
    final scheduleId = detailSchedule.value!.data.id;
    final originId = detailSchedule.value!.data.origin_id;
    final plantId = detailSchedule.value!.data.plant_id;
    final productId = detailSchedule.value!.data.product_id.id;
    final companyId = detailSchedule.value!.data.company_id;
    final ujtId = ujtData.value!.data.id;
    final ujt = ujtData.value!.data.ujt;
    final multiproduct = detailSchedule.value!.data.multi_product;

    isButtonLoading.value = false;

    try {
      isButtonLoading.value = true;
      // print('test');
      CoolAlert.show(
        context: Get.context!,
        type: CoolAlertType.loading,
        text: 'Loading...',
        barrierDismissible: false,
      );
      await SJAPI().postNewSJ(
        multiProduct: multiproduct,
        orderTypeId: orderTypeId.id,
        poolId: 1,
        ujt: ujt.toInt(),
        counter: 'A',
        shift: 1,
        returned: 0,
        primaryStatus: primaryStatus,
        secondaryStatus: secondaryStatus,
        employeeId: employeeId.toString(),
        salesTypeId: salesTypeId.id,
        issueDate: issueDate,
        selectedPlateNo: selectedPlateNo!.id,
        scheduleId: scheduleId,
        originId: originId.id,
        plantId: plantId.id,
        productId: productId,
        companyId: companyId.id,
        ujtId: ujtId.toInt(),
      );
      Get.back();
      CoolAlert.show(
        context: Get.context!,
        type: CoolAlertType.success,
        text: 'Sukses',
        onConfirmBtnTap: () {
          // Do something after success
        },
      );
    } catch (e) {
      isError.value = true;
      print('test');
      Get.back();
      CoolAlert.show(
        context: Get.context!,
        type: CoolAlertType.error,
        text: 'Error: $e',
      );
      throw Exception();
    } finally {
      isButtonLoading.value = false;
    }
  }

  Future<void> putSJBaru(int id) async {
    final orderTypeId = detailData.value!.data.order_type_id;
    final primaryStatus = primaryStatusTemp.value;
    final secondaryStatus = secondaryStatusTemp.value;
    final employeeId = selectedDriverId.value;
    final salesTypeId = detailData.value!.data.sales_type_id;
    final issueDate = detailData.value!.data.issue_date;
    final selectedPlateNo = this.selectedPlateNo.value;
    final scheduleId = detailData.value!.data.schedule_id.id;
    final originId = detailData.value!.data.origin_id;
    final plantId = detailData.value!.data.plant_id;
    final productId = detailData.value!.data.product_id.id;
    final companyId = detailData.value!.data.company_id;
    final ujtId = ujtData.value!.data.id;
    final ujt = ujtData.value!.data.ujt;
    final multiproduct = detailData.value!.data.multi_product;
    final poolId = detailData.value!.data.pool_id.id;
    final counter = detailData.value!.data.counter;
    final shift = detailData.value!.data.shift;

    isButtonLoading.value = false;

    try {
      isButtonLoading.value = true;
      print('test');
      CoolAlert.show(
        context: Get.context!,
        type: CoolAlertType.loading,
        text: 'Loading...',
        barrierDismissible: false,
      );
      await SJAPI().putDraft(
        id,
        multiProduct: multiproduct.toInt(),
        orderTypeId: orderTypeId.id,
        poolId: poolId,
        ujt: ujt.toInt(),
        counter: counter,
        shift: shift.toInt(),
        returned: 0,
        primaryStatus: primaryStatus,
        secondaryStatus: secondaryStatus,
        employeeId: employeeId.toString(),
        salesTypeId: salesTypeId.id,
        issueDate: issueDate,
        selectedPlateNo: selectedPlateNo!.id,
        scheduleId: scheduleId.toInt(),
        originId: originId.id,
        plantId: plantId.id,
        productId: productId,
        companyId: companyId.id,
        ujtId: ujtId.toInt(),
      );
      Get.back();
      CoolAlert.show(
        context: Get.context!,
        type: CoolAlertType.success,
        text: 'Sukses',
        onConfirmBtnTap: () {
          // Do something after success
        },
      );
    } catch (e) {
      isError.value = true;
      print(e);
      Get.back();
      CoolAlert.show(
        context: Get.context!,
        type: CoolAlertType.error,
        text: 'Error: $e',
      );
      throw Exception(e);
    } finally {
      isButtonLoading.value = false;
    }
  }

  Future<void> getStatusUpdate(int id, int status) async {
    isButtonLoading.value = false;
    try {
      isButtonLoading.value = true;
      print('${id} /// ${memo_ids} /// ${status}');
      final data = await SJAPI().confirmSJ(id, status, memo_ids.value);
      confirmData.value = data;
      isError.value = false;
      isButtonLoading.value = false;
    } catch (e) {
      isError.value = true;
      throw Exception(e);
    } finally {
      isButtonLoading.value = false;
    }
  }

  Future<void> postImageList(int id, List<File> imageFiles) async {
    isButtonLoading.value = false;
    try {
      isButtonLoading.value = true;
      for (final imageFile in imageFiles) {
        final data = await SJAPI().postImage(id, [imageFile]);
        imageDataList.add(File(data.data[0].image_data));
      }
      isError.value = false;
    } catch (e) {
      isError.value = true;
      throw Exception(e);
    } finally {
      isButtonLoading.value = false;
    }
  }
}
