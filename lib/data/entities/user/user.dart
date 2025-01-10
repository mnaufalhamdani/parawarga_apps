// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:floor/floor.dart';
import 'package:intl/intl.dart';

@Entity(tableName: 'user')
class UserEntity extends Equatable {
  @PrimaryKey(autoGenerate: false)
  int id;
  String username;
  String password;
  int? pin;
  String? name;
  String? address_ktp;
  String? address_domisili;
  String? gender;
  String? divisi;
  String? email;
  String? phone;
  String? dob;
  String? pob;
  String? nik;
  String? nkk;
  String? photo_nik;
  String? photo_nkk;
  String? photo;
  int? status_keluarga;
  int? status_pekerjaan;
  int? status_agama;
  int? status_nikah;
  String? device_id;
  String? firebase_id;
  String? activated_at;
  String? blocked_at;
  String? login_at;
  String? token;
  int? newApps;
  int? status = 1;
  int? statusKirim = 0;
  String? createdAt = DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
  String? updatedAt = DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());

  UserEntity({
    required this.id,
    required this.username,
    required this.password,
    this.pin,
    this.name,
    this.address_ktp,
    this.address_domisili,
    this.gender,
    this.divisi,
    this.email,
    this.phone,
    this.dob,
    this.pob,
    this.nik,
    this.nkk,
    this.photo_nik,
    this.photo_nkk,
    this.photo,
    this.status_keluarga,
    this.status_pekerjaan,
    this.status_agama,
    this.status_nikah,
    this.device_id,
    this.firebase_id,
    this.activated_at,
    this.blocked_at,
    this.login_at,
    this.token,
    this.newApps,
    this.status,
    this.statusKirim,
    this.createdAt,
    this.updatedAt,
  });

  @override
  List<Object?> get props {
    return [
      id,
      username,
      password,
      pin,
      name,
      address_ktp,
      address_domisili,
      gender,
      divisi,
      email,
      phone,
      dob,
      pob,
      nik,
      nkk,
      photo_nik,
      photo_nkk,
      photo,
      status_keluarga,
      status_pekerjaan,
      status_agama,
      status_nikah,
      device_id,
      firebase_id,
      activated_at,
      blocked_at,
      login_at,
      token,
      newApps,
      status,
      statusKirim,
      createdAt,
      updatedAt,
    ];
  }
}
