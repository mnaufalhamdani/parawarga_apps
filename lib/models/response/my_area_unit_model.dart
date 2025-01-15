class MyAreaUnitModel {
  MyAreaUnitModel({
    this.id,
    this.areaId,
    this.areaName,
    this.startDate,
    this.endDate,
    this.rt,
    this.rw,
    this.phone,
    this.photoArea,
    this.totalUnit,
    this.totalUser,
    this.kelurahanName,
    this.provinsiName,
    this.kabupatenName,
    this.kecamatanName,
    required this.detail,
    required this.unit,
  });

  String? id;
  String? areaId;
  String? areaName;
  String? startDate;
  String? endDate;
  String? rt;
  String? rw;
  String? phone;
  String? photoArea;
  String? totalUnit;
  String? totalUser;
  String? kelurahanName;
  String? provinsiName;
  String? kabupatenName;
  String? kecamatanName;
  List<Detail> detail;
  List<Unit> unit;

  factory MyAreaUnitModel.fromJson(Map<String, dynamic> json){
    return MyAreaUnitModel(
      id: json["id"],
      areaId: json["area_id"],
      areaName: json["area_name"],
      startDate: json["start_date"],
      endDate: json["end_date"],
      rt: json["rt"],
      rw: json["rw"],
      phone: json["phone"],
      photoArea: json["photo_area"],
      totalUnit: json["total_unit"],
      totalUser: json["total_user"],
      kelurahanName: json["kelurahan_name"],
      provinsiName: json["provinsi_name"],
      kabupatenName: json["kabupaten_name"],
      kecamatanName: json["kecamatan_name"],
      detail: json["detail"] == null ? [] : List<Detail>.from(json["detail"]!.map((x) => Detail.fromJson(x))),
      unit: json["unit"] == null ? [] : List<Unit>.from(json["unit"]!.map((x) => Unit.fromJson(x))),
    );
  }

}

class Detail {
  Detail({
    this.managementId,
    this.userId,
    this.keterangan,
    this.positionName,
    this.name,
  });

  String? managementId;
  String? userId;
  String? keterangan;
  String? positionName;
  String? name;

  factory Detail.fromJson(Map<String, dynamic> json){
    return Detail(
      managementId: json["management_id"],
      userId: json["user_id"],
      keterangan: json["keterangan"],
      positionName: json["position_name"],
      name: json["name"],
    );
  }
}

class Unit {
  Unit({
    this.id,
    this.name,
    this.additionalDesc,
    this.latitude,
    this.longitude,
    this.contract,
    this.emptyId,
  });

  String? id;
  String? name;
  String? additionalDesc;
  String? latitude;
  String? longitude;
  String? contract;
  String? emptyId;

  factory Unit.fromJson(Map<String, dynamic> json){
    return Unit(
      id: json["id"],
      name: json["name"],
      additionalDesc: json["additional_desc"],
      latitude: json["latitude"],
      longitude: json["longitude"],
      contract: json["contract"],
      emptyId: json["empty_id"],
    );
  }
}