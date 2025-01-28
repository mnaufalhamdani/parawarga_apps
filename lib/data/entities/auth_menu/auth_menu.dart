// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:floor/floor.dart';
import 'package:intl/intl.dart';

@Entity(tableName: 'auth_menu')
class AuthMenuEntity extends Equatable {
  @PrimaryKey(autoGenerate: false)
  int menu_id;
  int? is_create;
  int? is_read;
  int? is_update;
  int? is_delete;
  int? is_approve;
  int? urutan;
  String? type_menu;
  String? name;
  String? slug;
  String? link;
  String? icon;
  int? level;
  int? parent_id;
  String? keterangan;
  int? status = 1;
  int? statusKirim = 0;
  String? createdAt = DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
  String? updatedAt = DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());

  AuthMenuEntity({
    required this.menu_id,
    this.is_create,
    this.is_read,
    this.is_update,
    this.is_delete,
    this.is_approve,
    this.urutan,
    this.type_menu,
    this.name,
    this.slug,
    this.link,
    this.icon,
    this.level,
    this.parent_id,
    this.keterangan,
    this.status,
    this.statusKirim,
    this.createdAt,
    this.updatedAt,
  });

  @override
  List<Object?> get props {
    return [
      menu_id,
      is_create,
      is_read,
      is_update,
      is_delete,
      is_approve,
      urutan,
      type_menu,
      name,
      slug,
      link,
      icon,
      level,
      parent_id,
      keterangan,
      status,
      statusKirim,
      createdAt,
      updatedAt,
    ];
  }
}
