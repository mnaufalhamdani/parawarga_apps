
class LoginModel {
  LoginModel({
    this.id,
    this.username,
    this.password,
    this.pin,
    this.name,
    this.address_ktp,
    this.address_domisili,
    this.gender,
    this.divisi,
    this.email,
    this.phone,
    this.dob,
    this.pob,
    this.nik,
    this.nkk,
    this.photo_nik,
    this.photo_nkk,
    this.photo,
    this.status_keluarga,
    this.status_pekerjaan,
    this.status_agama,
    this.status_nikah,
    this.device_id,
    this.firebase_id,
    this.activated_at,
    this.blocked_at,
    this.login_at,
    this.token,
    required this.area,
    required this.menu,
  });

  String? id;
  String? username;
  String? password;
  String? pin;
  String? name;
  String? address_ktp;
  String? address_domisili;
  String? gender;
  String? divisi;
  String? email;
  String? phone;
  String? dob;
  String? pob;
  String? nik;
  String? nkk;
  String? photo_nik;
  String? photo_nkk;
  String? photo;
  String? status_keluarga;
  String? status_pekerjaan;
  String? status_agama;
  String? status_nikah;
  String? device_id;
  String? firebase_id;
  String? activated_at;
  String? blocked_at;
  String? login_at;
  String? token;
  List<LoginAreaModel> area;
  List<MenuModel> menu;

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      id: json['id'],
      username: json['username'],
      password: json['password'],
      pin: json['pin'],
      name: json['name'],
      address_ktp: json['address_ktp'],
      address_domisili: json['address_domisili'],
      gender: json['gender'],
      divisi: json['divisi'],
      email: json['email'],
      phone: json['phone'],
      dob: json['dob'],
      pob: json['pob'],
      nik: json['nik'],
      nkk: json['nkk'],
      photo_nik: json['photo_nik'],
      photo_nkk: json['photo_nkk'],
      photo: json['photo'],
      status_keluarga: json['status_keluarga'],
      status_pekerjaan: json['status_pekerjaan'],
      status_agama: json['status_agama'],
      status_nikah: json['status_nikah'],
      device_id: json['device_id'],
      firebase_id: json['firebase_id'],
      activated_at: json['activated_at'],
      blocked_at: json['blocked_at'],
      login_at: json['login_at'],
      token: json['token'],
      area: json['area'] == null ? [] : List<LoginAreaModel>.from(json["area"]!.map((x) => LoginAreaModel.fromJson(x))),
      menu: json['menu'] == null ? [] : List<MenuModel>.from(json["menu"]!.map((x) => MenuModel.fromJson(x))),
    );
  }
}

class LoginAreaModel {
  LoginAreaModel({
    this.area_id,
    this.area_name,
    this.address,
    this.titik_code,
    this.role_id,
    this.role,
    this.license_code_validation,
    this.end_date,
    this.license_type,
    this.status,
    this.kelurahan_name,
    this.provinsi_name,
    this.kabupaten_name,
    this.kecamatan_name,
  });

  String? area_id;
  String? area_name;
  String? address;
  String? titik_code;
  String? role_id;
  String? role;
  String? license_code_validation;
  String? end_date;
  String? license_type;
  String? status;
  String? kelurahan_name;
  String? provinsi_name;
  String? kabupaten_name;
  String? kecamatan_name;

  factory LoginAreaModel.fromJson(Map<String, dynamic> json) {
    return LoginAreaModel(
      area_id: json['area_id'],
      area_name: json['area_name'],
      address: json['address'],
      titik_code: json['titik_code'],
      role_id: json['role_id'],
      role: json['role'],
      license_code_validation: json['license_code_validation'],
      end_date: json['end_date'],
      license_type: json['license_type'],
      status: json['status'].toString(),
      kelurahan_name: json['kelurahan_name'],
      provinsi_name: json['provinsi_name'],
      kabupaten_name: json['kabupaten_name'],
      kecamatan_name: json['kecamatan_name'],
    );
  }
}

class MenuModel {
  MenuModel({
    this.userId,
    this.menuId,
    this.isCreate,
    this.isRead,
    this.isUpdate,
    this.isDelete,
    this.isApprove,
    this.status,
    this.urutan,
    this.typeMenu,
    this.name,
    this.slug,
    this.link,
    this.icon,
    this.level,
    this.parentId,
    this.keterangan,
  });

  int? userId;
  int? menuId;
  int? isCreate;
  int? isRead;
  int? isUpdate;
  int? isDelete;
  int? isApprove;
  int? status;
  int? urutan;
  String? typeMenu;
  String? name;
  String? slug;
  String? link;
  String? icon;
  int? level;
  int? parentId;
  String? keterangan;

  factory MenuModel.fromJson(Map<String, dynamic> json){
    return MenuModel(
      userId: int.parse(json["user_id"]),
      menuId: int.parse(json["menu_id"]),
      isCreate: int.parse(json["is_create"]),
      isRead: int.parse(json["is_read"]),
      isUpdate: int.parse(json["is_update"]),
      isDelete: int.parse(json["is_delete"]),
      isApprove: int.parse(json["is_approve"]),
      status: int.parse(json["status"]),
      urutan: int.parse(json["urutan"]),
      typeMenu: json["type_menu"],
      name: json["name"],
      slug: json["slug"],
      link: json["link"],
      icon: json["icon"],
      level: int.parse(json["level"]),
      parentId: int.parse(json["parent_id"]),
      keterangan: json["keterangan"],
    );
  }
}
