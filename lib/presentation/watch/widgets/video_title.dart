import 'package:flutter/material.dart';

class VideoTitleWidget extends StatelessWidget {
  const VideoTitleWidget({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
    );
  }
}
