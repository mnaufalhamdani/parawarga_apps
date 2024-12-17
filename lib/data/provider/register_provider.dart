import 'package:get/get.dart';
import 'package:parawarga_apps/models/response/verify_nik_model.dart';

import '../../config/remote/base_service.dart';
import '../../core/failure_response.dart';
import '../../models/response/verify_encode_model.dart';

class RegisterProvider extends BaseService {

  Future<VerifyEncodeModel> verifyEncodeArea({
    required String areaEncoded
  }) async{
      final headers = <String, String>{};
      final params = <String, dynamic>{};
      final formData = FormData({
        'area_encoded': areaEncoded
      });

      final response = await post('verifyEncodeArea', formData, query: params, headers: headers);
      if(response.status.isOk){
        final VerifyEncodeModel value = VerifyEncodeModel.fromJson(response.body['data']);
        return value;
      } else {
        throw FailureResponse.fromJson(response.body ?? response.statusText);
      }
  }

  Future<VerifyNikModel> verifyNik({
    required String nik
  }) async{
    final headers = <String, String>{};
    final params = <String, dynamic>{};
    final formData = FormData({
      'nik': nik
    });

    final response = await post('verifyNik', formData, query: params, headers: headers);
    if(response.status.isOk){
      final VerifyNikModel value = VerifyNikModel.fromJson(response.body['data']);
      return value;
    } else {
      throw FailureResponse.fromJson(response.body ?? response.statusText);
    }
  }

  Future<bool> register({
    required String data
  }) async{
    final headers = <String, String>{};
    final params = <String, dynamic>{};
    final formData = FormData({
      'data': data
    });

    final response = await post('register', formData, query: params, headers: headers);
    if(response.status.isOk){
      return response.status.isOk;
    } else {
      throw FailureResponse.fromJson(response.body ?? response.statusText);
    }
  }
}