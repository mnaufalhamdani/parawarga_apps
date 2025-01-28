import 'package:get/get.dart';
import 'package:parawarga_apps/models/response/general_model.dart';
import 'package:parawarga_apps/models/response/voting_detail_model.dart';
import 'package:parawarga_apps/models/response/voting_model.dart';

import '../../config/remote/base_service.dart';
import '../../core/constants.dart';
import '../../core/failure_response.dart';
import '../../utils/strings.dart';

class VotingProvider extends BaseService {

  Future<List<VotingModel>> getVoting({
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

    final response = await get('voting/getVoting', query: params, headers: headers);
    if(response.status.isOk){
      final value = List<VotingModel>.from(response.body["data"]!.map((x) => VotingModel.fromJson(x)));
      return value;
    } else {
      throw FailureResponse.fromJson(response.body ?? response.statusText);
    }
  }

  Future<VotingDetailModel> getVotingDetail({
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

    final response = await get('voting/getVotingDetail', query: params, headers: headers);
    if(response.status.isOk){
      final value = VotingDetailModel.fromJson(response.body['data']);
      return value;
    } else {
      throw FailureResponse.fromJson(response.body ?? response.statusText);
    }
  }

  Future<GeneralModel> saveVoted({
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

    final response = await post('voting/saveVoted', formData, query: params, headers: headers);
    if(response.status.isOk){
      final value = GeneralModel.fromJson(response.body);
      return value;
    } else {
      throw FailureResponse.fromJson(response.body ?? response.statusText);
    }
  }
}