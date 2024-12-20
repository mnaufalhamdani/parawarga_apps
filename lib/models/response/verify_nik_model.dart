
class VerifyNikModel {
  VerifyNikModel({
    this.message,
  });
  String? message;

  factory VerifyNikModel.fromJson(Map<String, dynamic> json) {
    return VerifyNikModel(
      message: json['message'],
    );
  }
}