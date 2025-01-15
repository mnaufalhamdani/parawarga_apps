class HistoryModel {
  HistoryModel({
    this.id,
    this.name,
    this.userId,
    this.createdName,
    this.message,
    this.areaId,
    this.areaName,
    this.statusName,
    this.status,
    this.updatedAt,
    this.time,
    this.typeMenu,
  });

  String? id;
  String? name;
  String? userId;
  String? createdName;
  String? message;
  String? areaId;
  String? areaName;
  String? statusName;
  int? status;
  String? updatedAt;
  String? time;
  String? typeMenu;

  factory HistoryModel.fromJson(Map<String, dynamic> json){
    return HistoryModel(
      id: json["id"],
      name: json["name"],
      userId: json["user_id"],
      createdName: json["created_name"],
      message: json["message"],
      areaId: json["area_id"],
      areaName: json["area_name"],
      statusName: json["status_name"],
      status: int.parse(json["status"] ?? "0"),
      updatedAt: json["updated_at"],
      time: json["time"],
      typeMenu: json["type_menu"],
    );
  }
}
