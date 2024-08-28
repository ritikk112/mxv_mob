import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class VideoPlayerPage extends StatelessWidget {
  final int movieId;

  VideoPlayerPage({required this.movieId});

  Future<void> _launchURL(String url) async {
    if (!await launchUrl(Uri.parse(url),
        mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    final videoUrl = 'https://vidsrc.in/embed/movie?tmdb=$movieId';

    return Scaffold(
      appBar: AppBar(
        title: Text('Video Player'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _launchURL(videoUrl),
          child: Text('Play Video'),
        ),
      ),
    );
  }
}
