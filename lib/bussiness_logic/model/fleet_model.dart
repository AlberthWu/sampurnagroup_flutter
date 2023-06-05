import 'package:sgmobile/bussiness_logic/model/SJ_Model.dart';
import 'package:sgmobile/bussiness_logic/model/constant_model.dart';
import 'package:sgmobile/utils/utils.dart';

class FleetModel {
  late int errno;
  late String errmsg;
  late List<DataFleet> data;

  FleetModel(this.data, this.errmsg, this.errno);

  FleetModel.fromJSON(JSON json) {
    errno = json['errno'];
    errmsg = json['errmsg'];
    data = json['data'] == null
        ? []
        : (json['data'] as List).map((e) => DataFleet.fromJSON(e)).toList();
  }
}

class DataFleet {
  late int id;
  late String plate_no;
  late FleetTypeId fleet_type_id;
  late Model1 sales_type_id;

  DataFleet(this.fleet_type_id, this.id, this.plate_no, this.sales_type_id);

  DataFleet.fromJSON(JSON json) {
    id = json['id'];
    plate_no = json['plate_no'];
    fleet_type_id = FleetTypeId.fromJSON(json['fleet_type_id']);
    sales_type_id = Model1.fromJSON(json['sales_type_id']);
  }

  JSON toJSON() {
    return {
      'id': id,
      'plate_no': plate_no,
      'fleet_type_id': fleet_type_id.toJSON(),
      'sales_type_id': sales_type_id.toJSON()
    };
  }
}
