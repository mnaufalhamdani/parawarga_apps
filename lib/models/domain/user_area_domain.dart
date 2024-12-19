import 'package:parawarga_apps/data/entities/area/area.dart';
import 'package:parawarga_apps/data/entities/user/user.dart';

class UserAreaDomain{
  UserEntity userEntity;
  List<AreaEntity>? areaEntity;

  UserAreaDomain({
    required this.userEntity,
    this.areaEntity,
  });
}