class ViewDashboardModel {
  String? userId;
  String? totalArea;
  String? totalUnit;
  String? totalUnitEmpty;
  List<Information>? information;
  List<Issue>? issue;

  ViewDashboardModel({
    this.userId,
      this.totalArea,
      this.totalUnit,
      this.totalUnitEmpty,
      this.information,
      this.issue
  });

  ViewDashboardModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    totalArea = json['total_area'];
    totalUnit = json['total_unit'];
    totalUnitEmpty = json['total_unit_empty'];
    if (json['information'] != null) {
      information = [];
      json['information'].forEach((v) {
        information?.add(Information.fromJson(v));
      });
    }
    if (json['issue'] != null) {
      issue = [];
      json['issue'].forEach((v) {
        issue!.add(Issue.fromJson(v));
      });
    }
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

  Information.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    message = json['message'];
    expired = json['expired'];
    urgent = json['urgent'];
    createdBy = json['created_by'];
    createdName = json['created_name'];
    areaName = json['area_name'];
    updatedAt = json['updated_at'];
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

  Issue.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    message = json['message'];
    additionalLocation = json['additional_location'];
    createdBy = json['created_by'];
    createdName = json['created_name'];
    areaName = json['area_name'];
    attachment = json['attachment'];
    updatedAt = json['updated_at'];
  }
}