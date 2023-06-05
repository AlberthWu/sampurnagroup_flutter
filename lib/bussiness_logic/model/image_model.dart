import 'package:sgmobile/bussiness_logic/model/SJ_Model.dart';
import 'package:sgmobile/utils/utils.dart';

class ImageModel {
  late int errno;
  late String errmsg;
  late List<ImageData> data;

  ImageModel(this.data, this.errmsg, this.errno);

  ImageModel.fromJSON(JSON json) {
    errno = json['errno'];
    errmsg = json['errmsg'];
    data = json['data'] == null
        ? []
        : (json['data'] as List).map((e) => ImageData.fromJSON(e)).toList();
  }
}
