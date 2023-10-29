import 'package:aniflix/models/image.dart';

class Trailer {
  String? youtubeId;
  String? url;
  String? embedUrl;
  Image? image;

  Trailer({
    this.youtubeId,
    this.url,
    this.embedUrl,
    this.image,
  });

  Trailer.fromJson(Map<String, dynamic> json) {
    youtubeId = json['youtube_id'];
    url = json['url'];
    embedUrl = json['embed_url'];
    image = json['image'] != null ? Image.fromJson(json['image']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['youtube_id'] = youtubeId;
    data['url'] = url;
    data['embed_url'] = embedUrl;
    if (image != null) {
      data['image'] = image!.toJson();
    }
    return data;
  }
}