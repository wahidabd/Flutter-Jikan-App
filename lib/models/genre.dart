class Genre {
  int? malId;
  String? type;
  String? name;
  String? url;

  Genre({
    this.malId,
    this.type,
    this.name,
    this.url,
  });

  Genre.fromJson(Map<String, dynamic> json) {
    malId = json['mal_id'];
    type = json['type'];
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['mal_id'] = malId;
    data['type'] = type;
    data['name'] = name;
    data['url'] = url;
    return data;
  }
}