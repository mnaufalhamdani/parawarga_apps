class TagihanTempModel {
  TagihanTempModel({
    this.tagihanTempId,
    this.tagihanId,
    this.beritaAcara,
    this.name,
    this.totalPeriode,
    this.totalNominal,
    this.receipt,
    this.createdBy,
    this.createdName,
    this.areaId,
    this.areaName,
    this.accountBankId,
    this.accountNumber,
    this.accountName,
    this.bankCodeName,
    this.bankCode,
    this.bankName,
    this.expired,
    this.expiredName,
    this.updatedAt,
    this.statusName,
    this.status,
  });

  String? tagihanTempId;
  String? tagihanId;
  String? beritaAcara;
  String? name;
  String? totalPeriode;
  String? totalNominal;
  String? receipt;
  String? createdBy;
  String? createdName;
  String? areaId;
  String? areaName;
  String? accountBankId;
  String? accountNumber;
  String? accountName;
  String? bankCodeName;
  String? bankCode;
  String? bankName;
  String? expired;
  String? expiredName;
  String? updatedAt;
  String? statusName;
  int? status;

  factory TagihanTempModel.fromJson(Map<String, dynamic> json){
    return TagihanTempModel(
      tagihanTempId: json["tagihan_temp_id"],
      tagihanId: json["tagihan_id"],
      beritaAcara: json["berita_acara"],
      name: json["name"],
      totalPeriode: json["total_periode"],
      totalNominal: json["total_nominal"],
      receipt: json["receipt"],
      createdBy: json["created_by"],
      createdName: json["created_name"],
      areaId: json["area_id"],
      areaName: json["area_name"],
      accountBankId: json["account_bank_id"],
      accountNumber: json["account_number"],
      accountName: json["account_name"],
      bankCodeName: json["bank_code_name"],
      bankCode: json["bank_code"],
      bankName: json["bank_name"],
      expired: json["expired"],
      expiredName: json["expired_name"],
      updatedAt: json["updated_at"],
      statusName: json["status_name"],
      status: int.parse(json["status"]),
    );
  }

}
