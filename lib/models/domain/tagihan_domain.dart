class TagihanHistoryDomain{
  int? dice;
  String? arisan_id;
  int? user_id;
  String? name;
  String? periode;
  String? win_date;
  String? win_nominal;
  int? created_by;

  TagihanHistoryDomain({
    this.dice,
    this.arisan_id,
    this.user_id,
    this.name,
    this.periode,
    this.win_date,
    this.win_nominal,
    this.created_by
  });

  Map<String, dynamic> toJson() => {
    "dice": dice,
    "arisan_id": arisan_id,
    "user_id": user_id,
    "name": name,
    "periode": periode,
    "win_date": win_date,
    "win_nominal": win_nominal,
    "created_by": created_by,
  };
}