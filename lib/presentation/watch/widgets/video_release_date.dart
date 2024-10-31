import 'package:flutter/material.dart';

class VideoReleaseDateWidget extends StatelessWidget {
  const VideoReleaseDateWidget({super.key, required this.releaseDate});
  final DateTime releaseDate;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.calendar_month,
          size: 20,
          color: Colors.grey,
        ),
        const SizedBox(
          width: 10.0,
        ),
        Text(
          releaseDate.toString().split(" ")[0],
          style: const TextStyle(color: Colors.grey),
        ),
      ],
    );
  }
}
