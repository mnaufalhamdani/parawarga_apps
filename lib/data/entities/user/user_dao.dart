import 'package:floor/floor.dart';

import 'user.dart';

@dao
abstract class UserDao {
  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertEntity(UserEntity model);

  @Update(onConflict: OnConflictStrategy.replace)
  Future<void> updateEntity(UserEntity model);

  @delete
  Future<void> deleteEntity(UserEntity model);

  @Query('DELETE FROM user')
  Future<void> deleteAll();

  @Query('SELECT * FROM user WHERE status = 1 ORDER BY id ASC LIMIT 1')
  Future<List<UserEntity>> getUser();

  @Query('SELECT * FROM user WHERE username = :username AND status = 1 ORDER BY id ASC LIMIT 1')
  Future<List<UserEntity>> getUserById(String username);
}
