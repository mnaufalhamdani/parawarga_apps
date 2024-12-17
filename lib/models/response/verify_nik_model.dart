
class VerifyNikModel {
  String? message;

  VerifyNikModel({
    this.message,
  });

  factory VerifyNikModel.fromJson(dynamic json) {
    return VerifyNikModel(
      message: json['message'],
    );
  }
}