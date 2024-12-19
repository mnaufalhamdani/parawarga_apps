class ViewDashboardModel {
  String? userId;
  String? totalArea;
  String? totalUnit;
  String? totalUnitEmpty;
  List<Information> information;
  List<Issue> issue;

  ViewDashboardModel({
    this.userId,
      this.totalArea,
      this.totalUnit,
      this.totalUnitEmpty,
      required this.information,
      required this.issue
  });

  factory ViewDashboardModel.fromJson(dynamic json) {
    return ViewDashboardModel(
      userId: json['user_id'],
      totalArea: json['total_area'],
      totalUnit: json['total_unit'],
      totalUnitEmpty: json['total_unit_empty'],
      information: json['information']
          .map<Information>((dynamic i) => Information.fromJson(i as Map<String, dynamic>))
          .toList(),
      issue: json['issue']
          .map<Issue>((dynamic i) => Issue.fromJson(i as Map<String, dynamic>))
          .toList()
    );
  }
}

class Information {
  String? id;
  String? title;
  String? message;
  String? expired;
  String? urgent;
  String? createdBy;
  String? createdName;
  String? areaName;
  String? updatedAt;

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
  String? id;
  String? title;
  String? message;
  String? additionalLocation;
  String? createdBy;
  String? createdName;
  String? areaName;
  String? attachment;
  String? updatedAt;

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