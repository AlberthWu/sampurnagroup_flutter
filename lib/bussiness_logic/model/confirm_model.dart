import 'package:sgmobile/utils/utils.dart';

class ConfirmModel {
  late String errno, errmsg;
  late ConfirmData data;
  ConfirmModel(this.data, this.errmsg, this.errno);
  ConfirmModel.fromJSON(JSON json) {
    data = ConfirmData.fromJSON(json['data']);
    errmsg = json['errmsg'];
    errno = json['errno'];
  }
}

class ConfirmData {
  late String order_id;
  ConfirmData(this.order_id);
  ConfirmData.fromJSON(JSON json) {
    order_id = json['order_id'];
  }
}
