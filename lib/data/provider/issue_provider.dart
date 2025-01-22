import 'package:get/get.dart';
import 'package:parawarga_apps/models/response/general_model.dart';
import 'package:parawarga_apps/models/response/issue_detail_model.dart';
import 'package:parawarga_apps/models/response/issue_model.dart';

import '../../config/remote/base_service.dart';
import '../../core/failure_response.dart';

class IssueProvider extends BaseService {

  Future<List<IssueModel>> getIssue({
    required String token,
  }) async{
      final headers = <String, String>{
        'Authorization': 'Bearer $token',
      };
      final params = <String, dynamic>{};

      final response = await get('issue/getIssue', query: params, headers: headers);
      if(response.status.isOk){
        final value = List<IssueModel>.from(response.body["data"]!.map((x) => IssueModel.fromJson(x)));
        return value;
      } else {
        throw FailureResponse.fromJson(response.body ?? response.statusText);
      }
  }

  Future<IssueDetailModel> getIssueDetail({
    required String token,
    String? id
  }) async{
    final headers = <String, String>{
      'Authorization': 'Bearer $token',
    };
    final params = <String, dynamic>{
      'id': id,
    };

    final response = await get('issue/getIssueDetail', query: params, headers: headers);
    if(response.status.isOk){
      final value = IssueDetailModel.fromJson(response.body['data']);
      return value;
    } else {
      throw FailureResponse.fromJson(response.body ?? response.statusText);
    }
  }

  Future<GeneralModel> saveIssue({
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

    final response = await post('issue/saveIssue', formData, query: params, headers: headers);
    if(response.status.isOk){
      final value = GeneralModel.fromJson(response.body);
      return value;
    } else {
      throw FailureResponse.fromJson(response.body ?? response.statusText);
    }
  }
}