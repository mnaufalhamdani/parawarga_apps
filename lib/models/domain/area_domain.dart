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