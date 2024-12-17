
class VerifyEncodeModel {
  String? area_generate;
  String? area_id;
  String? area_name;
  String? license_code_validation;
  String? end_date;
  String? license_type;
  String? status;
  String? kelurahan_name;
  String? provinsi_name;
  String? kabupaten_name;
  String? kecamatan_name;

  VerifyEncodeModel({
    this.area_generate,
    this.area_id,
    this.area_name,
    this.license_code_validation,
    this.end_date,
    this.license_type,
    this.status,
    this.kelurahan_name,
    this.provinsi_name,
    this.kabupaten_name,
    this.kecamatan_name,
  });

  factory VerifyEncodeModel.fromJson(dynamic json) {
    return VerifyEncodeModel(
      area_generate: json['area_generate'],
      area_id: json['area_id'],
      area_name: json['area_name'],
      license_code_validation: json['license_code_validation'],
      end_date: json['end_date'],
      license_type: json['license_type'],
      status: json['status'],
      kelurahan_name: json['kelurahan_name'],
      provinsi_name: json['provinsi_name'],
      kabupaten_name: json['kabupaten_name'],
      kecamatan_name: json['kecamatan_name'],
    );
  }
}