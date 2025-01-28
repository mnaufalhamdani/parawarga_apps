import 'package:floor/floor.dart';
import 'package:parawarga_apps/data/entities/auth_menu/auth_menu.dart';


@dao
abstract class AuthMenuDao {
  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertEntity(AuthMenuEntity model);

  @Update(onConflict: OnConflictStrategy.replace)
  Future<void> updateEntity(AuthMenuEntity model);

  @delete
  Future<void> deleteEntity(AuthMenuEntity model);

  @Query('DELETE FROM auth_menu')
  Future<void> deleteAll();

  @Query('SELECT * FROM auth_menu WHERE status = 1 ORDER BY urutan ASC')
  Future<List<AuthMenuEntity>> getAuthMenu();

  @Query('SELECT * FROM auth_menu WHERE type_menu = :typeMenu AND status = 1 ORDER BY urutan ASC')
  Future<List<AuthMenuEntity>> getAuthMenuByMenu(String typeMenu);
}
