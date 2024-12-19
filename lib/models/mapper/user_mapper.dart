import 'package:intl/intl.dart';
import 'package:parawarga_apps/core/constants.dart';
import 'package:parawarga_apps/data/entities/user/user.dart';

import '../response/login_model.dart';

UserEntity UserMapper(LoginModel model, String username, String password) {
  return UserEntity(
    id : int.parse(model.id.toString()),
    username : username,
    password : password,
    pin : stringToInt(model.pin),
    name : model.name,
    address_ktp : model.address_ktp,
    address_domisili : model.address_domisili,
    gender : model.gender,
    divisi : model.divisi,
    email : model.email,
    phone : model.phone,
    dob : model.dob,
    pob : model.pob,
    nik : binaryToStr(model.nik.toString()),
    nkk : (model.nkk != null) ? binaryToStr(model.nkk.toString()) : null,
    photo_nik : model.photo_nik,
    photo_nkk : model.photo_nkk,
    photo : model.photo,
    status_keluarga : stringToInt(model.status_keluarga),
    status_pekerjaan : stringToInt(model.status_pekerjaan),
    status_agama : stringToInt(model.status_agama),
    status_nikah : stringToInt(model.status_nikah),
    device_id : model.device_id,
    firebase_id : model.firebase_id,
    activated_at : model.activated_at,
    blocked_at : model.blocked_at,
    login_at : model.login_at,
    status : 1,
    statusKirim : 0,
    createdAt : DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()),
    updatedAt : DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()),
  );
}