class InputIssueDomain{
  String? area_id;
  String? title;
  String? message;
  String? latitude;
  String? longitude;
  String? generate_location;
  String? additional_location;
  int? created_by;
  List<InputIssueAttachmentDomain> attachments;

  InputIssueDomain({
    this.area_id,
    this.title,
    this.message,
    this.latitude,
    this.longitude,
    this.generate_location,
    this.additional_location,
    this.created_by,
    required this.attachments
  });

  Map<String, dynamic> toJson() => {
    "area_id": area_id,
    "title": title,
    "message": message,
    "latitude": latitude,
    "longitude": longitude,
    "generate_location": generate_location,
    "additional_location": additional_location,
    "created_by": created_by,
    "attachments": attachments
  };
}

class InputIssueAttachmentDomain{
  String? attachment;

  InputIssueAttachmentDomain({
    this.attachment
  });

  Map<String, dynamic> toJson() => {
    "attachment": attachment
  };
}