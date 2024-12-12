import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class VideoPlayerWidget extends StatefulWidget {
  final String videoUrl;
  final String thumbnailUrl;
  final String description;

  const VideoPlayerWidget({
    super.key,
    required this.videoUrl,
    required this.thumbnailUrl,
    required this.description,
  });

  @override
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _videoPlayerController;
  ChewieController? _chewieController;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.network(widget.videoUrl)
      ..initialize().then((_) {
        setState(() {
          _chewieController = ChewieController(
            videoPlayerController: _videoPlayerController,
            autoPlay: false,
            looping: false,
          );
        });
      });
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Video thumbnail and play button
        Stack(
          alignment: Alignment.center,
          children: [
            if (!_isPlaying) // Show thumbnail if video is not playing
              Image.network(
                widget.thumbnailUrl,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              )
            else if (_chewieController != null &&
                _videoPlayerController.value.isInitialized)
              AspectRatio(
                aspectRatio: _videoPlayerController.value.aspectRatio,
                child: Chewie(controller: _chewieController!),
              )
            else
              const Center(child: CircularProgressIndicator()),

            // Play button on the thumbnail
            if (!_isPlaying)
              IconButton(
                icon: const Icon(Icons.play_circle_filled,
                    size: 64, color: Colors.white),
                onPressed: () {
                  setState(() {
                    _isPlaying = true; // Start playing the video
                    _chewieController?.play(); // Play video
                  });
                },
              ),
          ],
        ),
      ],
    );
  }
}
