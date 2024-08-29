class StatusStoreResponse {
  String? message;
  Data? data;

  StatusStoreResponse({this.message, this.data});

  StatusStoreResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  bool? statusStore;
  String? description;
  String? session;
  String? time;

  Data({this.statusStore, this.description, this.session, this.time});

  Data.fromJson(Map<String, dynamic> json) {
    statusStore = json['status_store'];
    description = json['description'];
    session = json['session'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status_store'] = this.statusStore;
    data['description'] = this.description;
    data['session'] = this.session;
    data['time'] = this.time;
    return data;
  }
}
