import 'package:get/get.dart';
import 'package:parawarga_apps/core/constants.dart';
import 'package:parawarga_apps/utils/strings.dart';

import '../../config/remote/base_service.dart';
import '../../core/failure_response.dart';
import '../../models/response/login_model.dart';

class LoginProvider extends BaseService {

  Future<LoginModel> login({
    String? username,
    String? password,
    String? device_id,
    String? firebase_id,
  }) async{
    await checkConnection().then((value) {
      if(!value) {
        throw FailureResponse(message: msgKoneksiError);
      }
    });

    final headers = <String, String>{};
    final params = <String, dynamic>{};
    final formData = FormData({
      'username': username,
      'password': password,
      'device_id': device_id,
      'firebase_id': firebase_id,
    });

    final response = await post('login', formData, query: params, headers: headers);
    if(response.status.isOk){
      final LoginModel value = LoginModel.fromJson(response.body['data']);
      return value;
    } else {
      throw FailureResponse.fromJson(response.body ?? response.statusText);
    }
  }
  //
  // Future<UpdateAppModel> checkUpdateApp() async{
  //   final headers = <String, String>{};
  //   final formData = FormData({});
  //   final params = <String, dynamic>{
  //     'version': ConfigEnvironments.verName
  //   };
  //
  //   final response = await get('update-apk', query: params, headers: headers);
  //   if(response.status.isOk){
  //     final value = UpdateAppModel(message: "Versi aplikasi Anda sudah terbaru", updateReady: false);
  //     return value;
  //   } else {
  //     if(response.statusCode == 422){
  //       final UpdateAppModel value = UpdateAppModel.fromJson(response.body['errors']);
  //       value.message = "Silahkan update aplikasi";
  //       value.updateReady = true;
  //       return value;
  //     }else {
  //       throw FailureResponse.fromJson(response.body ?? response.statusText);
  //     }
  //   }
  // }
}