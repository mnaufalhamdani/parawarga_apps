import 'package:flutter/foundation.dart';

class Environments {
  static const String local = 'local';
  static const String development = 'development';
  static const String production = 'production';
}

class EnvData {
  String env;
  String url;
  String urlPortal;
  String dbName;
  String? key;

  EnvData({
    required this.env,
    required this.url,
    required this.urlPortal,
    required this.dbName,
    this.key});
}

class ConfigEnvironments {
  //Change environment in this bottom line
  static const String _currentEnvironments = (kReleaseMode)
      ? Environments.production
      : Environments.development;
  static const String verName = "24.06.001";

  static final List<EnvData> _availableEnvironments = [
    EnvData(
        env: Environments.local,
        url: 'http://localhost/api/',
        urlPortal: 'http://localhost/api/',
        dbName: 'dkportal_local.db'),
    EnvData(
        env: Environments.development,
        url: 'https://appdk-trial.duakelinci.id:9393/api/dkportal/v2/',
        urlPortal: 'https://training.duakelinci.id:9393/dkportal/web/index.php',
        dbName: 'dkportal_debug.db'),
    EnvData(
        env: Environments.production,
        url: 'https://dkapi.duakelinci.id:9393/dkportal/v2/',
        urlPortal: 'https://dk-portal.duakelinci.id:9393/index.php',
        dbName: 'dkportal.db'),
  ];

  static EnvData getEnvironment() {
    return _availableEnvironments.firstWhere(
            (element) => element.env == _currentEnvironments
    );
  }
}