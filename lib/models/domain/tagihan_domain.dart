class TagihanTempDomain{
  String? account_bank_id;
  String? account_number;
  String? account_name;
  String? bank_code_name;
  String? bank_name;
  int? user_id;
  int? total_periode;
  int? total_nominal;
  String? tagihan_id;

  TagihanTempDomain({
    this.account_bank_id,
    this.account_number,
    this.account_name,
    this.bank_code_name,
    this.bank_name,
    this.user_id,
    this.total_periode,
    this.total_nominal,
    this.tagihan_id,
  });

  Map<String, dynamic> toJson() => {
    "account_bank_id": account_bank_id,
    "account_number": account_number,
    "account_name": account_name,
    "bank_code_name": bank_code_name,
    "bank_name": bank_name,
    "user_id": user_id,
    "total_periode": total_periode,
    "total_nominal": total_nominal,
    "tagihan_id": tagihan_id,
  };
}

class TagihanPembayaranDomain{
  String? tagihan_temp_id;
  String? receipt;

  TagihanPembayaranDomain({
    this.tagihan_temp_id,
    this.receipt,
  });

  Map<String, dynamic> toJson() => {
    "tagihan_temp_id": tagihan_temp_id,
    "receipt": receipt,
  };
}