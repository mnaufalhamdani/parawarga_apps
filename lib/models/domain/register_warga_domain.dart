class RegisterWargaDomain{
  String? area_generate;
  String? nik;
  String? photo;
  String? photo_temp;
  String? name;
  String? address_ktp;
  String? address_domisili;
  String? email;
  String? phone;
  String? username;
  String? password;

  String? resultMsgArea;
  String? resultMsgResponsible;
  String? resultMsgId;

  RegisterWargaDomain({
    this.area_generate,
    this.nik,
    this.photo,
    this.photo_temp,
    this.name,
    this.address_ktp,
    this.address_domisili,
    this.email,
    this.phone,
    this.username,
    this.password,
    this.resultMsgArea,
    this.resultMsgResponsible,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["area_generate"] = area_generate;
    data["nik"] = nik;
    data["photo"] = photo;
    data["name"] = name;
    data["address_ktp"] = address_ktp;
    data["address_domisili"] = address_domisili;
    data["email"] = email;
    data["phone"] = phone;
    data["username"] = username;
    data["password"] = password;
    return data;
  }
}