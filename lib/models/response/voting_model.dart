class VotingModel {
  VotingModel({
    this.id,
    this.name,
    this.expired,
    this.createdBy,
    this.createdName,
    this.areaId,
    this.areaName,
    this.updatedAt,
    this.urutan,
    required this.history,
    required this.detail,
  });

  final String? id;
  final String? name;
  final String? expired;
  final String? createdBy;
  final String? createdName;
  final String? areaId;
  final String? areaName;
  final String? updatedAt;
  final String? urutan;
  final List<History> history;
  final List<Detail> detail;

  factory VotingModel.fromJson(Map<String, dynamic> json){
    return VotingModel(
      id: json["id"],
      name: json["name"],
      expired: json["expired"],
      createdBy: json["created_by"],
      createdName: json["created_name"],
      areaId: json["area_id"],
      areaName: json["area_name"],
      updatedAt: json["updated_at"],
      urutan: json["urutan"],
      history: json["history"] == null ? [] : List<History>.from(json["history"]!.map((x) => History.fromJson(x))),
      detail: json["detail"] == null ? [] : List<Detail>.from(json["detail"]!.map((x) => Detail.fromJson(x))),
    );
  }

}

class Detail {
  Detail({
    this.urutan,
    this.answer,
  });

  final String? urutan;
  final String? answer;

  factory Detail.fromJson(Map<String, dynamic> json){
    return Detail(
      urutan: json["urutan"],
      answer: json["answer"],
    );
  }

}

class History {
  History({
    this.votingId,
    this.urutan,
    this.answer,
    this.totalVote,
    this.totalUser,
    this.votePercent,
  });

  final String? votingId;
  final String? urutan;
  final String? answer;
  final String? totalVote;
  final String? totalUser;
  final String? votePercent;

  factory History.fromJson(Map<String, dynamic> json){
    return History(
      votingId: json["voting_id"],
      urutan: json["urutan"],
      answer: json["answer"],
      totalVote: json["total_vote"],
      totalUser: json["total_user"],
      votePercent: json["vote_percent"],
    );
  }

}
