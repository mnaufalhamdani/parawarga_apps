// ignore_for_file: prefer_const_constructors
import 'package:parawarga_apps/data/entities/user/user.dart';
import 'package:parawarga_apps/models/mapper/area_mapper.dart';
import 'package:parawarga_apps/models/mapper/user_mapper.dart';

import '../../config/local/database_config.dart';
import '../../core/failure_response.dart';
import '../../utils/strings.dart';
import '../provider/login_provider.dart';

//domain - repository
abstract class LoginRepository {
  Future<UserEntity> login(String username, String password);
}

//data - repository
class LoginRepositoryImpl extends LoginRepository {
  LoginRepositoryImpl(this.provider, this.databaseConfig);

  final LoginProvider provider;
  final DatabaseConfig databaseConfig;

  @override
  Future<UserEntity> login(String username, String password) async {
    final response = await provider.login(username: username, password: password);

    await databaseConfig.profileDao.deleteAll().whenComplete(() async {
      await databaseConfig.profileDao.insertEntity(UserMapper(response, username, password));
    });

    await databaseConfig.areaDao.deleteAll().whenComplete(() async {
      for (var element in response.area) {
        await databaseConfig.areaDao.insertEntity(AreaMapper(element));
      }
    });

    final localUser = await databaseConfig.profileDao.getUser();
    if(localUser.isEmpty) {
      throw FailureResponse(message: msgNotFound);
    }

    final localArea = await databaseConfig.areaDao.getArea();
    if(localArea.isEmpty){
      throw FailureResponse(message: msgAreaNotFound);
    }

    return localUser.first;
  }
}
