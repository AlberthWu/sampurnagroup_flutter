import 'package:sgmobile/bussiness_logic/model/SJ_Model.dart';
import 'package:sgmobile/bussiness_logic/model/constant_model.dart';
import 'package:sgmobile/utils/utils.dart';

class ScheduleModel {
  late int errno;
  late String errmsg;
  late DataSchedule data;

  ScheduleModel(this.errno, this.errmsg, this.data);

  ScheduleModel.fromJSON(JSON json) {
    errno = json['errno'];
    errmsg = json['errmsg'];
    data = DataSchedule.fromJSON(json['data']);
  }
}

class DataSchedule {
  late int page, totalpage, total;
  late List<ListDataSchedule> list;
  late int? pagesize;

  DataSchedule(this.list, this.page, this.pagesize, this.total, this.totalpage);

  DataSchedule.fromJSON(JSON json) {
    list = json['list'] == null
        ? []
        : (json['list'] as List)
            .map((e) => ListDataSchedule.fromJSON(e))
            .toList();
    page = json['page'];
    pagesize = json['page_size'];
    totalpage = json['totalpage'];
    total = json['total'];
  }
}

class ListDataSchedule {
  late int id, total_do, actual, balance, limited, urgent, multi_product;
  late String schedule_no, issue_date, note;
  late Model1 sales_type_id, order_type_id;
  late Model2 company_id, origin_id, customer_id;
  late PlantId plant_id;
  late FleetTypeId fleet_type_id;
  late ProductId product_id;
  late List<OrderList> order_list;

  ListDataSchedule(
      this.multi_product,
      this.actual,
      this.balance,
      this.company_id,
      this.customer_id,
      this.fleet_type_id,
      this.id,
      this.issue_date,
      this.limited,
      this.note,
      this.order_list,
      this.order_type_id,
      this.origin_id,
      this.plant_id,
      this.product_id,
      this.sales_type_id,
      this.schedule_no,
      this.total_do,
      this.urgent);

  ListDataSchedule.fromJSON(JSON json) {
    multi_product = json['multi_product'];
    actual = json['actual'];
    balance = json['balance'];
    company_id = Model2.fromJSON(json['company_id']);
    customer_id = Model2.fromJSON(json['customer_id']);
    fleet_type_id = FleetTypeId.fromJSON(json['fleet_type_id']);
    id = json['id'];
    issue_date = json['issue_date'];
    limited = json['limited'];
    note = json['note'];
    order_list = json['order_lists'] == null
        ? []
        : (json['order_lists'] as List)
            .map((e) => OrderList.fromJSON(e))
            .toList();
    order_type_id = Model1.fromJSON(json['order_type_id']);
    origin_id = Model2.fromJSON(json['origin_id']);
    plant_id = PlantId.fromJSON(json['plant_id']);
    product_id = ProductId.fromJSON(json['product_id']);
    sales_type_id = Model1.fromJSON(json['sales_type_id']);
    schedule_no = json['schedule_no'];
    total_do = json['total_do'];
    urgent = json['urgent'];
  }
}

class OrderList {
  late int id,
      schedule_id,
      fleet_id,
      company_id,
      fleet_type_id,
      employee_id,
      coor_id,
      formation_id,
      formation_grup_id;
  late int? status_id;
  late String issue_date,
      schedule_no,
      reference_no,
      plate_no,
      company_code,
      company_name,
      fleet_type_name,
      employee_name,
      coor_name,
      formation_name,
      formation_grup_name,
      status;

  OrderList(
      this.status_id,
      this.company_code,
      this.company_id,
      this.company_name,
      this.coor_id,
      this.coor_name,
      this.employee_id,
      this.employee_name,
      this.fleet_id,
      this.fleet_type_id,
      this.fleet_type_name,
      this.formation_grup_id,
      this.formation_grup_name,
      this.formation_id,
      this.formation_name,
      this.id,
      this.issue_date,
      this.plate_no,
      this.reference_no,
      this.schedule_id,
      this.schedule_no,
      this.status);

  OrderList.fromJSON(JSON json) {
    status_id = json['status_id'];
    company_code = json['company_code'];
    company_id = json['company_id'];
    company_name = json['company_name'];
    coor_id = json['coor_id'];
    coor_name = json['coor_name'];
    employee_id = json['employee_id'];
    employee_name = json['employee_name'];
    fleet_id = json['fleet_id'];
    fleet_type_id = json['fleet_type_id'];
    fleet_type_name = json['fleet_type_name'];
    formation_grup_id = json['formation_grup_id'];
    formation_grup_name = json['formation_grup_name'];
    formation_id = json['formation_id'];
    formation_name = json['formation_name'];
    id = json['id'];
    issue_date = json['issue_date'];
    plate_no = json['plate_no'];
    reference_no = json['reference_no'];
    schedule_id = json['schedule_id'];
    schedule_no = json['schedule_no'];
    status = json['status'];
  }
}
