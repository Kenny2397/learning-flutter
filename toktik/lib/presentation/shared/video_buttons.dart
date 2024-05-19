import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:toktik/config/helpers/human_formats.dart';
import 'package:toktik/domain/entities/video_entity.dart';

class VideoButtons extends StatelessWidget {
  final VideoEntity video;

  const VideoButtons({super.key, required this.video});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _CustomIconButton(
          icon: Icons.favorite,
          iconColor: Colors.red,
          count: video.likes,
        ),
        _CustomIconButton(
          icon: Icons.remove_red_eye_sharp,
          iconColor: Colors.white,
          count: video.views,
        ),
        SpinPerfect(
          infinite: true,
          duration: const Duration(seconds: 3),
          child: const _CustomIconButton(
            icon: Icons.play_circle_outline,
            iconColor: Colors.white,
          ),
        ),
      ],
    );
  }
}

class _CustomIconButton extends StatelessWidget {
  final int? count;
  final IconData icon;
  final Color? color;

  const _CustomIconButton({
    this.count,
    required this.icon,
    iconColor,
  }) : color = iconColor ?? Colors.white;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            icon,
            color: color,
            size: 30,
          ),
        ),
        if (count != null)
          Text(
            HumanFormats.humanReadableNumberIntl(count!.toDouble()),
            style: const TextStyle(color: Colors.white),
          )
      ],
    );
  }
}
