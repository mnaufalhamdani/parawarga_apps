class AreaUnitModel {
  AreaUnitModel({
    this.id,
    this.createdBy,
    this.createdName,
    this.name,
    this.additionalDesc,
    this.latitude,
    this.longitude,
    this.contract,
    this.isEmpty,
    this.startDate,
    this.endDate,
    this.confirmDate,
    this.message,
    this.areaName,
  });

  String? id;
  String? createdBy;
  String? createdName;
  String? name;
  String? additionalDesc;
  String? latitude;
  String? longitude;
  String? contract;
  bool? isEmpty;
  String? startDate;
  String? endDate;
  String? confirmDate;
  String? message;
  String? areaName;

  factory AreaUnitModel.fromJson(Map<String, dynamic> json){
    return AreaUnitModel(
      id: json["id"],
      createdBy: json["created_by"],
      createdName: json["created_name"],
      name: json["name"],
      additionalDesc: json["additional_desc"],
      latitude: json["latitude"],
      longitude: json["longitude"],
      contract: json["contract"],
      isEmpty: (json["is_empty"].toString() == "1") ? true : false,
      startDate: json["start_date"],
      endDate: json["end_date"],
      confirmDate: json["confirm_date"],
      message: json["message"],
      areaName: json["area_name"],
    );
  }
}