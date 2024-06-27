import 'package:flutter/foundation.dart';

class Environments {
  static const String LOCAL = 'LOCAL';
  static const String DEVELOPMENT = 'DEVELOPMENT';
  static const String PROD = 'PRODUCTION';
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
  static const String _currentEnvironments = (kReleaseMode) ? Environments.PROD : Environments.DEVELOPMENT;
  static const String verName = "24.06.001";

  static final List<EnvData> _availableEnvironments = [
    EnvData(
        env: Environments.LOCAL,
        url: 'http://localhost/api/',
        urlPortal: 'http://localhost/api/',
        dbName: 'dkportal_local.db'),
    EnvData(
        env: Environments.DEVELOPMENT,
        url: 'https://appdk-trial.duakelinci.id:9393/api/dkportal/v2/',
        urlPortal: 'https://training.duakelinci.id:9393/dkportal/web/index.php',
        dbName: 'dkportal_debug.db'),
    EnvData(
        env: Environments.PROD,
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