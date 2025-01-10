class TagihanModel {
  TagihanModel({
    this.id,
    this.name,
    this.message,
    this.createdBy,
    this.createdName,
    this.areaName,
    this.nominal,
    this.totalPeriode,
    this.required,
    this.startPeriode,
    this.endPeriode,
    this.updatedAt,
  });

  String? id;
  String? name;
  String? message;
  String? createdBy;
  String? createdName;
  String? areaName;
  String? nominal;
  String? totalPeriode;
  bool? required;
  String? startPeriode;
  String? endPeriode;
  String? updatedAt;

  factory TagihanModel.fromJson(Map<String, dynamic> json){
    return TagihanModel(
      id: json["id"],
      name: json["name"],
      message: json["message"],
      createdBy: json["created_by"],
      createdName: json["created_name"],
      areaName: json["area_name"],
      nominal: json["nominal"],
      totalPeriode: json["total_periode"],
      required: (json["required"].toString() == "1") ? true : false,
      startPeriode: json["start_periode"],
      endPeriode: json["end_periode"],
      updatedAt: json["updated_at"],
    );
  }
}