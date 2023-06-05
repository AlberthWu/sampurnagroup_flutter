import 'package:sgmobile/bussiness_logic/model/constant_model.dart';
import 'package:sgmobile/utils/utils.dart';

class SJModel {
  late int errno;
  late String errmsg;
  late DataSJ data;

  SJModel(this.errno, this.errmsg, this.data);

  SJModel.fromJSON(JSON json) {
    errno = json['errno'];
    errmsg = json['errmsg'];
    data = DataSJ.fromJSON(json['data']);
  }
}

class DataSJ {
  late int page, totalpage, total;
  late List<ListDataSJ> list;
  late int? pagesize;

  DataSJ(this.list, this.page, this.pagesize, this.total, this.totalpage);

  DataSJ.fromJSON(JSON json) {
    list = json['list'] == null
        ? []
        : (json['list'] as List).map((e) => ListDataSJ.fromJSON(e)).toList();
    page = json['page'];
    pagesize = json['page_size'];
    totalpage = json['totalpage'];
    total = json['total'];
  }
}

class DetailSJ {
  late int errno;
  late String errmsg;
  late ListDataSJ data;
  DetailSJ(this.data, this.errmsg, this.errno);
  DetailSJ.fromJSON(JSON json) {
    errno = json['errno'];
    errmsg = json['errmsg'];
    data = ListDataSJ.fromJSON(json['data']);
  }
}

class ListDataSJ {
  late num id,
      shift,
      do_id,
      ujt_id,
      ujt,
      length,
      final_shift,
      confirm_ujt,
      period,
      primary_status,
      secondary_status,
      returned,
      multi_product;
  late int? status_id;
  late String issue_date, counter, do_no, uom, note, memo_additional, status;
  late String? confirm_ujt_date,
      reference_no,
      receive_no,
      receive_date,
      return_at,
      closed_at;
  late Model1 sales_type_id;
  late Model2 company_id;
  late ScheduleID schedule_id;
  late Model3 pool_id;
  late PoId po_id;
  late Model1 order_type_id;
  late Model2 origin_id;
  late Model2 customer_id;
  late PlantId plant_id;
  late ProductId product_id;
  late FleetId fleet_id;
  late Model2 transporter_id;
  late FleetTypeId fleet_type_id;
  late FormationId formation_id;
  late Model3? formation_group_id;
  late EmployeeId employee_id;
  late Model6? primary_driver;
  late Model6? secondary_driver;
  late List<ImageData> image_data;

  ListDataSJ(
      this.multi_product,
      this.closed_at,
      this.company_id,
      this.confirm_ujt,
      this.confirm_ujt_date,
      this.counter,
      this.customer_id,
      this.do_id,
      this.do_no,
      this.employee_id,
      this.final_shift,
      this.fleet_id,
      this.fleet_type_id,
      this.formation_group_id,
      this.formation_id,
      this.id,
      this.issue_date,
      this.length,
      this.memo_additional,
      this.note,
      this.order_type_id,
      this.origin_id,
      this.period,
      this.plant_id,
      this.po_id,
      this.pool_id,
      this.product_id,
      this.receive_no,
      this.reference_no,
      this.receive_date,
      this.return_at,
      this.returned,
      this.sales_type_id,
      this.schedule_id,
      this.shift,
      this.status,
      this.status_id,
      this.transporter_id,
      this.ujt,
      this.ujt_id,
      this.uom,
      this.primary_driver,
      this.primary_status,
      this.secondary_driver,
      this.secondary_status,
      this.image_data);

