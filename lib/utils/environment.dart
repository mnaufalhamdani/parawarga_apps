import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

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
        url: dotenv.get('BASE_URL_LOCAL', fallback: ''),
        dbName: dotenv.get('BASE_DB_LOCAL', fallback: '')),
    EnvData(
        env: Environments.development,
        url: dotenv.get('BASE_URL_DEV', fallback: ''),
        dbName: dotenv.get('BASE_DB_DEV', fallback: '')),
    EnvData(
        env: Environments.production,
        url: dotenv.get('BASE_URL_PROD', fallback: ''),
        dbName: dotenv.get('BASE_DB_PROD', fallback: '')),
  ];

  static EnvData getEnvironment() {
    return _availableEnvironments.firstWhere(
            (element) => element.env == _currentEnvironments
    );
  }
}