class AreaUnitModel {
  AreaUnitModel({
    required this.id,
    required this.createdBy,
    required this.createdName,
    required this.name,
    required this.additionalDesc,
    required this.latitude,
    required this.longitude,
    required this.contract,
    required this.emptyId,
    required this.startDate,
    required this.endDate,
    required this.confirmDate,
    required this.message,
    required this.areaName,
  });

  final String? id;
  final String? createdBy;
  final String? createdName;
  final String? name;
  final String? additionalDesc;
  final String? latitude;
  final String? longitude;
  final String? contract;
  final String? emptyId;
  final String? startDate;
  final String? endDate;
  final String? confirmDate;
  final String? message;
  final String? areaName;

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
      emptyId: json["empty_id"],
      startDate: json["start_date"],
      endDate: json["end_date"],
      confirmDate: json["confirm_date"],
      message: json["message"],
      areaName: json["area_name"],
    );
  }
}