import 'package:flutter/material.dart';

class VideoOverviewWidget extends StatelessWidget {
  const VideoOverviewWidget({super.key, required this.overView});
  final String overView;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Over View',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          overView,
          style: Theme.of(context).primaryTextTheme.bodyMedium,
          textAlign: TextAlign.justify,
          // style: const TextStyle(fontSize: 16),
          // textAlign: TextAlign.justify,
        ),
      ],
    );
  }
}
