import 'package:flutter/foundation.dart';

class Environments {
  static const String local = 'local';
  static const String development = 'development';
  static const String production = 'production';
}

class EnvData {
  String env;
  String url;
  String dbName;
  String? key;

  EnvData({
    required this.env,
    required this.url,
    required this.dbName,
    this.key});
}

class ConfigEnvironments {
  //Change environment in this bottom line
  static const String _currentEnvironments = (kReleaseMode)
      ? Environments.production
      : Environments.local;
  static const String verName = "24.12.001";

  static final List<EnvData> _availableEnvironments = [
    EnvData(
        env: Environments.local,
        url: 'http://10.8.12.234/parawarga/service/',
        dbName: 'parawarga_local.db'),
    EnvData(
        env: Environments.development,
        url: 'https://appdk-trial.duakelinci.id:9393/api/dkportal/v2/',
        dbName: 'parawarga_debug.db'),
    EnvData(
        env: Environments.production,
        url: 'https://dkapi.duakelinci.id:9393/dkportal/v2/',
        dbName: 'parawarga.db'),
  ];

  static EnvData getEnvironment() {
    return _availableEnvironments.firstWhere(
            (element) => element.env == _currentEnvironments
    );
  }
}