import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/common/bloc/generic_data_cubit.dart';
import 'package:netflix/common/bloc/generic_data_state.dart';
import 'package:netflix/common/helper/widgets/tv/tv_card.dart';
import 'package:netflix/domain/tv/entities/tv_entity.dart';
import 'package:netflix/domain/tv/usecases/get_similar_tv.dart';
import 'package:netflix/service_locator.dart';

class SimilarTvs extends StatelessWidget {
  const SimilarTvs({super.key, required this.tvId, required this.title});
  final int tvId;
  final String title;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GenericDataCubit()
        ..getData<List<TVEntity>>(sl<GetSimilarTVUseCase>(), params: tvId),
      child: BlocBuilder<GenericDataCubit, GenericDataState>(
          builder: (context, state) {
        if (state is DataLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is DataLoaded) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              SizedBox(
                height: 300,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return TVCard(
                      tvEntity: state.data[index],
                    );
                  },
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 10),
                  itemCount: state.data.length,
                ),
              ),
            ],
          );
        }
        if (state is FailureLoadData) {
          return Text(state.errorMessage);
        }
        return Container();
      }),
    );
  }
}