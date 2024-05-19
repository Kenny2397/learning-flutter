import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toktik/domain/entities/video_entity.dart';
import 'package:toktik/presentation/providers/discover_provider.dart';
import 'package:toktik/presentation/shared/video_buttons.dart';
import 'package:toktik/presentation/widgets/video/video_background.dart';
import 'package:video_player/video_player.dart';

class VideoScrollableView extends StatelessWidget {
  final List<VideoEntity> videos;
  const VideoScrollableView({super.key, required this.videos});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      scrollDirection: Axis.vertical,
      itemCount: videos.length,
      itemBuilder: (context, index) {
        if (index == videos.length - 1) {
          context.read<DiscoverProvider>().loadNextVideo();
        }

        return Stack(
          children: [
            SizedBox.expand(
              child: FullScreenVideoPlayer(
                videoUrl: videos[index].videoUrl,
                caption: videos[index].caption,
              ),
            ),
            Positioned(
              bottom: 50,
              left: 20,
              child: _VideoCaption(caption: videos[index].caption),
            ),
            Positioned(
              bottom: 50,
              right: 10,
              child: VideoButtons(video: videos[index]),
            ),
          ],
        );
      },
    );
  }
}

class _VideoCaption extends StatelessWidget {
  final String caption;
  const _VideoCaption({
    required this.caption,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
        width: size.width * 0.7,
        child: Text(
          caption,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ));
  }
}

class FullScreenVideoPlayer extends StatefulWidget {
  final String videoUrl;
  final String caption;

  const FullScreenVideoPlayer(
      {super.key, required this.videoUrl, required this.caption});

  @override
  State<FullScreenVideoPlayer> createState() => _FullScreenVideoPlayerState();
}

class _FullScreenVideoPlayerState extends State<FullScreenVideoPlayer> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.videoUrl)
      ..setVolume(0)
      ..setLooping(true)
      ..play();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _controller.initialize(),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Center(
            child: CircularProgressIndicator(
              strokeWidth: 2,
            ),
          );
        }

        return GestureDetector(
          onTap: () {
            if (_controller.value.isPlaying) {
              _controller.pause();
              return;
            }
            _controller.play();
            return;
          },
          child: AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: Stack(children: [
              VideoPlayer(_controller),
              VideoBackground(
                colors: const [Colors.transparent, Colors.black87],
                stops: const [0.8, 1],
              ),
            ]),
          ),
        );
      },
    );
  }
}
