import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/presentation/search/bloc/search_cubit.dart';
import 'package:netflix/presentation/search/bloc/selectable_option_cubit.dart';

class SearchFiledWidget extends StatelessWidget {
  const SearchFiledWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: context.read<SearchCubit>().textEditingController,
      onChanged: (value) {
        context
            .read<SearchCubit>()
            .search(value, context.read<SelectOptionCubit>().state);
      },
      decoration: const InputDecoration(hintText: 'Search ...'),
    );
  }
}
