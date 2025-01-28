import 'dart:async';

import 'package:floor/floor.dart';
import 'package:parawarga_apps/data/entities/area/area.dart';
import 'package:parawarga_apps/data/entities/area/area_dao.dart';
import 'package:parawarga_apps/data/entities/auth_menu/auth_menu.dart';
import 'package:parawarga_apps/data/entities/auth_menu/auth_menu_dao.dart';
import 'package:parawarga_apps/data/entities/user/user.dart';
import 'package:parawarga_apps/data/entities/user/user_dao.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

/**
 * Generated code will be there :
 * terminal: dart run build_runner build
 * if found declared outputs which already exist on disk then (1 - Delete)
 */
part 'database_config.g.dart';

@Database(version: 4, entities: [
  UserEntity,
  AreaEntity,
  AuthMenuEntity,
])
abstract class DatabaseConfig extends FloorDatabase {
  UserDao get profileDao;
  AreaDao get areaDao;
  AuthMenuDao get authMenuDao;
}
