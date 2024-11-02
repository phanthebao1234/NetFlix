import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/common/bloc/generic_data_cubit.dart';
import 'package:netflix/common/bloc/generic_data_state.dart';
import 'package:netflix/core/entity/keyword_entity.dart';
import 'package:netflix/domain/tv/usecases/get_keyword_tv.dart';

import 'package:netflix/service_locator.dart';

class TVKeywords extends StatelessWidget {
  const TVKeywords({super.key, required this.tvId, required this.title});
  final int tvId;
  final String title;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GenericDataCubit()
        ..getData<List<KeywordEntity>>(sl<GetKeywordTVsUseCase>(),
            params: tvId),
      child: BlocBuilder<GenericDataCubit, GenericDataState>(
          builder: (context, state) {
        if (state is DataLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is DataLoaded) {
          List<KeywordEntity> keywords = state.data;
          return Wrap(
            spacing: 10,
            children: keywords
                .map((item) => Chip(
                      label: Text(item.name),
                    ))
                .toList(),
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
