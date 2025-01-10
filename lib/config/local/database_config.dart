import 'dart:async';

import 'package:floor/floor.dart';
import 'package:parawarga_apps/data/entities/area/area.dart';
import 'package:parawarga_apps/data/entities/area/area_dao.dart';
import 'package:parawarga_apps/data/entities/user/user.dart';
import 'package:parawarga_apps/data/entities/user/user_dao.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'database_config.g.dart';// the generated code will be there

@Database(version: 3, entities: [
  UserEntity,
  AreaEntity,
])
abstract class DatabaseConfig extends FloorDatabase {
  UserDao get profileDao;
  AreaDao get areaDao;
}
