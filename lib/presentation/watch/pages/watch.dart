import 'package:flutter/material.dart';
import 'package:netflix/common/helper/widgets/appbar/app_bar.dart';
import 'package:netflix/domain/movie/entities/movie.dart';

class MovieWatchPage extends StatelessWidget {
  const MovieWatchPage({super.key, required this.movieEntity});
  final TVEntity movieEntity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(
        hideBack: false,
      ),
    );
  }
}