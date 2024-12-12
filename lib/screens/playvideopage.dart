import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:sih_internship_app/componets/video_player.dart';
import 'package:sih_internship_app/models/video_model.dart';
import 'package:video_player/video_player.dart';

class PlayVideo extends StatefulWidget {
  const PlayVideo({super.key, required this.video, required this.thumbnail});
  final Video video;
  final String thumbnail;
  @override
  State<PlayVideo> createState() => _PlayVideoState();
}

class _PlayVideoState extends State<PlayVideo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          VideoPlayerWidget(
            videoUrl: widget.video.link,
            thumbnailUrl: widget.thumbnail,
            description: widget.video.description,
          ),
        ],
      ),
    );
  }
}
