import 'package:floor/floor.dart';

final migration1to2 = Migration(1, 2, (database) async {
  await database.execute('ALTER TABLE user ADD COLUMN token TEXT');
  await database.execute('ALTER TABLE user ADD COLUMN newApps INTEGER');
});

final migration2to3 = Migration(2, 3, (database) async {
  await database.execute('''CREATE TABLE IF NOT EXISTS area (
    area_id INTEGER NOT NULL,
    area_name TEXT NOT NULL,
    address TEXT NOT NULL,
    role_id INTEGER,
    license_code_validation TEXT,
    end_date TEXT,
    license_type TEXT,
    kelurahan_name TEXT,
    provinsi_name TEXT,
    kabupaten_name TEXT,
    kecamatan_name TEXT,
    status INTEGER,
    statusKirim INTEGER,
    createdAt TEXT,
    updatedAt TEXT,
    PRIMARY KEY (area_id))''');
});