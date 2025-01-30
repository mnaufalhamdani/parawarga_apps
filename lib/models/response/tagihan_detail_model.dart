class TagihanDetailModel {
  TagihanDetailModel({
    this.id,
    this.name,
    this.message,
    this.createdBy,
    this.createdName,
    this.areaName,
    this.nominal,
    this.periode,
    this.periodeType,
    this.myPeriode,
    this.totalPeriode,
    this.labelInvoice,
    this.startPeriode,
    this.endPeriode,
    this.updatedAt,
    required this.history,
    required this.bank,
  });

  String? id;
  String? name;
  String? message;
  String? createdBy;
  String? createdName;
  String? areaName;
  String? nominal;
  String? periode;
  String? periodeType;
  String? myPeriode;
  String? totalPeriode;
  String? labelInvoice;
  String? startPeriode;
  String? endPeriode;
  String? updatedAt;
  List<History> history;
  List<Bank> bank;

  factory TagihanDetailModel.fromJson(Map<String, dynamic> json){
    return TagihanDetailModel(
      id: json["id"],
      name: json["name"],
      message: json["message"],
      createdBy: json["created_by"],
      createdName: json["created_name"],
      areaName: json["area_name"],
      nominal: json["nominal"],
      periode: json["periode"],
      periodeType: json["periode_type"],
      myPeriode: json["my_periode"],
      totalPeriode: json["total_periode"],
      labelInvoice: json["label_invoice"],
      startPeriode: json["start_periode"],
      endPeriode: json["end_periode"],
      updatedAt: json["updated_at"],
      history: json["history"] == null ? [] : List<History>.from(json["history"]!.map((x) => History.fromJson(x))),
      bank: json["bank"] == null ? [] : List<Bank>.from(json["bank"]!.map((x) => Bank.fromJson(x))),
    );
  }
}

class History {
  History({
    this.tagihanId,
    this.periode,
    this.total,
    required this.user,
  });

  String? tagihanId;
  String? periode;
  String? total;
  List<User> user;

  factory History.fromJson(Map<String, dynamic> json){
    return History(
      tagihanId: json["tagihan_id"],
      periode: json["periode"],
      total: json["total"],
      user: json["user"] == null ? [] : List<User>.from(json["user"]!.map((x) => User.fromJson(x))),
    );
  }
}

class User {
  User({
    this.tagihanId,
    this.userId,
    this.createdName,
    this.periode,
    this.nominal,
    this.receipt,
    this.updatedAt,
    this.status,
    this.statusName,
  });

  String? tagihanId;
  String? userId;
  String? createdName;
  String? periode;
  String? nominal;
  String? receipt;
  String? updatedAt;
  String? status;
  String? statusName;

  factory User.fromJson(Map<String, dynamic> json){
    return User(
      tagihanId: json["tagihan_id"],
      userId: json["user_id"],
      createdName: json["created_name"],
      periode: json["periode"],
      nominal: json["nominal"],
      receipt: json["receipt"],
      updatedAt: json["updated_at"],
      status: json["status"],
      statusName: json["status_name"],
    );
  }
}

class Bank {
  Bank({
    this.id,
    this.accountNumber,
    this.bankCodeName,
    this.accountName,
    this.name,
    this.fullname,
  });

  String? id;
  String? accountNumber;
  String? bankCodeName;
  String? accountName;
  String? name;
  String? fullname;

  factory Bank.fromJson(Map<String, dynamic> json){
    return Bank(
      id: json["id"],
      accountNumber: json["account_number"],
      bankCodeName: json["bank_code_name"],
      accountName: json["account_name"],
      name: json["name"],
      fullname: json["fullname"],
    );
  }
}
