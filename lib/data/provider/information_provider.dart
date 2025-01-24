import 'package:parawarga_apps/models/response/information_model.dart';

import '../../config/remote/base_service.dart';
import '../../core/constants.dart';
import '../../core/failure_response.dart';
import '../../utils/strings.dart';

class InformationProvider extends BaseService {

  Future<List<InformationModel>> getInformation({
    required String token,
  }) async{
    if (!checkConnection()){
      throw FailureResponse(message: msgKoneksiError);
    }

    final headers = <String, String>{
      'Authorization': 'Bearer $token',
    };
    final params = <String, dynamic>{};

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
    if (!checkConnection()){
      throw FailureResponse(message: msgKoneksiError);
    }

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