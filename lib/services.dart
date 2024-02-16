class Services {
  final String userid;
  final String service;
  final String serviceid;

  Services({
    required this.userid,
    required this.service,
    required this.serviceid,
  });

  Map<String, dynamic> toJson() => {
        'userid': userid,
        'service': service,
        'serviceid': serviceid,
      };

  static Services fromJson(Map<String, dynamic> json) => Services(
        userid: json['userid'],
        service: json['service'],
        serviceid: json['serviceid'],
      );
}
