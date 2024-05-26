class Aquatic {
  String? title;
  String? desc;
  String? imgUrl;
  List<Animals>? animals;

  Aquatic({this.title, this.desc, this.imgUrl, this.animals});

  Aquatic.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    desc = json['desc'];
    imgUrl = json['img_url'];
    if (json['animals'] != null) {
      animals = <Animals>[];
      json['animals'].forEach((v) {
        animals!.add(Animals.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['desc'] = desc;
    data['img_url'] = imgUrl;
    if (animals != null) {
      data['animals'] = animals!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Animals {
  String? name;
  String? desc;
  String? imgUrl;
  String? audio;

  Animals({this.name, this.desc, this.imgUrl, this.audio});

  Animals.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    desc = json['desc'];
    imgUrl = json['img_url'];
    audio = json['audio'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['desc'] = desc;
    data['img_url'] = imgUrl;
    data['audio'] = audio;
    return data;
  }
}
