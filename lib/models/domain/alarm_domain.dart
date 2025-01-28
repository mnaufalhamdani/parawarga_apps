class InputAlarmDomain{
  String? area_id;
  String? message;
  String? latitude;
  String? longitude;
  String? generate_location;
  int? created_by;

  InputAlarmDomain({
    this.area_id,
    this.message,
    this.latitude,
    this.longitude,
    this.generate_location,
    this.created_by,
  });

  Map<String, dynamic> toJson() => {
    "area_id": area_id,
    "message": message,
    "latitude": latitude,
    "longitude": longitude,
    "generate_location": generate_location,
    "created_by": created_by,
  };
}