import 'package:parawarga_apps/models/response/view_dashboard_model.dart';

import '../../config/remote/base_service.dart';
import '../../core/constants.dart';
import '../../core/failure_response.dart';
import '../../utils/strings.dart';

class DashboardProvider extends BaseService {

  Future<ViewDashboardModel> getViewDashboard({
    required String token,
  }) async{
    if (!checkConnection()){
      throw FailureResponse(message: msgKoneksiError);
    }

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
}