class RegisterWargaDomain{
  String? area_code_generate;
  String? nik;
  // String? photo_nik;
  // String? nkk;
  // String? photo_nkk;
  String? name;
  String? address_ktp;
  String? address_domisili;
  // String? gender;
  String? email;
  String? phone;
  // String? pob;
  // String? dob;
  // String? status_keluarga;
  // String? status_pekerjaan;
  // String? status_agama;
  // String? status_nikah;
  String? username;
  // String? password;

  String? resultArea;
  String? resultResponsible;

  RegisterWargaDomain({
    this.area_code_generate,
    this.nik,
    // this.photo_nik,
    // this.nkk,
    // this.photo_nkk,
    this.name,
    this.address_ktp,
    this.address_domisili,
    // this.gender,
    this.email,
    this.phone,
    // this.pob,
    // this.dob,
    // this.status_keluarga,
    // this.status_pekerjaan,
    // this.status_agama,
    // this.status_nikah,
    this.username,
    // this.password,
    this.resultArea,
    this.resultResponsible,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["area_code_generate"] = area_code_generate;
    data["nik"] = nik;
    // data["photo_nik"] = photo_nik;
    // data["nkk"] = nkk;
    // data["photo_nkk"] = photo_nkk;
    data["name"] = name;
    data["address_ktp"] = address_ktp;
    data["address_domisili"] = address_domisili;
    // data["gender"] = gender;
    data["email"] = email;
    data["phone"] = phone;
    // data["pob"] = pob;
    // data["dob"] = dob;
    // data["status_keluarga"] = status_keluarga;
    // data["status_pekerjaan"] = status_pekerjaan;
    // data["status_agama"] = status_agama;
    // data["status_nikah"] = status_nikah;
    data["username"] = username;
    // data["password"] = password;
    return data;
  }
}