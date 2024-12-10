// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:floor/floor.dart';
import 'package:intl/intl.dart';

enum LicenseType { TRIAL, SUBSCRIBE, BLOCK, EXPIRED }

@Entity(tableName: 'area')
class AreaEntity extends Equatable {
  @PrimaryKey(autoGenerate: false)
  int area_id;
  String area_name;
  String address;
  int? role_id;
  String? license_code_validation;
  String? end_date;
  String? license_type = LicenseType.BLOCK.name;
  String? kelurahan_name;
  String? provinsi_name;
  String? kabupaten_name;
  String? kecamatan_name;
  int? status = 1;
  int? statusKirim = 0;
  String? createdAt = DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
  String? updatedAt = DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());

  AreaEntity({
    required this.area_id,
    required this.area_name,
    required this.address,
    this.role_id,
    this.license_code_validation,
    this.end_date,
    this.license_type,
    this.kelurahan_name,
    this.provinsi_name,
    this.kabupaten_name,
    this.kecamatan_name,
    this.status,
    this.statusKirim,
    this.createdAt,
    this.updatedAt,
  });

  @override
  List<Object?> get props {
    return [
      area_id,
      area_name,
      address,
      role_id,
      license_code_validation,
      end_date,
      license_type,
      kelurahan_name,
      provinsi_name,
      kabupaten_name,
      kecamatan_name,
      status,
      statusKirim,
      createdAt,
      updatedAt,
    ];
  }
}
