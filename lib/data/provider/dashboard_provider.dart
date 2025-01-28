import 'package:get/get_connect/http/src/multipart/form_data.dart';
import 'package:parawarga_apps/models/response/view_dashboard_model.dart';

import '../../config/remote/base_service.dart';
import '../../core/constants.dart';
import '../../core/failure_response.dart';
import '../../models/response/general_model.dart';
import '../../utils/strings.dart';

class DashboardProvider extends BaseService {

  Future<ViewDashboardModel> getViewDashboard({
    required String token,
  }) async{
    await checkConnection().then((value) {
      if(!value) {
        throw FailureResponse(message: msgKoneksiError);
      }
    });

    final headers = <String, String>{
      'Authorization': 'Bearer $token',
    };
    final params = <String, dynamic>{};

    final response = await get('dashboard/getViewDashboard', query: params, headers: headers);
    if(response.status.isOk){
      final value = ViewDashboardModel.fromJson(response.body['data']);
      return value;
    } else {
      throw FailureResponse.fromJson(response.body ?? response.statusText);
    }
  }

  Future<GeneralModel> saveAlarm({
    required String token,
    String? json
  }) async{
    await checkConnection().then((value) {
      if(!value) {
        throw FailureResponse(message: msgKoneksiError);
      }
    });

    final headers = <String, String>{
      'Authorization': 'Bearer $token',
    };
    final params = <String, dynamic>{};
    final formData = FormData({
      'data': json
    });

    final response = await post('dashboard/saveAlarm', formData, query: params, headers: headers);
    if(response.status.isOk){
      final value = GeneralModel.fromJson(response.body);
      return value;
    } else {
      throw FailureResponse.fromJson(response.body ?? response.statusText);
    }
  }
}