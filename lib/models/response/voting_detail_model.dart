import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class VotingDetailModel extends Equatable {
  VotingDetailModel({
    this.id,
    this.areaId,
    this.name,
    this.expired,
    this.createdName,
    this.areaName,
    this.updatedAt,
    required this.detail,
    required this.voters,
  });

  String? id;
  String? areaId;
  String? name;
  String? expired;
  String? createdName;
  String? areaName;
  String? updatedAt;
  List<Detail> detail;
  List<Voter> voters;

  @override
  List<Object?> get props {
    return [
      id,
      areaId,
      name,
      expired,
      createdName,
      areaName,
      updatedAt,
      detail,
      voters,
    ];
  }

  factory VotingDetailModel.fromJson(Map<String, dynamic> json){
    return VotingDetailModel(
      id: json["id"],
      areaId: json["area_id"],
      name: json["name"],
      expired: json["expired"],
      createdName: json["created_name"],
      areaName: json["area_name"],
      updatedAt: json["updated_at"],
      detail: json["detail"] == null ? [] : List<Detail>.from(json["detail"]!.map((x) => Detail.fromJson(x))),
      voters: json["voters"] == null ? [] : List<Voter>.from(json["voters"]!.map((x) => Voter.fromJson(x))),
    );
  }
}

class Detail extends Equatable {
  Detail({
    this.votingId,
    this.urutan,
    this.answer,
    this.totalVote,
    this.totalUser,
    this.votePercent,
  });

  String? votingId;
  String? urutan;
  String? answer;
  String? totalVote;
  String? totalUser;
  String? votePercent;

  @override
  List<Object?> get props {
    return [
      votingId,
      urutan,
      answer,
      totalVote,
      totalUser,
      votePercent,
    ];
  }

  factory Detail.fromJson(Map<String, dynamic> json){
    return Detail(
      votingId: json["voting_id"],
      urutan: json["urutan"],
      answer: json["answer"],
      totalVote: json["total_vote"],
      totalUser: json["total_user"],
      votePercent: json["vote_percent"],
    );
  }
}

class Voter extends Equatable {
  Voter({
    this.votingId,
    this.urutan,
    this.answer,
    this.userId,
    this.createdName,
    this.updatedAt,
  });

  String? votingId;
  String? urutan;
  String? answer;
  String? userId;
  String? createdName;
  String? updatedAt;

  @override
  List<Object?> get props {
    return [
      votingId,
      urutan,
      answer,
      userId,
      createdName,
      updatedAt,
    ];
  }

  factory Voter.fromJson(Map<String, dynamic> json){
    return Voter(
      votingId: json["voting_id"],
      urutan: json["urutan"],
      answer: json["answer"],
      userId: json["user_id"],
      createdName: json["created_name"],
      updatedAt: json["updated_at"],
    );
  }
}
