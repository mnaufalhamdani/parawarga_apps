import 'dart:developer';

import 'package:parawarga_apps/models/response/issue_detail_model.dart';
import 'package:parawarga_apps/models/response/issue_model.dart';

import '../../config/remote/base_service.dart';
import '../../core/failure_response.dart';

class IssueProvider extends BaseService {

  Future<List<IssueModel>> getIssue({
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
      final IssueDetailModel value = IssueDetailModel.fromJson(response.body['data']);
      log("value: ${value.title}");
      return value;
    } else {
      throw FailureResponse.fromJson(response.body ?? response.statusText);
    }
  }
}