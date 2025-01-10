// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database_config.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorDatabaseConfig {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$DatabaseConfigBuilder databaseBuilder(String name) =>
      _$DatabaseConfigBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$DatabaseConfigBuilder inMemoryDatabaseBuilder() =>
      _$DatabaseConfigBuilder(null);
}

class _$DatabaseConfigBuilder {
  _$DatabaseConfigBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$DatabaseConfigBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$DatabaseConfigBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<DatabaseConfig> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$DatabaseConfig();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$DatabaseConfig extends DatabaseConfig {
  _$DatabaseConfig([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  UserDao? _profileDaoInstance;

  AreaDao? _areaDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 3,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `user` (`id` INTEGER NOT NULL, `username` TEXT NOT NULL, `password` TEXT NOT NULL, `pin` INTEGER, `name` TEXT, `address_ktp` TEXT, `address_domisili` TEXT, `gender` TEXT, `divisi` TEXT, `email` TEXT, `phone` TEXT, `dob` TEXT, `pob` TEXT, `nik` TEXT, `nkk` TEXT, `photo_nik` TEXT, `photo_nkk` TEXT, `photo` TEXT, `status_keluarga` INTEGER, `status_pekerjaan` INTEGER, `status_agama` INTEGER, `status_nikah` INTEGER, `device_id` TEXT, `firebase_id` TEXT, `activated_at` TEXT, `blocked_at` TEXT, `login_at` TEXT, `token` TEXT, `newApps` INTEGER, `status` INTEGER, `statusKirim` INTEGER, `createdAt` TEXT, `updatedAt` TEXT, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `area` (`area_id` INTEGER NOT NULL, `area_name` TEXT NOT NULL, `address` TEXT NOT NULL, `role_id` INTEGER, `license_code_validation` TEXT, `end_date` TEXT, `license_type` TEXT, `kelurahan_name` TEXT, `provinsi_name` TEXT, `kabupaten_name` TEXT, `kecamatan_name` TEXT, `status` INTEGER, `statusKirim` INTEGER, `createdAt` TEXT, `updatedAt` TEXT, PRIMARY KEY (`area_id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  UserDao get profileDao {
    return _profileDaoInstance ??= _$UserDao(database, changeListener);
  }

  @override
  AreaDao get areaDao {
    return _areaDaoInstance ??= _$AreaDao(database, changeListener);
  }
}

class _$UserDao extends UserDao {
  _$UserDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _userEntityInsertionAdapter = InsertionAdapter(
            database,
            'user',
            (UserEntity item) => <String, Object?>{
                  'id': item.id,
                  'username': item.username,
                  'password': item.password,
                  'pin': item.pin,
                  'name': item.name,
                  'address_ktp': item.address_ktp,
                  'address_domisili': item.address_domisili,
                  'gender': item.gender,
                  'divisi': item.divisi,
                  'email': item.email,
                  'phone': item.phone,
                  'dob': item.dob,
                  'pob': item.pob,
                  'nik': item.nik,
                  'nkk': item.nkk,
                  'photo_nik': item.photo_nik,
                  'photo_nkk': item.photo_nkk,
                  'photo': item.photo,
                  'status_keluarga': item.status_keluarga,
                  'status_pekerjaan': item.status_pekerjaan,
                  'status_agama': item.status_agama,
                  'status_nikah': item.status_nikah,
                  'device_id': item.device_id,
                  'firebase_id': item.firebase_id,
                  'activated_at': item.activated_at,
                  'blocked_at': item.blocked_at,
                  'login_at': item.login_at,
                  'token': item.token,
                  'newApps': item.newApps,
                  'status': item.status,
                  'statusKirim': item.statusKirim,
                  'createdAt': item.createdAt,
                  'updatedAt': item.updatedAt
                }),
        _userEntityUpdateAdapter = UpdateAdapter(
            database,
            'user',
            ['id'],
            (UserEntity item) => <String, Object?>{
                  'id': item.id,
                  'username': item.username,
                  'password': item.password,
                  'pin': item.pin,
                  'name': item.name,
                  'address_ktp': item.address_ktp,
                  'address_domisili': item.address_domisili,
                  'gender': item.gender,
                  'divisi': item.divisi,
                  'email': item.email,
                  'phone': item.phone,
                  'dob': item.dob,
                  'pob': item.pob,
                  'nik': item.nik,
                  'nkk': item.nkk,
                  'photo_nik': item.photo_nik,
                  'photo_nkk': item.photo_nkk,
                  'photo': item.photo,
                  'status_keluarga': item.status_keluarga,
                  'status_pekerjaan': item.status_pekerjaan,
                  'status_agama': item.status_agama,
                  'status_nikah': item.status_nikah,
                  'device_id': item.device_id,
                  'firebase_id': item.firebase_id,
                  'activated_at': item.activated_at,
                  'blocked_at': item.blocked_at,
                  'login_at': item.login_at,
                  'token': item.token,
                  'newApps': item.newApps,
                  'status': item.status,
                  'statusKirim': item.statusKirim,
                  'createdAt': item.createdAt,
                  'updatedAt': item.updatedAt
                }),
        _userEntityDeletionAdapter = DeletionAdapter(
            database,
            'user',
            ['id'],
            (UserEntity item) => <String, Object?>{
                  'id': item.id,
                  'username': item.username,
                  'password': item.password,
                  'pin': item.pin,
                  'name': item.name,
                  'address_ktp': item.address_ktp,
                  'address_domisili': item.address_domisili,
                  'gender': item.gender,
                  'divisi': item.divisi,
                  'email': item.email,
                  'phone': item.phone,
                  'dob': item.dob,
                  'pob': item.pob,
                  'nik': item.nik,
                  'nkk': item.nkk,
                  'photo_nik': item.photo_nik,
                  'photo_nkk': item.photo_nkk,
                  'photo': item.photo,
                  'status_keluarga': item.status_keluarga,
                  'status_pekerjaan': item.status_pekerjaan,
                  'status_agama': item.status_agama,
                  'status_nikah': item.status_nikah,
                  'device_id': item.device_id,
                  'firebase_id': item.firebase_id,
                  'activated_at': item.activated_at,
                  'blocked_at': item.blocked_at,
                  'login_at': item.login_at,
                  'token': item.token,
                  'newApps': item.newApps,
                  'status': item.status,
                  'statusKirim': item.statusKirim,
                  'createdAt': item.createdAt,
                  'updatedAt': item.updatedAt
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<UserEntity> _userEntityInsertionAdapter;

  final UpdateAdapter<UserEntity> _userEntityUpdateAdapter;

  final DeletionAdapter<UserEntity> _userEntityDeletionAdapter;

  @override
  Future<void> deleteAll() async {
    await _queryAdapter.queryNoReturn('DELETE FROM user');
  }

  @override
  Future<List<UserEntity>> getUser() async {
    return _queryAdapter.queryList(
        'SELECT * FROM user WHERE status = 1 ORDER BY id ASC LIMIT 1',
        mapper: (Map<String, Object?> row) => UserEntity(
            id: row['id'] as int,
            username: row['username'] as String,
            password: row['password'] as String,
            pin: row['pin'] as int?,
            name: row['name'] as String?,
            address_ktp: row['address_ktp'] as String?,
            address_domisili: row['address_domisili'] as String?,
            gender: row['gender'] as String?,
            divisi: row['divisi'] as String?,
            email: row['email'] as String?,
            phone: row['phone'] as String?,
            dob: row['dob'] as String?,
            pob: row['pob'] as String?,
            nik: row['nik'] as String?,
            nkk: row['nkk'] as String?,
            photo_nik: row['photo_nik'] as String?,
            photo_nkk: row['photo_nkk'] as String?,
            photo: row['photo'] as String?,
            status_keluarga: row['status_keluarga'] as int?,
            status_pekerjaan: row['status_pekerjaan'] as int?,
            status_agama: row['status_agama'] as int?,
            status_nikah: row['status_nikah'] as int?,
            device_id: row['device_id'] as String?,
            firebase_id: row['firebase_id'] as String?,
            activated_at: row['activated_at'] as String?,
            blocked_at: row['blocked_at'] as String?,
            login_at: row['login_at'] as String?,
            token: row['token'] as String?,
            newApps: row['newApps'] as int?,
            status: row['status'] as int?,
            statusKirim: row['statusKirim'] as int?,
            createdAt: row['createdAt'] as String?,
            updatedAt: row['updatedAt'] as String?));
  }

  @override
  Future<List<UserEntity>> getUserById(String username) async {
    return _queryAdapter.queryList(
        'SELECT * FROM user WHERE username = ?1 AND status = 1 ORDER BY id ASC LIMIT 1',
        mapper: (Map<String, Object?> row) => UserEntity(id: row['id'] as int, username: row['username'] as String, password: row['password'] as String, pin: row['pin'] as int?, name: row['name'] as String?, address_ktp: row['address_ktp'] as String?, address_domisili: row['address_domisili'] as String?, gender: row['gender'] as String?, divisi: row['divisi'] as String?, email: row['email'] as String?, phone: row['phone'] as String?, dob: row['dob'] as String?, pob: row['pob'] as String?, nik: row['nik'] as String?, nkk: row['nkk'] as String?, photo_nik: row['photo_nik'] as String?, photo_nkk: row['photo_nkk'] as String?, photo: row['photo'] as String?, status_keluarga: row['status_keluarga'] as int?, status_pekerjaan: row['status_pekerjaan'] as int?, status_agama: row['status_agama'] as int?, status_nikah: row['status_nikah'] as int?, device_id: row['device_id'] as String?, firebase_id: row['firebase_id'] as String?, activated_at: row['activated_at'] as String?, blocked_at: row['blocked_at'] as String?, login_at: row['login_at'] as String?, token: row['token'] as String?, newApps: row['newApps'] as int?, status: row['status'] as int?, statusKirim: row['statusKirim'] as int?, createdAt: row['createdAt'] as String?, updatedAt: row['updatedAt'] as String?),
        arguments: [username]);
  }

  @override
  Future<void> insertEntity(UserEntity model) async {
    await _userEntityInsertionAdapter.insert(model, OnConflictStrategy.replace);
  }

  @override
  Future<void> updateEntity(UserEntity model) async {
    await _userEntityUpdateAdapter.update(model, OnConflictStrategy.replace);
  }

  @override
  Future<void> deleteEntity(UserEntity model) async {
    await _userEntityDeletionAdapter.delete(model);
  }
}

class _$AreaDao extends AreaDao {
  _$AreaDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _areaEntityInsertionAdapter = InsertionAdapter(
            database,
            'area',
            (AreaEntity item) => <String, Object?>{
                  'area_id': item.area_id,
                  'area_name': item.area_name,
                  'address': item.address,
                  'role_id': item.role_id,
                  'license_code_validation': item.license_code_validation,
                  'end_date': item.end_date,
                  'license_type': item.license_type,
                  'kelurahan_name': item.kelurahan_name,
                  'provinsi_name': item.provinsi_name,
                  'kabupaten_name': item.kabupaten_name,
                  'kecamatan_name': item.kecamatan_name,
                  'status': item.status,
                  'statusKirim': item.statusKirim,
                  'createdAt': item.createdAt,
                  'updatedAt': item.updatedAt
                }),
        _areaEntityUpdateAdapter = UpdateAdapter(
            database,
            'area',
            ['area_id'],
            (AreaEntity item) => <String, Object?>{
                  'area_id': item.area_id,
                  'area_name': item.area_name,
                  'address': item.address,
                  'role_id': item.role_id,
                  'license_code_validation': item.license_code_validation,
                  'end_date': item.end_date,
                  'license_type': item.license_type,
                  'kelurahan_name': item.kelurahan_name,
                  'provinsi_name': item.provinsi_name,
                  'kabupaten_name': item.kabupaten_name,
                  'kecamatan_name': item.kecamatan_name,
                  'status': item.status,
                  'statusKirim': item.statusKirim,
                  'createdAt': item.createdAt,
                  'updatedAt': item.updatedAt
                }),
        _areaEntityDeletionAdapter = DeletionAdapter(
            database,
            'area',
            ['area_id'],
            (AreaEntity item) => <String, Object?>{
                  'area_id': item.area_id,
                  'area_name': item.area_name,
                  'address': item.address,
                  'role_id': item.role_id,
                  'license_code_validation': item.license_code_validation,
                  'end_date': item.end_date,
                  'license_type': item.license_type,
                  'kelurahan_name': item.kelurahan_name,
                  'provinsi_name': item.provinsi_name,
                  'kabupaten_name': item.kabupaten_name,
                  'kecamatan_name': item.kecamatan_name,
                  'status': item.status,
                  'statusKirim': item.statusKirim,
                  'createdAt': item.createdAt,
                  'updatedAt': item.updatedAt
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<AreaEntity> _areaEntityInsertionAdapter;

  final UpdateAdapter<AreaEntity> _areaEntityUpdateAdapter;

  final DeletionAdapter<AreaEntity> _areaEntityDeletionAdapter;

  @override
  Future<void> deleteAll() async {
    await _queryAdapter.queryNoReturn('DELETE FROM area');
  }

  @override
  Future<List<AreaEntity>> getArea() async {
    return _queryAdapter.queryList(
        'SELECT * FROM area WHERE      status = 1     AND (license_type = \'TRIAL\' AND DATE(end_date) > DATE(DATE(\'now\'))) \t  OR (license_type = \'EXPIRED\' AND DATE(end_date, \'+6 months\') > DATE(DATE(\'now\'))) \t  OR license_type = \'SUBSCRIBE\' \t  ORDER BY area_id ASC',
        mapper: (Map<String, Object?> row) => AreaEntity(
            area_id: row['area_id'] as int,
            area_name: row['area_name'] as String,
            address: row['address'] as String,
            role_id: row['role_id'] as int?,
            license_code_validation: row['license_code_validation'] as String?,
            end_date: row['end_date'] as String?,
            license_type: row['license_type'] as String?,
            kelurahan_name: row['kelurahan_name'] as String?,
            provinsi_name: row['provinsi_name'] as String?,
            kabupaten_name: row['kabupaten_name'] as String?,
            kecamatan_name: row['kecamatan_name'] as String?,
            status: row['status'] as int?,
            statusKirim: row['statusKirim'] as int?,
            createdAt: row['createdAt'] as String?,
            updatedAt: row['updatedAt'] as String?));
  }

  @override
  Future<List<AreaEntity>> getAreaById(int area_id) async {
    return _queryAdapter.queryList(
        'SELECT * FROM area WHERE area_id = ?1 ORDER BY id ASC LIMIT 1',
        mapper: (Map<String, Object?> row) => AreaEntity(
            area_id: row['area_id'] as int,
            area_name: row['area_name'] as String,
            address: row['address'] as String,
            role_id: row['role_id'] as int?,
            license_code_validation: row['license_code_validation'] as String?,
            end_date: row['end_date'] as String?,
            license_type: row['license_type'] as String?,
            kelurahan_name: row['kelurahan_name'] as String?,
            provinsi_name: row['provinsi_name'] as String?,
            kabupaten_name: row['kabupaten_name'] as String?,
            kecamatan_name: row['kecamatan_name'] as String?,
            status: row['status'] as int?,
            statusKirim: row['statusKirim'] as int?,
            createdAt: row['createdAt'] as String?,
            updatedAt: row['updatedAt'] as String?),
        arguments: [area_id]);
  }

  @override
  Future<void> insertEntity(AreaEntity model) async {
    await _areaEntityInsertionAdapter.insert(model, OnConflictStrategy.replace);
  }

  @override
  Future<void> updateEntity(AreaEntity model) async {
    await _areaEntityUpdateAdapter.update(model, OnConflictStrategy.replace);
  }

  @override
  Future<void> deleteEntity(AreaEntity model) async {
    await _areaEntityDeletionAdapter.delete(model);
  }
}
