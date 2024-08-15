
class Datas {
  String? route;

  Datas({this.route});

  Datas.fromJson(Map<String, dynamic> json) {
    route = json['route'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['route'] = this.route;
    return data;
  }
}

class Notification {
  String? title;
  String? body;
  String? image;

  Notification({this.title, this.body, this.image});

  Notification.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    body = json['body'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = this.title;
    data['body'] = this.body;
    data['image'] = this.image; 
    return data;
  }
}
