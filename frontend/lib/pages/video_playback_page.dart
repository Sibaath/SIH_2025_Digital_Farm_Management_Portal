import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlaybackPage extends StatefulWidget {
  final String videoPath;

  const VideoPlaybackPage({super.key, required this.videoPath});

  @override
  VideoPlaybackPageState createState() => VideoPlaybackPageState();
}

class VideoPlaybackPageState extends State<VideoPlaybackPage> {
  late VideoPlayerController _videoController;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    // Use VideoPlayerController.asset for local assets
    _videoController = VideoPlayerController.asset(widget.videoPath);
    _initializeVideoPlayerFuture = _videoController.initialize().then((_) {
      _videoController.play();
      _videoController.setLooping(true);
    });
  }

  @override
  void dispose() {
    _videoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AI Video Analysis'),
        backgroundColor: Colors.green,
      ),
      body: FutureBuilder(
        future: _initializeVideoPlayerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Center(
              child: AspectRatio(
                aspectRatio: _videoController.value.aspectRatio,
                child: VideoPlayer(_videoController),
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _videoController.value.isPlaying
                ? _videoController.pause()
                : _videoController.play();
          });
        },
        child: Icon(
          _videoController.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }
}