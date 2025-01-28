import 'package:intl/intl.dart';
import 'package:parawarga_apps/core/constants.dart';
import 'package:parawarga_apps/data/entities/area/area.dart';
import 'package:parawarga_apps/data/entities/auth_menu/auth_menu.dart';

import '../response/login_model.dart';

AuthMenuEntity AuthMenuMapper(MenuModel model) {
  return AuthMenuEntity(
    menu_id : model.menuId ?? 0,
    is_create : model.isCreate,
    is_read : model.isRead,
    is_update : model.isUpdate,
    is_delete : model.isDelete,
    is_approve : model.isApprove,
    urutan : model.urutan,
    type_menu : model.typeMenu,
    name : model.name,
    slug : model.slug,
    link : model.link,
    icon : model.icon,
    level : model.level,
    parent_id : model.parentId,
    keterangan : model.keterangan,
    status : model.status ?? 0,
    statusKirim : 0,
    createdAt : DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()),
    updatedAt : DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()),
  );
}