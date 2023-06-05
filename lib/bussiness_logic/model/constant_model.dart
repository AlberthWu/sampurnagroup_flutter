import 'package:sgmobile/bussiness_logic/model/SJ_Model.dart';
import 'package:sgmobile/utils/utils.dart';

class Model1 {
  late int id;
  late int? company_id;
  late String name;

  Model1(this.id, this.name, this.company_id);

  Model1.fromJSON(JSON json) {
    id = json['id'];
    name = json['name'];
    company_id = json['company_id'];
  }

  Map<String, dynamic> toJSON() {
    return {
      'id': id,
      'name': name,
      'company_id': company_id,
    };
  }
}

class Model2 {
  late int id, status;
  late String name, code;

  Model2(this.id, this.status, this.name, this.code);

  Model2.fromJSON(JSON json) {
    id = json['id'];
    name = json['name'];
    status = json['status'];
    code = json['code'];
  }

  JSON toJSON() {
    return {'id': id, 'name': name, 'status': status, 'code': code};
  }
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

  JSON toJSON() {
    return {
      'id': id,
      'name': name,
      'status': status,
    };
  }
}

class Model4 {
  late int id;
  late String name, created_at, updated_at, deleted_at;
  Model4(this.id, this.name, this.created_at, this.deleted_at, this.updated_at);
  Model4.fromJSON(JSON json) {
    id = json['id'];
    name = json['name'];
    created_at = json['created_at'];
    deleted_at = json['deleted_at'];
    updated_at = json['updated_at'];
  }

  JSON toJSON() {
    return {
      'id': id,
      'created_at': created_at,
      'deleted_at': deleted_at,
      'updated_at': updated_at
    };
  }
}

class Model5 {
  late int id;
  late String name;

  Model5(this.id, this.name);
  Model5.fromJSON(JSON json) {
    id = json['id'];
    name = json['name'];
  }
  JSON toJSON() {
    return {'id': id, 'name': name};
  }
}

class Model6 {
  late int id, license_card, license_on_hold, status;
  late String nik,
      name,
      alias,
      living_address,
      phone,
      status_employee,
      sex,
      religion,
      bank_no,
      license_type;
  late String? license_no, image_data, license_exp_date, license_issue_date;
  late Model2 company_id;
  late Model4 department_id;
  late Model4 division_id;
  late Model4 occupation_id;
  late Model5 city_id;
  late Model5 license_city_id;
  late Model2 parent_id;
  late BankId bank_id;
  late List<Model7> employee_memo_pot_current;
  late List<Model7> employee_memo_pot;

  Model6(
      this.license_exp_date,
      this.license_issue_date,
      this.bank_no,
      this.license_type,
      this.religion,
      this.sex,
      this.alias,
      this.bank_id,
      this.city_id,
      this.company_id,
      this.department_id,
      this.division_id,
      this.id,
      this.image_data,
      this.license_card,
      this.license_city_id,
      this.license_no,
      this.license_on_hold,
      this.living_address,
      this.name,
      this.nik,
      this.occupation_id,
      this.parent_id,
      this.phone,
      this.status,
      this.status_employee,
      this.employee_memo_pot,
      this.employee_memo_pot_current);

  Model6.fromJSON(JSON json) {
    license_exp_date = json['license_exp_date'];
    license_issue_date = json['license_issue_date'];
    bank_no = json['bank_no'];
    license_no = json['license_no'];
    license_type = json['license_type'];
    religion = json['religion'];
    sex = json['sex'];
    alias = json['alias'];
    bank_id = BankId.fromJSON(json['bank_id']);
    city_id = Model5.fromJSON(json['city_id']);
    company_id = Model2.fromJSON(json['company_id']);
    department_id = Model4.fromJSON(json['department_id']);
    division_id = Model4.fromJSON(json['division_id']);
    id = json['id'];
    image_data = json['image_data'];
    license_card = json['license_card'];
    license_city_id = Model5.fromJSON(json['license_city_id']);
    license_on_hold = json['license_on_hold'];
    living_address = json['living_address'];
    name = json['name'];
    nik = json['nik'];
    occupation_id = Model4.fromJSON(json['occupation_id']);
    parent_id = Model2.fromJSON(json['parent_id']);
    phone = json['phone'];
    status = json['status'];
    status_employee = json['status_employee'];
    employee_memo_pot = json['employee_memo_pot'] == null
        ? []
        : (json['employee_memo_pot'] as List)
            .map((e) => Model7.fromJSON(e))
            .toList();
    employee_memo_pot_current = json['employee_memo_pot_current'] == null
        ? []
        : (json['employee_memo_pot_current'] as List)
            .map((e) => Model7.fromJSON(e))
            .toList();
  }

  Map<String, dynamic> toJSON() {
    return {
      'license_exp_date': license_exp_date,
      'license_issue_date,': license_issue_date,
      'bank_no': bank_no,
      'license_type': license_type,
      'religion': religion,
      'sex': sex,
      'alias': alias,
      'bank_id': bank_id.toJSON(),
      'city_id': city_id.toJSON(),
      'company_id': company_id.toJSON(),
      'department_id': department_id.toJSON(),
      'division_id': division_id.toJSON(),
      'id': id,
      'image_data': image_data,
      'license_card': license_card,
      'license_city_id': license_city_id.toJSON(),
      'license_no': license_no,
      'license_on_hold': license_on_hold,
      'living_address': living_address,
      'name': name,
      'nik': nik,
      'occupation_id': occupation_id.toJSON(),
      'parent_id': parent_id.toJSON(),
      'phone': phone,
      'status': status,
      'status_employee': status_employee,
      'employee_memo_pot':
          employee_memo_pot.map((e) => e.toJSON()).toList(growable: false),
      'employee_memo_pot_current': employee_memo_pot_current
          .map((e) => e.toJSON())
          .toList(growable: false),
    };
  }
}

class Model7 {
  late int id, ujt, final_ujt, ujt_var, ujt_void, bonus_claim, total, rn;
  late String reference_no, status;

  Model7(this.bonus_claim, this.final_ujt, this.id, this.reference_no, this.rn,
      this.status, this.total, this.ujt, this.ujt_var, this.ujt_void);
  Model7.fromJSON(JSON json) {
    bonus_claim = json['bonus_claim'];
    final_ujt = json['final_ujt'];
    id = json['id'];
    reference_no = json['reference_no'];
    rn = json['rn'];
    status = json['status'];
    total = json['total'];
    ujt = json['ujt'];
    ujt_var = json['ujt_var'];
    ujt_void = json['ujt_void'];
  }
  JSON toJSON() {
    return {
      'bonus_claim': bonus_claim,
      'final_ujt': final_ujt,
      'id': id,
      'reference_no': reference_no,
      'rn': rn,
      'status': status,
      'total': total,
      'ujt': ujt,
      'ujt_var': ujt_var,
      'ujt_void': ujt_void,
    };
  }
}
