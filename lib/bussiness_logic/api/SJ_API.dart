import 'dart:io';

import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sgmobile/bussiness_logic/model/SJ_Model.dart';
import 'package:sgmobile/bussiness_logic/model/confirm_model.dart';
import 'package:sgmobile/bussiness_logic/model/driver_model.dart';
import 'package:sgmobile/bussiness_logic/model/fleet_model.dart';
import 'package:sgmobile/bussiness_logic/model/image_model.dart';
import 'package:sgmobile/bussiness_logic/model/schedule_detail_model.dart';
import 'package:sgmobile/bussiness_logic/model/schedule_model.dart';
import 'package:sgmobile/bussiness_logic/model/ujt_model.dart';
import 'package:sgmobile/utils/api.dart';

class SJAPI {
  Future<SJModel> getListSJData(String dateTime, int page) async {
    try {
      final response = await Dio(BaseOptions(baseUrl: BaseUrl + APISJList))
          .get('?issue_date=${dateTime}&page=$page');
      if (response.statusCode == 200) {
        final jsonData = response.data as Map<String, dynamic>;
        print(jsonData);
        return SJModel.fromJSON(jsonData);
      } else {
        throw Exception('Failed to fetch SJ data');
      }
    } on DioError catch (e) {
      throw Exception(e.message);
    }
  }

  Future<DetailSJ> getSJDetail(int id) async {
    try {
      final response =
          await Dio(BaseOptions(baseUrl: BaseUrl + APISJList)).get('/$id');
      if (response.statusCode == 200) {
        final jsonData = response.data as Map<String, dynamic>;
        print(jsonData);
        return DetailSJ.fromJSON(jsonData);
      } else {
        throw Exception('Failed to fetch SJ data');
      }
    } on DioError catch (e) {
      throw Exception(e.message);
    }
  }

  Future<ScheduleModel> getListScheduleData(String dateTime, int page) async {
    try {
      final response = await Dio(BaseOptions(baseUrl: BaseUrl + APISChedule))
          .get('?issue_date=${dateTime}&page=$page');
      if (response.statusCode == 200) {
        final jsonData = response.data as Map<String, dynamic>;
        // print(jsonData);
        return ScheduleModel.fromJSON(jsonData);
      } else {
        throw Exception('Failed to fetch Schedule data');
      }
    } on DioError catch (e) {
      throw Exception(e.message);
    }
  }

  Future<ScheduleDetailModel> getScheduleData(int id) async {
    try {
      final response =
          await Dio(BaseOptions(baseUrl: BaseUrl + APISChedule)).get('/${id}');
      if (response.statusCode == 200) {
        final jsonData = response.data as Map<String, dynamic>;
        // print(jsonData);
        return ScheduleDetailModel.fromJSON(jsonData);
      } else {
        throw Exception('Failed to fetch Schedule data');
      }
    } on DioError catch (e) {
      throw Exception(e.message);
    }
  }

  Future<UJTModel> getUJT(String dateTime, int plant_id, int origin_id,
      int product_id, int fleet_type_id) async {
    try {
      final response = await Dio(BaseOptions(baseUrl: BaseUrl + APIGetUJT)).get(
          '?issue_date=${dateTime}&plant_id=${plant_id}&origin_id=${origin_id}&product_id=${product_id}&fleet_type_id=${fleet_type_id}');
      if (response.statusCode == 200) {
        final jsonData = response.data as Map<String, dynamic>;
        // print(jsonData);
        return UJTModel.fromJSON(jsonData);
      } else {
        throw Exception('Failed to fetch UJT');
      }
    } on DioError catch (e) {
      throw Exception(e.message);
    }
  }

  Future<FleetModel> getFleet(int fleet_type_id) async {
    try {
      final response = await Dio(BaseOptions(baseUrl: BaseUrl + APIGetFleet))
          .get('/${fleet_type_id}?fleet_type_id=${fleet_type_id}');
      // print(response);
      if (response.statusCode == 200) {
        final jsonData = response.data as Map<String, dynamic>;
        return FleetModel.fromJSON(jsonData);
      } else {
        throw Exception('Failed to fetch Fleet data');
      }
    } on DioError catch (e) {
      throw Exception(e.message);
    }
  }

