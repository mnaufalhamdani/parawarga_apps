import 'package:parawarga_apps/models/response/view_dashboard_model.dart';

import '../../config/remote/base_service.dart';
import '../../core/failure_response.dart';

class DashboardProvider extends BaseService {

  Future<ViewDashboardModel> getViewDashboard({
    required String token,
    String? areaArray,
    String? date,
  }) async{
      final headers = <String, String>{
        'Authorization': 'Bearer $token',
      };
      final params = <String, dynamic>{
        'area_array': areaArray,
        'date': date
      };

      final response = await get('dashboard/getViewDashboard', query: params, headers: headers);
      if(response.status.isOk){
        final value = ViewDashboardModel.fromJson(response.body['data']);
        return value;
      } else {
        throw FailureResponse.fromJson(response.body ?? response.statusText);
      }
  }
}