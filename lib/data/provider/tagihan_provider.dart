import 'package:get/get.dart';
import 'package:parawarga_apps/models/response/general_model.dart';

import '../../config/remote/base_service.dart';
import '../../core/failure_response.dart';
import '../../models/response/tagihan_detail_model.dart';
import '../../models/response/tagihan_model.dart';

class TagihanProvider extends BaseService {

  Future<List<TagihanModel>> getTagihan({
    required String token,
  }) async{
      final headers = <String, String>{
        'Authorization': 'Bearer $token',
      };
      final params = <String, dynamic>{};

      final response = await get('tagihan/getTagihan', query: params, headers: headers);
      if(response.status.isOk){
        final value = List<TagihanModel>.from(response.body["data"]!.map((x) => TagihanModel.fromJson(x)));
        return value;
      } else {
        throw FailureResponse.fromJson(response.body ?? response.statusText);
      }
  }

  Future<TagihanDetailModel> getTagihanDetail({
    required String token,
    String? id
  }) async{
    final headers = <String, String>{
      'Authorization': 'Bearer $token',
    };
    final params = <String, dynamic>{
      'id': id,
    };

    final response = await get('tagihan/getTagihanDetail', query: params, headers: headers);
    if(response.status.isOk){
      final value = TagihanDetailModel.fromJson(response.body['data']);
      return value;
    } else {
      throw FailureResponse.fromJson(response.body ?? response.statusText);
    }
  }

  Future<GeneralModel> saveTagihanHistory({
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

    final response = await post('tagihan/saveTagihanHistory', formData, query: params, headers: headers);
    if(response.status.isOk){
      final value = GeneralModel.fromJson(response.body);
      return value;
    } else {
      throw FailureResponse.fromJson(response.body ?? response.statusText);
    }
  }
}