  ListDataSJ.fromJSON(JSON json) {
    closed_at = json['closed_at'];
    company_id = Model2.fromJSON(json['company_id']);
    confirm_ujt = json['confirm_ujt'];
    confirm_ujt_date = json['confirm_ujt_date'];
    counter = json['counter'];
    customer_id = Model2.fromJSON(json['customer_id']);
    do_id = json['do_id'];
    do_no = json['do_no'];
    employee_id = EmployeeId.fromJSON(json['employee_id']);
    final_shift = json['final_shift'];
    fleet_id = FleetId.fromJSON(json['fleet_id']);
    fleet_type_id = FleetTypeId.fromJSON(json['fleet_type_id']);
    // formation_group_id = Model3.fromJSON(json['formation_group_id']);
    formation_group_id = json['formation_group_id'] == null
        ? null
        : Model3.fromJSON(json['formation_group_id']);
    formation_id = FormationId.fromJSON(json['formation_id']);
    id = json['id'];
    issue_date = json['issue_date'];
    length = json['length'];
    memo_additional = json['memo_additional'];
    multi_product = json['multi_product'];
    note = json['note'];
    order_type_id = Model1.fromJSON(json['order_type_id']);
    origin_id = Model2.fromJSON(json['origin_id']);
    period = json['period'];
    plant_id = PlantId.fromJSON(json['plant_id']);
    po_id = PoId.fromJSON(json['po_id']);
    pool_id = Model3.fromJSON(json['pool_id']);
    product_id = ProductId.fromJSON(json['product_id']);
    receive_no = json['receive_no'];
    reference_no = json['reference_no'];
    receive_date = json['receive_date'];
    return_at = json['return_at'];
    returned = json['returned'];
    sales_type_id = Model1.fromJSON(json['sales_type_id']);
    schedule_id = ScheduleID.fromJSON(json['schedule_id']);
    shift = json['shift'];
    status = json['status'];
    status_id = json['status_id'];
    transporter_id = Model2.fromJSON(json['transporter_id']);
    ujt = json['ujt'];
    ujt_id = json['ujt_id'];
    uom = json['uom'];
    primary_status = json['primary_status'];
    secondary_status = json['secondary_status'];
    primary_driver = (json['primary_driver'] == null
        ? null
        : Model6.fromJSON(json['primary_driver']));
    secondary_driver = (json['secondary_driver'] == null
        ? null
        : Model6.fromJSON(json['secondary_driver']));
    image_data = (json['image_data']) == null
        ? []
        : (json['image_data'] as List)
            .map((e) => ImageData.fromJSON(e))
            .toList();
  }

  Map<String, dynamic> toJSON() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['closed_at'] = closed_at;
    data['company_id'] = company_id?.toJSON;
    data['confirm_ujt'] = confirm_ujt;
    data['confirm_ujt_date'] = confirm_ujt_date;
    data['counter'] = counter;
    data['customer_id'] = customer_id?.toJSON;
    data['do_id'] = do_id;
    data['do_no'] = do_no;
    data['employee_id'] = employee_id?.toJSON;
    data['final_shift'] = final_shift;
    data['fleet_id'] = fleet_id?.toJSON;
    data['fleet_type_id'] = fleet_type_id?.toJSON;
    data['formation_group_id'] = formation_group_id?.toJSON;
    data['formation_id'] = formation_id?.toJSON;
    data['id'] = id;
    data['issue_date'] = issue_date;
    data['length'] = length;
    data['memo_additional'] = memo_additional;
    data['multi_product'] = multi_product;
    data['note'] = note;
    data['order_type_id'] = order_type_id?.toJSON;
    data['origin_id'] = origin_id?.toJSON;
    data['period'] = period;
    data['plant_id'] = plant_id?.toJSON;
    data['po_id'] = po_id?.toJSON;
    data['pool_id'] = pool_id?.toJSON;
    data['product_id'] = product_id?.toJSON;
    data['receive_no'] = receive_no;
    data['reference_no'] = reference_no;
    data['receive_date'] = receive_date;
    data['return_at'] = return_at;
    data['returned'] = returned;
    data['sales_type_id'] = sales_type_id?.toJSON;
    data['schedule_id'] = schedule_id?.toJSON;
    data['shift'] = shift;
    data['status'] = status;
    data['status_id'] = status_id;
    data['transporter_id'] = transporter_id?.toJSON;
    data['ujt'] = ujt;
    data['ujt_id'] = ujt_id;
    data['uom'] = uom;
    data['primary_status'] = primary_status;
    data['secondary_status'] = secondary_status;
    data['primary_driver'] = primary_driver?.toJSON;
    data['secondary_driver'] = secondary_driver?.toJSON;
    data['image_data'] =
        image_data.map((x) => x.toJson()).toList(growable: false);
    return data;
  }
}

class ImageData {
  late int id;
  late String image_data;
  ImageData(this.id, this.image_data);
  ImageData.fromJSON(JSON json) {
    id = json['id'];
    image_data = json['image_data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['image_data'] = image_data;
    return data;
  }
}

class ScheduleID {
  late int id, total_do, actual, balance, limited, urgent;
  late String schedule_no, issue_date, note;

  ScheduleID(this.actual, this.balance, this.id, this.issue_date, this.limited,
      this.note, this.schedule_no, this.total_do, this.urgent);

  ScheduleID.fromJSON(JSON json) {
    actual = json['actual'];
    balance = json['balance'];
    id = json['id'];
    issue_date = json['issue_date'];
    limited = json['limited'];
    note = json['note'];
    schedule_no = json['schedule_no'];
    total_do = json['total_do'];
    urgent = json['urgent'];
  }

  JSON get toJSON => {
        'id': id,
        'schedule_no': schedule_no,
        'issue_date': issue_date,
        'note': note,
        'total_do': total_do,
        'actual': actual,
        'balance': balance,
        'limited': limited,
        'urgent': urgent,
      };
}

class Model3 {
  late int id, status;
  late String name;

  Model3(this.id, this.name, this.status);

