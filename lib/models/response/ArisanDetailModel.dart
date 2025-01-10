class ArisanDetailModel {
  ArisanDetailModel({
    this.id,
    this.name,
    this.createdBy,
    this.createdName,
    this.areaName,
    this.nominal,
    this.periode,
    this.datePeriode,
    this.startPeriode,
    this.endPeriode,
    this.updatedAt,
    this.currentPeriode,
    this.totalPeriode,
    this.totalPayed,
    this.timeToDice,
    required this.detail,
    required this.history,
  });

  String? id;
  String? name;
  String? createdBy;
  String? createdName;
  String? areaName;
  String? nominal;
  String? periode;
  String? datePeriode;
  String? startPeriode;
  String? endPeriode;
  String? updatedAt;
  String? currentPeriode;
  String? totalPeriode;
  String? totalPayed;
  bool? timeToDice;
  List<Detail> detail;
  List<History> history;

  factory ArisanDetailModel.fromJson(Map<String, dynamic> json){
    return ArisanDetailModel(
      id: json["id"],
      name: json["name"],
      createdBy: json["created_by"],
      createdName: json["created_name"],
      areaName: json["area_name"],
      nominal: json["nominal"],
      periode: json["periode"],
      datePeriode: json["date_periode"],
      startPeriode: json["start_periode"],
      endPeriode: json["end_periode"],
      updatedAt: json["updated_at"],
      currentPeriode: json["current_periode"],
      totalPeriode: json["total_periode"],
      totalPayed: json["total_payed"],
      timeToDice: (json["time_to_dice"].toString() == "1") ? true : false,
      detail: json["detail"] == null ? [] : List<Detail>.from(json["detail"]!.map((x) => Detail.fromJson(x))),
      history: json["history"] == null ? [] : List<History>.from(json["history"]!.map((x) => History.fromJson(x))),
    );
  }

}

class Detail {
  Detail({
    this.arisanId,
    this.userId,
    this.createdName,
    this.unitName,
    this.winDate,
    this.winNominal,
  });

  String? arisanId;
  String? userId;
  String? createdName;
  String? unitName;
  String? winDate;
  String? winNominal;

  factory Detail.fromJson(Map<String, dynamic> json){
    return Detail(
      arisanId: json["arisan_id"],
      userId: json["user_id"],
      createdName: json["created_name"],
      unitName: json["unit_name"],
      winDate: json["win_date"],
      winNominal: json["win_nominal"],
    );
  }

}

class History {
  History({
    this.arisanId,
    this.periode,
    this.periodeName,
    required this.user,
  });

  String? arisanId;
  String? periode;
  String? periodeName;
  List<User> user;

  factory History.fromJson(Map<String, dynamic> json){
    return History(
      arisanId: json["arisan_id"],
      periode: json["periode"],
      periodeName: json["periode_name"],
      user: json["user"] == null ? [] : List<User>.from(json["user"]!.map((x) => User.fromJson(x))),
    );
  }
}

class User {
  User({
    this.arisanId,
    this.userId,
    this.nominal,
    this.createdName,
    this.updatedAt,
  });

  String? arisanId;
  String? userId;
  String? nominal;
  String? createdName;
  String? updatedAt;

  factory User.fromJson(Map<String, dynamic> json){
    return User(
      arisanId: json["arisan_id"],
      userId: json["user_id"],
      nominal: json["nominal"],
      createdName: json["created_name"],
      updatedAt: json["updated_at"],
    );
  }
}
