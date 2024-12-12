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
  // ignore: library_private_types_in_public_api
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _videoPlayerController;
  ChewieController? _chewieController;

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
    setState(() {});
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
            Image.network(
              widget.thumbnailUrl,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            IconButton(
              icon: const Icon(Icons.play_circle_filled,
                  size: 64, color: Colors.white),
              onPressed: () {
                // Navigate to video player screen or open inline player
                showDialog(
                  context: context,
                  builder: (context) => Dialog(
                    child: AspectRatio(
                      aspectRatio: _videoPlayerController.value.aspectRatio,
                      child: _chewieController != null
                          ? Chewie(controller: _chewieController!)
                          : Center(child: CircularProgressIndicator()),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ],
    );
  }
}
