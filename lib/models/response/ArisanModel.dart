class ArisanModel {
  ArisanModel({
    this.id,
    this.name,
    this.createdBy,
    this.createdName,
    this.areaName,
    this.nominal,
    this.datePeriode,
    this.startPeriode,
    this.endPeriode,
    this.updatedAt,
    this.currentPeriode,
    this.totalPeriode,
    this.totalPayed,
  });

  String? id;
  String? name;
  String? createdBy;
  String? createdName;
  String? areaName;
  String? nominal;
  String? datePeriode;
  String? startPeriode;
  String? endPeriode;
  String? updatedAt;
  String? currentPeriode;
  String? totalPeriode;
  String? totalPayed;

  factory ArisanModel.fromJson(Map<String, dynamic> json){
    return ArisanModel(
      id: json["id"],
      name: json["name"],
      createdBy: json["created_by"],
      createdName: json["created_name"],
      areaName: json["area_name"],
      nominal: json["nominal"],
      datePeriode: json["date_periode"],
      startPeriode: json["start_periode"],
      endPeriode: json["end_periode"],
      updatedAt: json["updated_at"],
      currentPeriode: json["current_periode"],
      totalPeriode: json["total_periode"],
      totalPayed: json["total_payed"],
    );
  }
}