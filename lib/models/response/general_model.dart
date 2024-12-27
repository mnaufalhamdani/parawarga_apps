class GeneralModel {
  GeneralModel({
    this.status,
    this.messages,
    this.message,
  });

  int? status;
  String? messages;
  String? message;

  factory GeneralModel.fromJson(Map<String, dynamic> json){
    return GeneralModel(
      status: json["status"],
      messages: json["messages"],
      message: json["message"],
    );
  }
}
