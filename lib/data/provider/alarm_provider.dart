import 'package:parawarga_apps/models/response/alarm_detail_model.dart';

import '../../config/remote/base_service.dart';
import '../../core/constants.dart';
import '../../core/failure_response.dart';
import '../../utils/strings.dart';

class AlarmProvider extends BaseService {
  Future<AlarmDetailModel> getAlarmDetail({
    required String token,
    String? id
  }) async{
    await checkConnection().then((value) {
      if(!value) {
        throw FailureResponse(message: msgKoneksiError);
      }
    });

    final headers = <String, String>{
      'Authorization': 'Bearer $token',
    };
    final params = <String, dynamic>{
      'id': id,
    };

    final response = await get('alarm/getAlarmDetail', query: params, headers: headers);
    if(response.status.isOk){
      final value = AlarmDetailModel.fromJson(response.body['data']);
      return value;
    } else {
      throw FailureResponse.fromJson(response.body ?? response.statusText);
    }
  }
}