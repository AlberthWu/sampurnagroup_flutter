import 'package:sgmobile/bussiness_logic/model/schedule_model.dart';
import 'package:sgmobile/utils/utils.dart';

class ScheduleDetailModel {
  late int errno;
  late String errmsg;
  late ListDataSchedule data;

  ScheduleDetailModel(this.data, this.errmsg, this.errno);

  ScheduleDetailModel.fromJSON(JSON json) {
    errno = json['errno'];
    errmsg = json['errmsg'];
    data = ListDataSchedule.fromJSON(json['data']);
  }
}
