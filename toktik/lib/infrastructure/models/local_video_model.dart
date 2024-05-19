import 'package:toktik/domain/entities/video_entity.dart';

class LocalVideoModel {
  final String name;
  final String videoUrl;
  final int likes;
  final int views;

  LocalVideoModel({
    required this.name,
    required this.videoUrl,
    required this.likes,
    required this.views,
  });

  factory LocalVideoModel.modelFromMap(Map<String, dynamic> map) {
    return LocalVideoModel(
      name: map['name'],
      videoUrl: map['videoUrl'],
      likes: map['likes'],
      views: map['views'],
    );
  }

  VideoEntity toVideoEntity() {
    return VideoEntity(
      caption: name,
      videoUrl: videoUrl,
      likes: likes,
      views: views,
    );
  }
}