  Future<FleetModel> getFleetId(String keyword, int fleet_type_id) async {
    try {
      final response = await Dio(BaseOptions(baseUrl: BaseUrl + APIGetFleet)).get(
          '/${fleet_type_id}?keyword=${keyword}&fleet_type_id=${fleet_type_id}');
      if (response.statusCode == 200) {
        final jsonData = response.data as Map<String, dynamic>;
        return FleetModel.fromJSON(jsonData);
      } else {
        throw Exception('Failed to fetch Fleet data');
      }
    } on DioError catch (e) {
      throw Exception(e.message);
    }
  }

  Future<DriverModel> getDriver(
      int order_id, String plate_no, String issue_date) async {
    try {
      final response = await Dio(BaseOptions(baseUrl: BaseUrl + APIGetDriver)).get(
          '?order_id=${order_id}&plate_no=${plate_no}&issue_date=${issue_date}');
      print(response);
      final jsonData = response.data as Map<String, dynamic>;
      return DriverModel.fromJSON(jsonData);
    } on DioError catch (e) {
      throw Exception(e.message);
    }
  }

  Future<DetailSJ> postNewSJ({
    required int primaryStatus,
    required int secondaryStatus,
    required String employeeId,
    required int salesTypeId,
    required String issueDate,
    required int selectedPlateNo,
    required int scheduleId,
    required int originId,
    required int plantId,
    required int productId,
    required int companyId,
    required int returned,
    required int shift,
    required String counter,
    required int ujt,
    required int orderTypeId,
    required int multiProduct,
    String sjCustomer = "",
    String sjSupplier = "",
    String noContainer = "",
    String noPto = "",
    String noDi = "",
    String noDo = "",
    int delivered = 0,
    required int ujtId,
    required int poolId,
  }) async {
    print('test');
    try {
      final data = {
        'multiproduct': multiProduct,
        'order_type_id': orderTypeId,
        'primary_status': primaryStatus,
        'secondary_status': secondaryStatus,
        'employee_id': employeeId,
        'sales_type_id': salesTypeId,
        'issue_date': issueDate,
        'counter': 'A',
        'shift': 1,
        'fleet_id': selectedPlateNo,
        'schedule_id': scheduleId,
        'origin_id': originId,
        'plant_id': plantId,
        'product_id': productId,
        'company_id': companyId,
        'sj_customer': sjCustomer,
        'sj_supplier': sjSupplier,
        'no_container': noContainer,
        'no_pto': noPto,
        'no_di': noDi,
        'no_do': noDo,
        'deliverd': delivered,
        'ujt_id': ujtId,
        'returned': 0,
        'ujt': ujt,
        'pool_id': 1,
      };

      final response = await Dio(BaseOptions(baseUrl: BaseUrl + APISJList))
          .post('', data: FormData.fromMap(data));
      print(data);
      if (response.statusCode == 200) {
        final jsonData = response.data as Map<String, dynamic>;
        print(jsonData);
        return DetailSJ.fromJSON(jsonData);
      } else {
        throw Exception(
            'Failed to post data. Status code: ${response.statusCode}');
      }
    } on DioError catch (e) {
      if (e.response != null) {
        print('DioError response status: ${e.response?.statusCode}');
        print('DioError response data: ${e.response?.data}');
      } else {
        print('DioError message: ${e.message}');
      }
      throw Exception('Failed to post data: ${e.message}');
    }
  }

