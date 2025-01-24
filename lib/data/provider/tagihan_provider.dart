import 'package:get/get.dart';
import 'package:parawarga_apps/models/response/general_model.dart';
import 'package:parawarga_apps/models/response/tagihan_temp_model.dart';

import '../../config/remote/base_service.dart';
import '../../core/constants.dart';
import '../../core/failure_response.dart';
import '../../models/response/tagihan_detail_model.dart';
import '../../models/response/tagihan_model.dart';
import '../../utils/strings.dart';

class TagihanProvider extends BaseService {

  Future<List<TagihanModel>> getTagihan({
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

    final response = await get('tagihan/getTagihanDetail', query: params, headers: headers);
    if(response.status.isOk){
      final value = TagihanDetailModel.fromJson(response.body['data']);
      return value;
    } else {
      throw FailureResponse.fromJson(response.body ?? response.statusText);
    }
  }

  Future<TagihanTempModel> getTagihanTemp({
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

    final response = await get('tagihan/getTagihanTemp', query: params, headers: headers);
    if(response.status.isOk){
      final value = TagihanTempModel.fromJson(response.body['data']);
      return value;
    } else {
      throw FailureResponse.fromJson(response.body ?? response.statusText);
    }
  }

  Future<GeneralModel> saveTagihanTemp({
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

    final response = await post('tagihan/saveTagihanTemp', formData, query: params, headers: headers);
    if(response.status.isOk){
      final value = GeneralModel.fromJson(response.body);
      return value;
    } else {
      throw FailureResponse.fromJson(response.body ?? response.statusText);
    }
  }

  Future<GeneralModel> saveTagihanPembayaran({
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

    final response = await post('tagihan/saveTagihanPembayaran', formData, query: params, headers: headers);
    if(response.status.isOk){
      final value = GeneralModel.fromJson(response.body);
      return value;
    } else {
      throw FailureResponse.fromJson(response.body ?? response.statusText);
    }
  }
}