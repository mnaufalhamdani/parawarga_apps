class MyUnitDomain{
  String? id;
  String? area_id;
  String? name;
  String? additional_desc;
  String? latitude;
  String? longitude;
  int? contract;
  int? created_by;

  MyUnitDomain({
    this.id,
    this.area_id,
    this.name,
    this.additional_desc,
    this.latitude,
    this.longitude,
    this.contract,
    this.created_by
  });

  Map<String, dynamic> toJson() => {
    "id": id,
    "area_id": area_id,
    "name": name,
    "additional_desc": additional_desc,
    "latitude": latitude,
    "longitude": longitude,
    "contract": contract,
    "created_by": created_by,
  };
}

class MyUnitEmptyDomain{
  String? id;
  String? unit_id;
  String? name;
  String? start_date;
  String? end_date;
  String? confirm_date;
  String? message;
  int? created_by;

  MyUnitEmptyDomain({
    this.id,
    this.unit_id,
    this.name,
    this.start_date,
    this.end_date,
    this.confirm_date,
    this.message,
    this.created_by
  });

  Map<String, dynamic> toJson() => {
    "id": id,
    "unit_id": unit_id,
    "name": name,
    "start_date": start_date,
    "end_date": end_date,
    "confirm_date": confirm_date,
    "message": message,
    "created_by": created_by,
  };
}