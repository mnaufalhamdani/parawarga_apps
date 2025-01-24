import 'package:get/get.dart';
import 'package:parawarga_apps/models/response/area_unit_model.dart';
import 'package:parawarga_apps/models/response/general_model.dart';
import 'package:parawarga_apps/models/response/my_unit_empty_model.dart';

import '../../config/remote/base_service.dart';
import '../../core/constants.dart';
import '../../core/failure_response.dart';
import '../../models/response/my_area_unit_model.dart';
import '../../utils/strings.dart';

class AreaProvider extends BaseService {

  Future<List<AreaUnitModel>> getAreaUnit({
    required String token,
    String? empty,
    String? myUnit,
  }) async{
    if (!checkConnection()){
      throw FailureResponse(message: msgKoneksiError);
    }

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
    if (!checkConnection()){
      throw FailureResponse(message: msgKoneksiError);
    }

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

  Future<MyUnitEmptyModel> getMyUnitEmpty({
    required String token,
    String? unitId,
  }) async{
    if (!checkConnection()){
      throw FailureResponse(message: msgKoneksiError);
    }

    final headers = <String, String>{
      'Authorization': 'Bearer $token',
    };
    final params = <String, dynamic>{
      'unit_id': unitId
    };

    final response = await get('area/getMyUnitEmpty', query: params, headers: headers);
    if(response.status.isOk){
      final value = MyUnitEmptyModel.fromJson(response.body["data"]);
      return value;
    } else {
      throw FailureResponse.fromJson(response.body ?? response.statusText);
    }
  }

  Future<GeneralModel> saveMyArea({
    required String token,
    String? areaEncoded,
  }) async{
    if (!checkConnection()){
      throw FailureResponse(message: msgKoneksiError);
    }

    final headers = <String, String>{
      'Authorization': 'Bearer $token',
    };
    final params = <String, dynamic>{};
    final formData = FormData({
      'area_encoded': areaEncoded
    });

    final response = await post('area/saveMyArea', formData, query: params, headers: headers);
    if(response.status.isOk){
      final value = GeneralModel.fromJson(response.body);
      return value;
    } else {
      throw FailureResponse.fromJson(response.body ?? response.statusText);
    }
  }

  Future<GeneralModel> saveMyUnit({
    required String token,
    String? json,
  }) async{
    if (!checkConnection()){
      throw FailureResponse(message: msgKoneksiError);
    }

    final headers = <String, String>{
      'Authorization': 'Bearer $token',
    };
    final params = <String, dynamic>{};
    final formData = FormData({
      'data': json
    });

    final response = await post('area/saveMyUnit', formData, query: params, headers: headers);
    if(response.status.isOk){
      final value = GeneralModel.fromJson(response.body);
      return value;
    } else {
      throw FailureResponse.fromJson(response.body ?? response.statusText);
    }
  }

  Future<GeneralModel> saveManageEmptyUnit({
    required String token,
    String? json,
  }) async{
    if (!checkConnection()){
      throw FailureResponse(message: msgKoneksiError);
    }

    final headers = <String, String>{
      'Authorization': 'Bearer $token',
    };
    final params = <String, dynamic>{};
    final formData = FormData({
      'data': json
    });

    final response = await post('area/manageEmptyUnit', formData, query: params, headers: headers);
    if(response.status.isOk){
      final value = GeneralModel.fromJson(response.body);
      return value;
    } else {
      throw FailureResponse.fromJson(response.body ?? response.statusText);
    }
  }

  Future<GeneralModel> removeMyUnit({
    required String token,
    String? unitId
  }) async{
    if (!checkConnection()){
      throw FailureResponse(message: msgKoneksiError);
    }

    final headers = <String, String>{
      'Authorization': 'Bearer $token',
    };
    final params = <String, dynamic>{};
    final formData = FormData({
      'unit_id': unitId
    });

    final response = await post('area/removeMyUnit', formData, query: params, headers: headers);
    if(response.status.isOk){
      final value = GeneralModel.fromJson(response.body);
      return value;
    } else {
      throw FailureResponse.fromJson(response.body ?? response.statusText);
    }
  }
}