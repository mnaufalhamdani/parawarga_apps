import 'package:get/get.dart';
import 'package:parawarga_apps/models/response/ArisanDetailModel.dart';
import 'package:parawarga_apps/models/response/ArisanModel.dart';
import 'package:parawarga_apps/models/response/general_model.dart';

import '../../config/remote/base_service.dart';
import '../../core/failure_response.dart';

class ArisanProvider extends BaseService {

  Future<List<ArisanModel>> getArisan({
    required String token,
  }) async{
      final headers = <String, String>{
        'Authorization': 'Bearer $token',
      };
      final params = <String, dynamic>{};

      final response = await get('arisan/getArisan', query: params, headers: headers);
      if(response.status.isOk){
        final value = List<ArisanModel>.from(response.body["data"]!.map((x) => ArisanModel.fromJson(x)));
        return value;
      } else {
        throw FailureResponse.fromJson(response.body ?? response.statusText);
      }
  }

  Future<ArisanDetailModel> getArisanDetail({
    required String token,
    String? id
  }) async{
    final headers = <String, String>{
      'Authorization': 'Bearer $token',
    };
    final params = <String, dynamic>{
      'id': id,
    };

    final response = await get('arisan/getArisanDetail', query: params, headers: headers);
    if(response.status.isOk){
      final value = ArisanDetailModel.fromJson(response.body['data']);
      return value;
    } else {
      throw FailureResponse.fromJson(response.body ?? response.statusText);
    }
  }

  Future<GeneralModel> saveArisanWinner({
    required String token,
    String? json
  }) async{
    final headers = <String, String>{
      'Authorization': 'Bearer $token',
    };
    final params = <String, dynamic>{};
    final formData = FormData({
      'data': json
    });

    final response = await post('arisan/saveArisanWinner', formData, query: params, headers: headers);
    if(response.status.isOk){
      final value = GeneralModel.fromJson(response.body);
      return value;
    } else {
      throw FailureResponse.fromJson(response.body ?? response.statusText);
    }
  }
}