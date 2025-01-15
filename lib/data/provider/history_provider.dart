import 'package:parawarga_apps/models/response/history_model.dart';

import '../../config/remote/base_service.dart';
import '../../core/failure_response.dart';

class HistoryProvider extends BaseService {

  Future<List<HistoryModel>> getHistory({
    required String token,
  }) async{
      final headers = <String, String>{
        'Authorization': 'Bearer $token',
      };
      final params = <String, dynamic>{};

      final response = await get('history/getHistory', query: params, headers: headers);
      if(response.status.isOk){
        final value = List<HistoryModel>.from(response.body["data"]!.map((x) => HistoryModel.fromJson(x)));
        return value;
      } else {
        throw FailureResponse.fromJson(response.body ?? response.statusText);
      }
  }
}