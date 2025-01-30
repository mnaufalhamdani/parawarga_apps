class ViewDashboardModel {
  ViewDashboardModel({
    this.userId,
    this.totalArea,
    this.totalUnit,
    this.totalUnitEmpty,
    required this.alarm,
    required this.information,
    required this.issue
  });

  String? userId;
  String? totalArea;
  String? totalUnit;
  String? totalUnitEmpty;
  List<Alarm> alarm;
  List<Information> information;
  List<Issue> issue;

  factory ViewDashboardModel.fromJson(Map<String, dynamic> json) {
    return ViewDashboardModel(
      userId: json['user_id'],
      totalArea: json['total_area'],
      totalUnit: json['total_unit'],
      totalUnitEmpty: json['total_unit_empty'],
      alarm: json['alarm'] == null ? [] : List<Alarm>.from(json["alarm"]!.map((x) => Alarm.fromJson(x))),
      information: json['information'] == null ? [] : List<Information>.from(json["information"]!.map((x) => Information.fromJson(x))),
      issue: json['issue'] == null ? [] : List<Issue>.from(json["issue"]!.map((x) => Issue.fromJson(x))),
    );
  }
}

class Alarm {
  Alarm({
    this.id,
    this.areaId,
    this.message,
    this.generateLocation,
    this.createdBy,
    this.createdName,
    this.areaName,
    this.updatedAt
  });

  String? id;
  String? areaId;
  String? message;
  String? generateLocation;
  String? createdBy;
  String? createdName;
  String? areaName;
  String? updatedAt;

  factory Alarm.fromJson(Map<String, dynamic> json) {
    return Alarm(
      id: json['id'],
      areaId: json['area_id'],
      message: json['message'],
      generateLocation: json['generate_location'],
      createdBy: json['created_by'],
      createdName: json['created_name'],
      areaName: json['area_name'],
      updatedAt: json['updated_at'],
    );
  }
}

class Information {
  Information({
    this.id,
    this.title,
    this.message,
    this.expired,
    this.urgent,
    this.createdBy,
    this.createdName,
    this.areaName,
    this.updatedAt
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

  factory Information.fromJson(Map<String, dynamic> json) {
    return Information(
      id: json['id'],
      title: json['title'],
      message: json['message'],
      expired: json['expired'],
      urgent: json['urgent'],
      createdBy: json['created_by'],
      createdName: json['created_name'],
      areaName: json['area_name'],
      updatedAt: json['updated_at'],
    );
  }
}

class Issue {
  Issue({
    this.id,
    this.title,
    this.message,
    this.additionalLocation,
    this.createdBy,
    this.createdName,
    this.areaName,
    this.attachment,
    this.updatedAt
  });

  String? id;
  String? title;
  String? message;
  String? additionalLocation;
  String? createdBy;
  String? createdName;
  String? areaName;
  String? attachment;
  String? updatedAt;

  factory Issue.fromJson(Map<String, dynamic> json) {
    return Issue(
      id: json['id'],
      title: json['title'],
      message: json['message'],
      additionalLocation: json['additional_location'],
      createdBy: json['created_by'],
      createdName: json['created_name'],
      areaName: json['area_name'],
      attachment: json['attachment'],
      updatedAt: json['updated_at'],
    );
  }
}