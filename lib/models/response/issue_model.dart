class IssueModel {
  String? id;
  String? title;
  String? message;
  String? additionalLocation;
  String? createdBy;
  String? createdName;
  String? areaName;
  String? attachment;
  String? updatedAt;

  IssueModel({
    this.id,
    this.title,
    this.message,
    this.additionalLocation,
    this.createdBy,
    this.createdName,
    this.areaName,
    this.attachment,
    this.updatedAt,
  });

  factory IssueModel.fromJson(Map<String, dynamic> json){
    return IssueModel(
      id: json["id"],
      title: json["title"],
      message: json["message"],
      additionalLocation: json["additional_location"],
      createdBy: json["created_by"],
      createdName: json["created_name"],
      areaName: json["area_name"],
      attachment: json["attachment"],
      updatedAt: json["updated_at"],
    );
  }
}
