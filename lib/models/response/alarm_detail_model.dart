class AlarmDetailModel {
  AlarmDetailModel({
    this.id,
    this.message,
    this.latitude,
    this.longitude,
    this.generateLocation,
    this.createdBy,
    this.createdName,
    this.photo,
    this.areaName,
    this.updatedAt,
    required this.history,
  });

  String? id;
  String? message;
  String? latitude;
  String? longitude;
  String? generateLocation;
  String? createdBy;
  String? createdName;
  String? photo;
  String? areaName;
  String? updatedAt;
  List<History> history;

  factory AlarmDetailModel.fromJson(Map<String, dynamic> json){
    return AlarmDetailModel(
      id: json["id"],
      message: json["message"],
      latitude: json["latitude"],
      longitude: json["longitude"],
      generateLocation: json["generate_location"],
      createdBy: json["created_by"],
      createdName: json["created_name"],
      photo: json["photo"],
      areaName: json["area_name"],
      updatedAt: json["updated_at"],
      history: json["history"] == null ? [] : List<History>.from(json["history"]!.map((x) => History.fromJson(x))),
    );
  }
}

class History {
  History({
    this.issueId,
    this.urutan,
    this.statusId,
    this.statusName,
    this.message,
    this.updatedAt,
  });

  String? issueId;
  String? urutan;
  String? statusId;
  String? statusName;
  String? message;
  String? updatedAt;

  factory History.fromJson(Map<String, dynamic> json){
    return History(
      issueId: json["issue_id"],
      urutan: json["urutan"],
      statusId: json["status_id"],
      statusName: json["status_name"],
      message: json["message"],
      updatedAt: json["updated_at"],
    );
  }
}