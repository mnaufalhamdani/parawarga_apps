import 'package:parawarga_apps/models/response/area_unit_model.dart';

import '../../config/remote/base_service.dart';
import '../../core/failure_response.dart';
import '../../models/response/my_area_unit_model.dart';

class AreaProvider extends BaseService {

  Future<List<AreaUnitModel>> getAreaUnit({
    required String token,
    String? empty,
    String? myUnit,
  }) async{
      final headers = <String, String>{
        'Authorization': 'Bearer $token',
      };
      final params = <String, dynamic>{
        'empty': empty,
        'my_unit': myUnit,
      };

      final response = await get('area/getAllUnit', query: params, headers: headers);
      if(response.status.isOk){
        final value = List<AreaUnitModel>.from(response.body["data"]!.map((x) => AreaUnitModel.fromJson(x)));
        return value;
      } else {
        throw FailureResponse.fromJson(response.body ?? response.statusText);
      }
  }

  Future<List<MyAreaUnitModel>> getMyAreaUnit({
    required String token,
  }) async{
    final headers = <String, String>{
      'Authorization': 'Bearer $token',
    };
    final params = <String, dynamic>{};

    final response = await get('area/getMyAreaUnit', query: params, headers: headers);
    if(response.status.isOk){
      final value = List<MyAreaUnitModel>.from(response.body["data"]!.map((x) => MyAreaUnitModel.fromJson(x)));
      return value;
    } else {
      throw FailureResponse.fromJson(response.body ?? response.statusText);
    }
  }
}