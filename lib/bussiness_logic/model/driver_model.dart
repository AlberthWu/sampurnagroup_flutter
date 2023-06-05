import 'package:sgmobile/bussiness_logic/model/constant_model.dart';
import 'package:sgmobile/utils/utils.dart';

class DriverModel {
  late int errno;
  late String errmsg;
  late DataDriver data;

  DriverModel(this.data, this.errmsg, this.errno);

  DriverModel.fromJSON(JSON json) {
    errmsg = json['errmsg'];
    errno = json['errno'];
    data = DataDriver.fromJSON(json['data']);
  }
}

class DataDriver {
  late Model6? primary_driver;
  late Model6? secondary_driver;

  DataDriver(this.primary_driver, this.secondary_driver);

  DataDriver.fromJSON(JSON json) {
    primary_driver = (json['primary_driver'] == null
        ? null
        : Model6.fromJSON(json['primary_driver']));
    secondary_driver = (json['secondary_driver'] == null
        ? null
        : Model6.fromJSON(json['secondary_driver']));
  }

  JSON toJSON() {
    return {
      'primary_driver': primary_driver,
      'secondary_driver': secondary_driver
    };
  }
}
