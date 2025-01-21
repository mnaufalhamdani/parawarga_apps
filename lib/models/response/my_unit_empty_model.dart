class MyUnitEmptyModel {
  MyUnitEmptyModel({
    required this.id,
    required this.unitId,
    required this.name,
    required this.startDate,
    required this.endDate,
    required this.confirmDate,
    required this.startDateName,
    required this.endDateName,
    required this.confirmDateName,
    required this.message,
  });

  final String? id;
  final String? unitId;
  final String? name;
  final String? startDate;
  final String? endDate;
  final String? confirmDate;
  final String? startDateName;
  final String? endDateName;
  final String? confirmDateName;
  final String? message;

  factory MyUnitEmptyModel.fromJson(Map<String, dynamic> json){
    return MyUnitEmptyModel(
      id: json["id"],
      unitId: json["unit_id"],
      name: json["name"],
      startDate: json["start_date"],
      endDate: json["end_date"],
      confirmDate: json["confirm_date"],
      startDateName: json["start_date_name"],
      endDateName: json["end_date_name"],
      confirmDateName: json["confirm_date_name"],
      message: json["message"],
    );
  }

}
