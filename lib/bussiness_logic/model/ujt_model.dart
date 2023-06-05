import 'package:sgmobile/utils/utils.dart';

class UJTModel {
  late int errno;
  late String errmsg;
  late DataUJT data;
  UJTModel(this.data, this.errmsg, this.errno);
  UJTModel.fromJSON(JSON json) {
    data = DataUJT.fromJSON(json['data']);
    errmsg = json['errmsg'];
    errno = json['errno'];
  }
  JSON toJSON() {
    return {'errno': errno, 'errmsg': errmsg, 'data': data.toJSON()};
  }
}

class DataUJT {
  late num id, ujt, ritase;
  DataUJT(this.id, this.ritase, this.ujt);
  DataUJT.fromJSON(JSON json) {
    id = json['id'];
    ritase = json['ritase'];
    ujt = json['ujt'];
  }
  JSON toJSON() {
    return {'id': id, 'ritase': ritase, 'ujt': ujt};
  }
}
