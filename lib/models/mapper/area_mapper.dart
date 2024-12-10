import 'package:intl/intl.dart';
import 'package:parawarga_apps/core/constants.dart';
import 'package:parawarga_apps/data/entities/area/area.dart';

import '../response/login_model.dart';

AreaEntity AreaMapper(LoginAreaModel model) {
  if(model.license_code_validation == null){
    model.license_type = LicenseType.BLOCK.name;
    model.status = "0";
  }else{
    final currDate = DateTime.now();
    final endDate = DateFormat("yyyy-MM-dd HH:mm:ss").parse(model.end_date.toString());
    if(model.license_type == LicenseType.TRIAL.name && dateBetween(currDate, endDate) < 0){
      model.license_type = LicenseType.EXPIRED.name;
    } else if(model.license_type == LicenseType.EXPIRED.name && dateBetween(currDate, DateTime(endDate.year, endDate.month + 6, endDate.day)) < 0){
      model.license_type = LicenseType.BLOCK.name;
      model.status = "0";
    }
  }

  return AreaEntity(
    area_id : stringToInt(model.area_id) ?? 1,
    area_name : model.area_name.toString(),
    address : model.address.toString(),
    role_id : stringToInt(model.role_id),
    license_code_validation : model.license_code_validation,
    end_date : model.end_date,
    license_type : model.license_type,
    kelurahan_name : model.kelurahan_name,
    provinsi_name : model.provinsi_name,
    kabupaten_name : model.kabupaten_name,
    kecamatan_name : model.kecamatan_name,
    status : stringToInt(model.status ?? "0"),
    statusKirim : 0,
    createdAt : DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()),
    updatedAt : DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()),
  );
}