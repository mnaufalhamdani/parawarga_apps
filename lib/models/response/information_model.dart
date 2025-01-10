class InformationModel {
  InformationModel({
    this.id,
    this.title,
    this.message,
    this.expired,
    this.urgent,
    this.createdBy,
    this.createdName,
    this.areaName,
    this.updatedAt,
  });

  String? id;
  String? title;
  String? message;
  String? expired;
  String? urgent;
  String? createdBy;
  String? createdName;
  String? areaName;
  String? updatedAt;

  factory InformationModel.fromJson(Map<String, dynamic> json){
    return InformationModel(
      id: json["id"],
      title: json["title"],
      message: json["message"],
      expired: json["expired"],
      urgent: json["urgent"],
      createdBy: json["created_by"],
      createdName: json["created_name"],
      areaName: json["area_name"],
      updatedAt: json["updated_at"],
    );
  }
}
