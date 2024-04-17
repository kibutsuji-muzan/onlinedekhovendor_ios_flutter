class Service {
  final String sid;
  final String serviceName;

  Service({required this.sid, required this.serviceName});

  factory Service.fromJson(Map<String, dynamic> json) {
    return Service(
      sid: json['sid'],
      serviceName: json['servicename'],
    );
  }
}
