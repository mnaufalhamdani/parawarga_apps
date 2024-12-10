import 'package:floor/floor.dart';
import 'package:parawarga_apps/data/entities/area/area.dart';

@dao
abstract class AreaDao {
  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertEntity(AreaEntity model);

  @Update(onConflict: OnConflictStrategy.replace)
  Future<void> updateEntity(AreaEntity model);

  @delete
  Future<void> deleteEntity(AreaEntity model);

  @Query('DELETE FROM area')
  Future<void> deleteAll();

  @Query('''SELECT * FROM area WHERE 
    status = 1
    AND (license_type = 'TRIAL' AND DATE(end_date) > DATE(DATE('now')))
	  OR (license_type = 'EXPIRED' AND DATE(end_date, '+6 months') > DATE(DATE('now')))
	  OR license_type = 'SUBSCRIBE'
	  ORDER BY area_id ASC''')
  Future<List<AreaEntity>> getArea();

  @Query('SELECT * FROM area WHERE area_id = :area_id ORDER BY id ASC LIMIT 1')
  Future<List<AreaEntity>> getAreaById(int area_id);
}
