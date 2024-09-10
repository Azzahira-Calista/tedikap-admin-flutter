class SessionTimeDataResponse {
  List<SessionTimes>? sessionTimes;

  SessionTimeDataResponse({this.sessionTimes});

  SessionTimeDataResponse.fromJson(Map<String, dynamic> json) {
    if (json['session_times'] != null) {
      sessionTimes = <SessionTimes>[];
      json['session_times'].forEach((v) {
        sessionTimes!.add(new SessionTimes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.sessionTimes != null) {
      data['session_times'] =
          this.sessionTimes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SessionTimes {
  int? id;
  String? sessionName;
  String? startTime;
  String? endTime;
  String? createdAt;
  String? updatedAt;

  SessionTimes(
      {this.id,
        this.sessionName,
        this.startTime,
        this.endTime,
        this.createdAt,
        this.updatedAt});

  SessionTimes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sessionName = json['session_name'];
    startTime = json['start_time'];
    endTime = json['end_time'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['session_name'] = this.sessionName;
    data['start_time'] = this.startTime;
    data['end_time'] = this.endTime;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
