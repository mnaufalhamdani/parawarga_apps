class GeneralModel {
  GeneralModel({
    this.status,
    this.messages,
    this.data,
  });

  int? status;
  String? messages;
  String? data;

  factory GeneralModel.fromJson(Map<String, dynamic> json){
    return GeneralModel(
      status: json["status"],
      messages: json["messages"] ?? json["message"],
      data: json["data"],
    );
  }
}
