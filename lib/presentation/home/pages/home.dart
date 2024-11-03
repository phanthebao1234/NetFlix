import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:netflix/common/helper/navigation/app_navigation.dart';
import 'package:netflix/common/helper/widgets/appbar/app_bar.dart';
import 'package:netflix/core/configs/assets/app_vectors.dart';
import 'package:netflix/presentation/home/widgets/category_text.dart';
import 'package:netflix/presentation/home/widgets/now_playing_movies.dart';
import 'package:netflix/presentation/home/widgets/popular_tv.dart';
// import 'package:netflix/presentation/home/widgets/feature_movies.dart';
import 'package:netflix/presentation/home/widgets/trending_movies.dart';
import 'package:netflix/presentation/search/pages/search.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(
        action: IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {
            AppNavigator.push(context, const SearchPage());
          },
        ),
        hideBack: true,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: SvgPicture.asset(AppVectors.logo),
        ),
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            CategoryText(title: 'Trendings 🔥'),
            TrendingMovies(),
            SizedBox(
              height: 15,
            ),
            CategoryText(title: 'Now Playing ▶️'),
            SizedBox(
              height: 15,
            ),
            SizedBox(
              height: 15,
            ),
            NowPlayingMovies(),
            SizedBox(
              height: 15,
            ),
            CategoryText(title: 'Popular TV 📺'),
            SizedBox(
              height: 15,
            ),
            PopularTV(),
            SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}
