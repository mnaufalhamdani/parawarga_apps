import 'package:parawarga_apps/models/response/information_model.dart';

import '../../config/remote/base_service.dart';
import '../../core/failure_response.dart';

class InformationProvider extends BaseService {

  Future<List<InformationModel>> getInformation({
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

      final response = await get('information/getInformation', query: params, headers: headers);
      if(response.status.isOk){
        final value = List<InformationModel>.from(response.body["data"]!.map((x) => InformationModel.fromJson(x)));
        return value;
      } else {
        throw FailureResponse.fromJson(response.body ?? response.statusText);
      }
  }

  Future<InformationModel> getInformationDetail({
    required String token,
    String? id
  }) async{
    final headers = <String, String>{
      'Authorization': 'Bearer $token',
    };
    final params = <String, dynamic>{
      'id': id,
    };

    final response = await get('information/getInformationDetail', query: params, headers: headers);
    if(response.status.isOk){
      final value = InformationModel.fromJson(response.body['data']);
      return value;
    } else {
      throw FailureResponse.fromJson(response.body ?? response.statusText);
    }
  }
}