  Future<DetailSJ> putDraft(
    int id, {
    required int primaryStatus,
    required int secondaryStatus,
    required String employeeId,
    required int salesTypeId,
    required String issueDate,
    required int selectedPlateNo,
    required int scheduleId,
    required int originId,
    required int plantId,
    required int productId,
    required int companyId,
    required int returned,
    required int shift,
    required String counter,
    required int ujt,
    required int orderTypeId,
    required int multiProduct,
    String sjCustomer = "",
    String sjSupplier = "",
    String noContainer = "",
    String noPto = "",
    String noDi = "",
    String noDo = "",
    int delivered = 0,
    required int ujtId,
    required int poolId,
  }) async {
    try {
      final data = {
        'multiproduct': multiProduct,
        'order_type_id': orderTypeId,
        'primary_status': primaryStatus,
        'secondary_status': secondaryStatus,
        'employee_id': employeeId,
        'sales_type_id': salesTypeId,
        'issue_date': issueDate,
        'counter': counter,
        'shift': shift,
        'fleet_id': selectedPlateNo,
        'schedule_id': scheduleId,
        'origin_id': originId,
        'plant_id': plantId,
        'product_id': productId,
        'company_id': companyId,
        'sj_customer': sjCustomer,
        'sj_supplier': sjSupplier,
        'no_container': noContainer,
        'no_pto': noPto,
        'no_di': noDi,
        'no_do': noDo,
        'deliverd': delivered,
        'ujt_id': ujtId,
        'returned': 0,
        'ujt': ujt,
        'pool_id': poolId,
      };

      final response = await Dio(BaseOptions(baseUrl: BaseUrl + APISJList))
          .put('/$id', data: FormData.fromMap(data));

      if (response.statusCode == 200) {
        final jsonData = response.data as Map<String, dynamic>;
        print(jsonData);
        return DetailSJ.fromJSON(jsonData);
      } else {
        throw Exception(
            'Failed to post data. Status code: ${response.statusCode}');
      }
    } on DioError catch (e) {
      if (e.response != null) {
        print('DioError response status: ${e.response?.statusCode}');
        print('DioError response data: ${e.response?.data}');
      } else {
        print('DioError message: ${e.message}');
      }
      throw Exception('Failed to post data: ${e.message}');
    }
  }

  Future<ConfirmModel> confirmSJ(int id, int status, String memo_ids) async {
    try {
      final response = await Dio(BaseOptions(baseUrl: BaseUrl + APIConfirm))
          .post('/$id?status=${status}&memo_ids=${memo_ids}');
      final jsonData = response.data as Map<String, dynamic>;
      print(jsonData);
      return ConfirmModel.fromJSON(jsonData);
    } on DioError catch (e) {
      if (e.response != null) {
        print('DioError response status: ${e.response?.statusCode}');
        print('DioError response data: ${e.response?.data}');
      } else {
        print('DioError message: ${e.message}');
      }
      throw Exception('Failed to post data: ${e.message}');
    }
  }

  // Future<ImageModel> postImage(int id, File imageFile) async {
  //   try {
  //     final formData = FormData.fromMap({
  //       'file': await MultipartFile.fromFile(imageFile.path),
  //     });

  //     final response = await Dio().post(
  //       BaseUrl + APIPostImage + '/$id',
  //       data: formData,
  //     );

  //     final jsonData = response.data as Map<String, dynamic>;
  //     print(jsonData);
  //     return ImageModel.fromJSON(jsonData);
  //   } on DioError catch (e) {
  //     if (e.response != null) {
  //       print('DioError response status: ${e.response!.statusCode}');
  //       print('DioError response data: ${e.response!.data}');
  //     } else {
  //       print('DioError message: ${e.message}');
  //     }
  //     throw Exception('Failed to post data: ${e.message}');
  //   }
  // }
  Future<ImageModel> postImage(int id, List<File> imageFiles) async {
    try {
      final List<MultipartFile> formDataList = [];
      for (final imageFile in imageFiles) {
        final formData = await MultipartFile.fromFile(imageFile.path);
        formDataList.add(formData);
      }

      final formData = FormData.fromMap({'file': formDataList.first});

      final response = await Dio().post(
        BaseUrl + APIPostImage + '/$id',
        data: formData,
      );

      final jsonData = response.data as Map<String, dynamic>;
      print(jsonData);
      return ImageModel.fromJSON(jsonData);
    } on DioError catch (e) {
      if (e.response != null) {
        print('DioError response status: ${e.response!.statusCode}');
        print('DioError response data: ${e.response!.data}');
      } else {
        print('DioError message: ${e.message}');
      }
      throw Exception('Failed to post data: ${e.message}');
    }
  }
}
