class Date {
  final String userid;
  final String date;
  final String guest;
  final String image;
  final String dateid;

  Date({
    required this.userid,
    required this.date,
    required this.guest,
    required this.image,
    required this.dateid,
  });

  Map<String, dynamic> toJson() => {
        'userid': userid,
        'date': date,
        'guest': guest,
        'image': image,
        'dateid': dateid,
      };

  static Date fromJson(Map<String, dynamic> json) => Date(
        userid: json['userid'],
        date: json['date'],
        guest: json['guest'],
        image: json['image'],
        dateid: json['dateid'],
      );
}
