class SaveVotedDomain{
  String? voting_id;
  int? user_id;
  String? urutan;

  SaveVotedDomain({
    this.voting_id,
    this.user_id,
    this.urutan,
  });

  Map<String, dynamic> toJson() => {
    "voting_id": voting_id,
    "user_id": user_id,
    "urutan": urutan,
  };
}