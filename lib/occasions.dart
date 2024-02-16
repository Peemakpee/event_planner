class Occasions {
  final String userid;
  final String occasion;
  final String occasionid;

  Occasions({
    required this.userid,
    required this.occasion,
    required this.occasionid,
  });

  Map<String, dynamic> toJson() => {
        'userid': userid,
        'occasion': occasion,
        'occasionid': occasionid,
      };

  static Occasions fromJson(Map<String, dynamic> json) => Occasions(
        userid: json['userid'],
        occasion: json['occasion'],
        occasionid: json['occasionid']
      );
}
