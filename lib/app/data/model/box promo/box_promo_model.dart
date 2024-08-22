// class Data {
//   int? id;
//   String? title;
//   String? subtitle;
//   String? image;

//   Data({this.id, this.title, this.subtitle, this.image});

//   Data.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     title = json['title'];
//     subtitle = json['subtitle'];
//     image = json['image'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['title'] = this.title;
//     data['subtitle'] = this.subtitle;
//     data['image'] = this.image;
//     return data;
//   }
// }

class Data {
  int? id;
  String? title;
  String? subtitle;
  String? image;

  Data({this.id, this.title, this.subtitle, this.image});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    subtitle = json['subtitle'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['subtitle'] = this.subtitle;
    data['image'] = this.image;
    return data;
  }
}
