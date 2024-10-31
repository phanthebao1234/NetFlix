import 'package:flutter/material.dart';

class VideoVoteAverageWidget extends StatelessWidget {
  const VideoVoteAverageWidget({super.key, required this.vote});
  final double vote;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.star,
          color: Colors.yellow,
          size: 20,
        ),
        const SizedBox(
          width: 5,
        ),
        Text(vote.toStringAsFixed(1)),
      ],
    );
  }
}
