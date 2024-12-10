
import '../utils/strings.dart';

class FailureResponse {
  int? status;
  String? message = msgNotFound;

  FailureResponse({
    this.status,
    this.message
  });


  factory FailureResponse.fromJson(dynamic json) {
    try{
      return FailureResponse(
          status: json['status'] as int,
          message: json['messages'] as String
      );
    }catch(e) {
      return FailureResponse(message: json.toString());
    }

  }
}

String errorHandler(int statusCode, String message) {
  switch (statusCode) {
    case 200: return message;
    case 201: return message;
    case 202: return message;
    case 400: return msgKoneksiError;
    case 401: return msgBadRequest;
    case 403: return msgForbidden;
    case 404: return msgPageNotFound;
    case 500: return msgServerError;
    default: return message;
  }
}