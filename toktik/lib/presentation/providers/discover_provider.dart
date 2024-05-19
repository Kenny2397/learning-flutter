import 'package:flutter/material.dart';
import 'package:toktik/domain/entities/video_entity.dart';
import 'package:toktik/infrastructure/models/local_video_model.dart';
import 'package:toktik/shared/data/local_video_.dart';

class DiscoverProvider extends ChangeNotifier {
  bool initialLoad = true;

  final List<VideoEntity> videos = [];

  Future<void> loadNextVideo() async {
    // await Future.delayed(const Duration(seconds: 2));

    Iterable<VideoEntity> ilocalVideoEntity = videoPosts.map((video) {
      return LocalVideoModel.modelFromMap(video).toVideoEntity();
    });

    videos.addAll(ilocalVideoEntity);
    initialLoad = false;
    notifyListeners();
  }
}
