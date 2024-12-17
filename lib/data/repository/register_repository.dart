// ignore_for_file: prefer_const_constructors
import 'dart:convert';
import 'dart:developer';

import 'package:parawarga_apps/data/provider/register_provider.dart';
import 'package:parawarga_apps/models/domain/register_warga_domain.dart';
import 'package:parawarga_apps/models/response/verify_nik_model.dart';

import '../../config/local/database_config.dart';
import '../../models/response/verify_encode_model.dart';

//domain - repository
abstract class RegisterRepository {
  Future<VerifyEncodeModel> verifyEncodeArea(String areaEncoded);
  Future<VerifyNikModel> verifyNik(String nik);
  Future<bool> register(RegisterWargaDomain domain);
}

//data - repository
class RegisterRepositoryImpl extends RegisterRepository {
  RegisterRepositoryImpl(this.provider, this.databaseConfig);

  final RegisterProvider provider;
  final DatabaseConfig databaseConfig;

  @override
  Future<VerifyEncodeModel> verifyEncodeArea(String areaEncoded) async {
    log("message: ${areaEncoded}");
    return await provider.verifyEncodeArea(areaEncoded: areaEncoded);
  }

  @override
  Future<VerifyNikModel> verifyNik(String nik) async {
    return await provider.verifyNik(nik: nik);
  }

  @override
  Future<bool> register(RegisterWargaDomain domain) async {
    final json = jsonEncode(domain).toString();
    final response = await provider.register(data: json);

    return response;
  }
}
