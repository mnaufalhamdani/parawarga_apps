class IssueDetailModel {
  IssueDetailModel({
    this.id,
    this.title,
    this.message,
    this.latitude,
    this.longitude,
    this.generateLocation,
    this.additionalLocation,
    this.createdBy,
    this.createdName,
    this.areaName,
    this.updatedAt,
    required this.history,
    required this.attachment,
  });

  String? id;
  String? title;
  String? message;
  String? latitude;
  String? longitude;
  String? generateLocation;
  String? additionalLocation;
  String? createdBy;
  String? createdName;
  String? areaName;
  String? updatedAt;
  List<History> history;
  List<Attachment> attachment;

  factory IssueDetailModel.fromJson(Map<String, dynamic> json){
    return IssueDetailModel(
      id: json["id"],
      title: json["title"],
      message: json["message"],
      latitude: json["latitude"],
      longitude: json["longitude"],
      generateLocation: json["generate_location"],
      additionalLocation: json["additional_location"],
      createdBy: json["created_by"],
      createdName: json["created_name"],
      areaName: json["area_name"],
      updatedAt: json["updated_at"],
      history: json["history"] == null ? [] : List<History>.from(json["history"]!.map((x) => History.fromJson(x))),
      attachment: json["attachment"] == null ? [] : List<Attachment>.from(json["attachment"]!.map((x) => Attachment.fromJson(x))),
    );
  }

}

class Attachment {
  Attachment({
    this.issueId,
    this.urutan,
    this.urutanIssueHistory,
    this.statusId,
    this.statusName,
    this.attachment,
    this.updatedAt,
  });

  String? issueId;
  String? urutan;
  String? urutanIssueHistory;
  String? statusId;
  String? statusName;
  String? attachment;
  String? updatedAt;

  factory Attachment.fromJson(Map<String, dynamic> json){
    return Attachment(
      issueId: json["issue_id"],
      urutan: json["urutan"],
      urutanIssueHistory: json["urutan_issue_history"],
      statusId: json["status_id"],
      statusName: json["status_name"],
      attachment: json["attachment"],
      updatedAt: json["updated_at"],
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
