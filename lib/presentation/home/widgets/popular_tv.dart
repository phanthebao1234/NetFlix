import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/common/helper/widgets/tv/tv_card.dart';
import 'package:netflix/presentation/home/bloc/popular_tv_state.dart';

import '../bloc/popular_tv_cubit.dart';

class PopularTV extends StatelessWidget {
  const PopularTV({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PopularTVCubit()..getPopularTV(),
      child: BlocBuilder<PopularTVCubit, PopularTVState>(
          builder: (context, state) {
        if (state is PopularTVLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is PopularTVLoaded) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
              height: 300,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return TVCard(
                    tvEntity: state.tv[index],
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(width: 10),
                itemCount: state.tv.length,
              ),
            ),
          );
        }
        if (state is FailureLoadPopularTV) {
          return Text(state.errorMessage);
        }
        return Container();
      }),
    );
  }
}