  Model3.fromJSON(JSON json) {
    id = json['id'];
    name = json['name'];
    status = json['status'];
  }

  JSON get toJSON => {
        'id': id,
        'name': name,
        'status': status,
      };
}

class PoId {
  late int id, price;
  late String referenceNo;

  PoId(this.id, this.referenceNo, this.price);

  PoId.fromJSON(JSON json) {
    id = json['id'];
    referenceNo = json['reference_no'];
    price = json['price'];
  }

  JSON get toJSON => {
        'id': id,
        'reference_no': referenceNo,
        'price': price,
      };
}

class PlantId {
  late int id, companyId;
  late String name, fullName;

  PlantId(this.id, this.name, this.fullName, this.companyId);

  PlantId.fromJSON(JSON json) {
    id = json['id'];
    name = json['name'];
    fullName = json['full_name'];
    companyId = json['company_id'];
  }

  JSON get toJSON => {
        'id': id,
        'name': name,
        'full_name': fullName,
        'company_id': companyId,
      };
}

class ProductId {
  late int id, status, isDo;
  late String name;

  ProductId(this.id, this.name, this.status, this.isDo);

  ProductId.fromJSON(JSON json) {
    id = json['id'];
    name = json['name'];
    status = json['status'];
    isDo = json['is_do'];
  }

  JSON get toJSON => {
        'id': id,
        'name': name,
        'status': status,
        'is_do': isDo,
      };
}

class FleetId {
  late int id, companyId, fleetTypeId, status;
  late String plateNo, companyCode, companyName, fleetTypeName;
  late num volume, height, width, length;

  FleetId(
      this.id,
      this.plateNo,
      this.companyId,
      this.companyCode,
      this.companyName,
      this.fleetTypeId,
      this.fleetTypeName,
      this.length,
      this.width,
      this.height,
      this.volume,
      this.status);

  FleetId.fromJSON(JSON json) {
    id = json['id'];
    plateNo = json['plate_no'];
    companyId = json['company_id'];
    companyCode = json['company_code'];
    companyName = json['company_name'];
    fleetTypeId = json['fleet_type_id'];
    fleetTypeName = json['fleet_type_name'];
    length = json['length'];
    width = json['width'];
    height = json['height'];
    volume = json['volume'];
    status = json['status'];
  }

  JSON get toJSON => {
        'id': id,
        'plate_no': plateNo,
        'company_id': companyId,
        'company_code': companyCode,
        'company_name': companyName,
        'fleet_type_id': fleetTypeId,
        'fleet_type_name': fleetTypeName,
        'length': length,
        'width': width,
        'height': height,
        'volume': volume,
        'status': status,
      };
}

class FleetTypeId {
  late int id, isSpk, parentId;
  late String name;

  FleetTypeId(this.id, this.name, this.isSpk, this.parentId);

  FleetTypeId.fromJSON(JSON json) {
    id = json['id'];
    name = json['name'];
    isSpk = json['is_spk'];
    parentId = json['parent_id'];
  }

  JSON toJSON() {
    return {
      'id': id,
      'name': name,
      'is_spk': isSpk,
      'parent_id': parentId,
    };
  }
}

class FormationId {
  late int id, status, parentId;
  late String name;

  FormationId(this.id, this.name, this.status, this.parentId);

  FormationId.fromJSON(JSON json) {
    id = json['id'];
    name = json['name'];
    status = json['status'];
    parentId = json['parent_id'];
  }

  JSON get toJSON => {
        'id': id,
        'name': name,
        'status': status,
        'parent_id': parentId,
      };
}

class EmployeeId {
  late int id;
  late String nik, name, alias, bankNo, bankAccountName;
  late BankId bankId;
  late String? imageData;

  EmployeeId(this.id, this.nik, this.name, this.alias, this.bankId, this.bankNo,
      this.bankAccountName, this.imageData);

  EmployeeId.fromJSON(JSON json) {
    id = json['id'];
    nik = json['nik'];
    name = json['name'];
    alias = json['alias'];
    bankId = BankId.fromJSON(json['bank_id']);
    bankNo = json['bank_no'];
    bankAccountName = json['bank_account_name'];
    imageData = json['image_data'];
  }

  JSON get toJSON => {
        'id': id,
        'nik': nik,
        'name': name,
        'alias': alias,
        'bank_id': bankId.toJSON,
        'bank_no': bankNo,
        'bank_account_name': bankAccountName,
        'image_data': imageData,
      };
}

class BankId {
  late int id;
  late String name, swift;

  BankId(this.id, this.name, this.swift);

  BankId.fromJSON(JSON json) {
    id = json['id'];
    name = json['name'];
    swift = json['swift'];
  }

  JSON toJSON() {
    return {
      'id': id,
      'name': name,
      'swift': swift,
    };
  }
}
